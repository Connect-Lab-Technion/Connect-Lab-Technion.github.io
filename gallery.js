
import PhotoSwipeLightbox from 'https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe-lightbox.esm.min.js';

const apiKey = 'aaab877eae3850bf7b5c7f145eb045a0';
const userId = '1yen';
const albums = {
  'work': '72177720325960052',
  'social': '72177720325957766'
};

async function fetchPhotos(photosetId) {
  const url = `https://www.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=${apiKey}&photoset_id=${photosetId}&user_id=${userId}&format=json&nojsoncallback=1`;
  const res = await fetch(url);
  const data = await res.json();
  return data.photoset.photo.map(p => {
    const src = `https://live.staticflickr.com/${p.server}/${p.id}_${p.secret}_b.jpg`;
    const thumb = `https://live.staticflickr.com/${p.server}/${p.id}_${p.secret}_n.jpg`;
    return { src, thumb, w: 1600, h: 1200, title: p.title };
  });
}

async function buildGallery(containerId, photosetId) {
  const photos = await fetchPhotos(photosetId);
  const container = document.getElementById(containerId);
  photos.forEach((p, i) => {
    const link = document.createElement('a');
    link.href = p.src;
    link.setAttribute('data-pswp-width', p.w);
    link.setAttribute('data-pswp-height', p.h);
    link.setAttribute('data-cropped', 'true');
    link.setAttribute('data-pswp-index', i);
    const img = document.createElement('img');
    img.src = p.thumb;
    img.alt = p.title;
    link.appendChild(img);
    container.appendChild(link);
  });

  const lightbox = new PhotoSwipeLightbox({
    gallery: '#' + containerId,
    children: 'a',
    pswpModule: () => import('https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe.esm.min.js')
  });
  lightbox.init();
}

buildGallery('work-gallery', albums.work);
buildGallery('social-gallery', albums.social);
