(function () {
  const apiKey = 'aaab877eae3850bf7b5c7f145eb045a0';
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

      window.jQuery(track).slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true,
        arrows: true,
        adaptiveHeight: true,
        lazyLoad: 'ondemand',
        autoplay: true,
        autoplaySpeed: 4500
      });

      window.jQuery(track).on('lazyLoaded', () => {
        window.jQuery(track).slick('setPosition');
      });
    } catch (err) {
      container.textContent = 'Unable to load Flickr album right now.';
    }
  }

  document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.flickr-carousel').forEach((container) => {
      initCarousel(container);
    });
  });
})();
