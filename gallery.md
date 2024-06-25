---
layout: gallery
title: Photo Gallery
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
show_sidebar: false
---

## Connect Lab at work and at play 

<div class="slick-slider">
  {% for slide in site.data.gallery_slides %}
    <div>
      <img src="{{ slide.image }}" alt="{{ slide.description }}">
    </div>
  {% endfor %}
</div>

