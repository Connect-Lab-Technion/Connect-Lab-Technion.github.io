---
layout: default
title: News Archive
hide_hero: true
full_width: true
show_sidebar: false
---

<div class="news-index">
  <header class="news-index__hero">
    <p class="site-kicker">Connect Lab · Technion</p>
    <h1>News from<br>the lab.</h1>
    <p>New results, people, awards, events, and other moments from the Connect Lab community.</p>
  </header>
  <ol class="news-index__list">
    {% assign sorted_news = site.news | sort: 'date' | reverse %}
    {% for news in sorted_news %}
      <li>
        <a href="{{ news.url | relative_url }}">
          <time datetime="{{ news.date | date_to_xmlschema }}">{{ news.date | date: "%b %Y" }}</time>
          <div><h2>{{ news.title }}</h2>{% if news.description %}<p>{{ news.description | escape }}</p>{% endif %}</div>
          <span aria-hidden="true">→</span>
        </a>
      </li>
    {% endfor %}
  </ol>
</div>
