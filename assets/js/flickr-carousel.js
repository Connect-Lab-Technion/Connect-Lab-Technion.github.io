(function () {
  const apiKey = 'aaab877eae3850bf7b5c7f145eb045a0';
  const COVERFLOW_DESKTOP_SLIDES = 5;
  const COVERFLOW_TABLET_SLIDES = 3;
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

  function applyCoverflowClasses(track) {
    const $track = window.jQuery(track);
    const $slides = $track.find('.slick-slide');
    $slides.removeClass('is-left-1 is-left-2 is-right-1 is-right-2');

    const $center = $track.find('.slick-slide.slick-center').first();
    if (!$center.length) {
      return;
    }

    $center
      .prevAll('.slick-active')
      .slice(0, 2)
      .each((idx, el) => {
        window.jQuery(el).addClass(idx === 0 ? 'is-left-1' : 'is-left-2');
      });

    $center
      .nextAll('.slick-active')
      .slice(0, 2)
      .each((idx, el) => {
        window.jQuery(el).addClass(idx === 0 ? 'is-right-1' : 'is-right-2');
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
    header.textContent = title;
    container.appendChild(header);

    const track = document.createElement('div');
    track.className = 'flickr-carousel-track';
    container.appendChild(track);

    try {
      const photos = await fetchPhotos(photosetId);
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
      const desktopSlidesToShow = Math.min(COVERFLOW_DESKTOP_SLIDES, photos.length);
      const tabletSlidesToShow = Math.min(COVERFLOW_TABLET_SLIDES, photos.length);

      window.jQuery(track).slick({
        slidesToShow: desktopSlidesToShow,
        slidesToScroll: 1,
        centerMode: hasMultiplePhotos,
        centerPadding: hasMultiplePhotos ? '2%' : '0px',
        focusOnSelect: hasMultiplePhotos,
        infinite: photos.length > desktopSlidesToShow,
        dots: true,
        arrows: true,
        adaptiveHeight: false,
        lazyLoad: 'ondemand',
        autoplay: true,
        autoplaySpeed: 4500,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: tabletSlidesToShow,
              centerMode: hasMultiplePhotos,
              centerPadding: hasMultiplePhotos ? '10%' : '0px',
              infinite: photos.length > tabletSlidesToShow
            }
          },
          {
            breakpoint: 640,
            settings: {
              slidesToShow: 1,
              centerMode: hasMultiplePhotos,
              centerPadding: hasMultiplePhotos ? '18%' : '0px',
              infinite: hasMultiplePhotos
            }
          }
        ]
      });

      applyCoverflowClasses(track);

      window.jQuery(track).on('lazyLoaded', () => {
        window.jQuery(track).slick('setPosition');
        applyCoverflowClasses(track);
      });

      window.jQuery(track).on('afterChange', () => {
        applyCoverflowClasses(track);
      });

      track.addEventListener('click', (event) => {
        const image = event.target.closest('img');
        if (!image) {
          return;
        }

        const slide = image.closest('.slick-slide');
        if (!slide || !slide.classList.contains('slick-center')) {
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
