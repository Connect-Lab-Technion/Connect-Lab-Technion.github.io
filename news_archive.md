---
layout: page
title: News Archives
show_sidebar: false
hide_footer: false
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
---


<ul class="news-archive-list">
  {% assign sorted_news = site.news | sort: 'date' | reverse %}
  {% for news in sorted_news %}
    <li>
      <a href="{{ news.url }}">{{ news.title }}</a>
      <span class="news-date">{{ news.date | date: "%B %-d, %Y" }}</span>
      <p class="news-description">{{ news.description | escape }}</p>
    </li>
  {% endfor %}
</ul>