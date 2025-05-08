---
layout: gallery
title: Photo Gallery
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
show_sidebar: false
---

<h1>CONNECT Lab Gallery</h1>

<h2>Work at CONNECT Lab</h2>
<div class="gallery" id="work-gallery"></div>

<h2>Social Moments</h2>
<div class="gallery" id="social-gallery"></div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe.css"/>
<style>
  .gallery { display: flex; flex-wrap: wrap; gap: 10px; }
  .gallery a { width: 200px; height: 150px; overflow: hidden; display: block; }
  .gallery img { width: 100%; height: auto; display: block; }
</style>

<div id="pswp" class="pswp" tabindex="-1" role="dialog" aria-hidden="true"></div>

<script type="module">
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
</script>
