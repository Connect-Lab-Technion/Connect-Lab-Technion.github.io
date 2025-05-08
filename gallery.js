
(function () {
  const apiKey = 'aaab877eae3850bf7b5c7f145eb045a0';
  const userId = '62929416@N00';
  const albums = {
    'work': '72177720325960052',
    'social': '72177720325957766'
  };

  function fetchPhotos(photosetId) {
    const url = `https://www.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=${apiKey}&photoset_id=${photosetId}&user_id=${userId}&format=json&nojsoncallback=1`;
    return fetch(url)
      .then(res => res.json())
      .then(data => {
        return data.photoset.photo.map(p => {
          const src = `https://live.staticflickr.com/${p.server}/${p.id}_${p.secret}_b.jpg`;
          const thumb = `https://live.staticflickr.com/${p.server}/${p.id}_${p.secret}_n.jpg`;
          return { src, thumb, w: 1600, h: 1200, title: p.title };
        });
      });
  }

  function buildGallery(containerId, photosetId) {
    fetchPhotos(photosetId).then(photos => {
      const container = document.getElementById(containerId);
      photos.forEach((p, i) => {
        const link = document.createElement('a');
        link.href = p.src;
        link.setAttribute('data-pswp-width', p.w);
        link.setAttribute('data-pswp-height', p.h);
        link.setAttribute('data-cropped', 'true');
        const img = document.createElement('img');
        img.src = p.thumb;
        img.alt = p.title;
        link.appendChild(img);
        container.appendChild(link);
      });

      const lightbox = new PhotoSwipeLightbox({
        gallery: '#' + containerId,
        children: 'a',
        pswpModule: PhotoSwipe
      });
      lightbox.init();
    });
  }

  buildGallery('work-gallery', albums.work);
  buildGallery('social-gallery', albums.social);
})();
