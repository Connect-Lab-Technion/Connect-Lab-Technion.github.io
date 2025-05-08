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

## Photo Grid

<div class="columns is-multiline">
  {% for slide in site.data.gallery_slides %}
    <div class="column is-one-quarter-desktop is-half-tablet">
      <div class="card">
        <div class="card-image">
          <figure class="image">
            <img src="{{ slide.image }}" alt="{{ slide.description }}" style="width: 100%; height: auto; object-fit: contain;">
          </figure>
        </div>
      </div>
    </div>
  {% endfor %}
</div>