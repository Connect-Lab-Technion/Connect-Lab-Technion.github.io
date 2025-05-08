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

<script src="https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe-lightbox.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe.umd.min.js"></script>
<script src="/gallery.js"></script>