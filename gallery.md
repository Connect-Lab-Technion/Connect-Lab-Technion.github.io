 ---
layout: gallery
title: Photo Gallery
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
show_sidebar: false
---

<h1>CONNECT Lab Gallery</h1>

<h2>Work at CONNECT Lab</h2>
<div class="gallery-wrapper" id="work-gallery"></div>

<h2>Social Moments</h2>
<div class="gallery-wrapper" id="social-gallery"></div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe.css"/>
<style>
  .gallery-wrapper {
    overflow-x: auto;
    overflow-y: hidden;
    white-space: nowrap;
    padding-bottom: 1em;
    scroll-snap-type: x mandatory;
    -webkit-overflow-scrolling: touch;
  }

  .gallery-wrapper a {
    display: inline-block;
    margin-right: 10px;
    scroll-snap-align: start;
    width: 200px;
    height: 150px;
  }

  .gallery-wrapper img {
    width: 100%;
    height: auto;
    border-radius: 4px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    display: block;
  }
</style>

<div id="pswp" class="pswp" tabindex="-1" role="dialog" aria-hidden="true"></div>

<script src="https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe-lightbox.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe.umd.min.js"></script>
<script src="/gallery.js"></script>
