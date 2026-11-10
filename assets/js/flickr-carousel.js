(function () {
  const apiKey = 'aaab877eae3850bf7b5c7f145eb045a0';
  const DESKTOP_SLIDES = 3;
  const TABLET_SLIDES = 2;
  let lightboxBound = false;

  function ensureLightbox() {
    if (document.getElementById('flickr-lightbox')) {
      return;
    }

    const lightbox = document.createElement('div');
    lightbox.id = 'flickr-lightbox';
    lightbox.className = 'flickr-lightbox';
    lightbox.innerHTML = `
      <button class="flickr-lightbox-close" type="button" aria-label="Close lightbox">&times;</button>
      <img class="flickr-lightbox-image" alt="">
      <div class="flickr-lightbox-caption"></div>
    `;
    document.body.appendChild(lightbox);
  }

  function openLightbox(src, caption) {
    ensureLightbox();
    const lightbox = document.getElementById('flickr-lightbox');
    if (!lightbox) {
      return;
    }

    const image = lightbox.querySelector('.flickr-lightbox-image');
    const captionEl = lightbox.querySelector('.flickr-lightbox-caption');
    image.src = src;
    image.alt = caption || '';
    captionEl.textContent = caption || '';
    lightbox.classList.add('is-open');
    document.body.classList.add('flickr-lightbox-open');
  }

  function closeLightbox() {
    const lightbox = document.getElementById('flickr-lightbox');
    if (!lightbox) {
      return;
    }
    lightbox.classList.remove('is-open');
    document.body.classList.remove('flickr-lightbox-open');
  }

  function bindLightboxEvents() {
    if (lightboxBound) {
      return;
    }
    lightboxBound = true;

    document.addEventListener('click', (event) => {
      const closeBtn = event.target.closest('.flickr-lightbox-close');
      const lightbox = event.target.classList.contains('flickr-lightbox')
        ? event.target
        : null;

      if (closeBtn || (lightbox && lightbox.classList.contains('is-open'))) {
        closeLightbox();
      }
    });

    document.addEventListener('keydown', (event) => {
      if (event.key === 'Escape') {
        closeLightbox();
      }
    });
  }

  async function fetchPhotos(photosetId) {
    const url = `https://www.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=${apiKey}&photoset_id=${photosetId}&format=json&nojsoncallback=1`;
    const res = await fetch(url);
    const data = await res.json();
    if (!data || !data.photoset || !data.photoset.photo) {
      throw new Error('No photos returned from Flickr.');
    }
    return data.photoset.photo.map((p) => {
      const src = `https://live.staticflickr.com/${p.server}/${p.id}_${p.secret}_b.jpg`;
      const caption = p.title || '';
      return { src, caption };
    });
  }

  function buildSlide(photo) {
    const slide = document.createElement('div');
    slide.className = 'flickr-slide';

    const figure = document.createElement('figure');
    figure.className = 'flickr-figure';

    const img = document.createElement('img');
    img.setAttribute('data-lazy', photo.src);
    img.setAttribute('alt', photo.caption);

    figure.appendChild(img);

    if (photo.caption) {
      const caption = document.createElement('figcaption');
      caption.textContent = photo.caption;
      figure.appendChild(caption);
    }

    slide.appendChild(figure);
    return slide;
  }

  async function initCarousel(container) {
    const photosetId = container.dataset.photosetId;
    const title = container.dataset.title || 'Photo carousel';

    if (!photosetId) {
      container.textContent = 'Missing Flickr album ID.';
      return;
    }

    const header = document.createElement('div');
    header.className = 'flickr-carousel-header';
    header.innerHTML = `<span>${title}</span><small>Loading photographs…</small>`;
    container.appendChild(header);

    const track = document.createElement('div');
    track.className = 'flickr-carousel-track';
    container.appendChild(track);

    try {
      const photos = await fetchPhotos(photosetId);
      header.querySelector('small').textContent = `${photos.length} photographs · select an image to enlarge`;
      photos.forEach((photo) => track.appendChild(buildSlide(photo)));

      track.querySelectorAll('img').forEach((img) => {
        img.addEventListener('load', () => {
          if (window.jQuery && window.jQuery(track).hasClass('slick-initialized')) {
            window.jQuery(track).slick('setPosition');
          }
        });
      });

      if (typeof window.jQuery === 'undefined' || typeof window.jQuery(track).slick !== 'function') {
        container.classList.add('flickr-carousel--no-slick');
        return;
      }

      const hasMultiplePhotos = photos.length > 1;
      const desktopSlidesToShow = Math.min(DESKTOP_SLIDES, photos.length);
      const tabletSlidesToShow = Math.min(TABLET_SLIDES, photos.length);

      window.jQuery(track).slick({
        slidesToShow: desktopSlidesToShow,
        slidesToScroll: 1,
        centerMode: false,
        focusOnSelect: false,
        infinite: photos.length > desktopSlidesToShow,
        dots: false,
        arrows: true,
        adaptiveHeight: false,
        lazyLoad: 'ondemand',
        autoplay: false,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: tabletSlidesToShow,
              centerMode: false,
              infinite: photos.length > tabletSlidesToShow
            }
          },
          {
            breakpoint: 640,
            settings: {
              slidesToShow: 1.08,
              centerMode: false,
              infinite: hasMultiplePhotos
            }
          }
        ]
      });

      window.jQuery(track).on('lazyLoaded', () => {
        window.jQuery(track).slick('setPosition');
      });

      track.addEventListener('click', (event) => {
        const image = event.target.closest('img');
        if (!image) {
          return;
        }

        const src = image.getAttribute('src') || image.getAttribute('data-lazy');
        if (!src) {
          return;
        }
        openLightbox(src, image.getAttribute('alt') || '');
      });
    } catch (err) {
      container.textContent = 'Unable to load Flickr album right now.';
    }
  }

  document.addEventListener('DOMContentLoaded', () => {
    bindLightboxEvents();
    ensureLightbox();
    document.querySelectorAll('.flickr-carousel').forEach((container) => {
      initCarousel(container);
    });
  });
})();
