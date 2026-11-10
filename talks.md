---
layout: default
title: Seminars & Talks
hide_hero: true
full_width: true
show_sidebar: false
---

<div class="talks-catalogue">
  <header class="talks-catalogue__hero">
    <p class="site-kicker">Connect Lab · Technion</p>
    <h1>Seminars<br>&amp; talks.</h1>
    <p>Lectures that develop the ideas behind our research—from plenary and invited presentations to focused seminars.</p>
    <nav aria-label="Talk categories">
      <a href="#invited">Invited &amp; plenary</a>
      <a href="#seminars">Seminars</a>
    </nav>
  </header>

  <section id="invited" class="talks-catalogue__section">
    <header><p class="site-kicker">Selected appearances</p><h2>Plenary, invited &amp; workshop talks</h2></header>
    {% bibliography --file DZ_TalksPosters --query @*[researchtopic~=invited]--group_by none --order descending %}
  </section>

  <section id="seminars" class="talks-catalogue__section">
    <header><p class="site-kicker">Research seminars</p><h2>Seminar talks</h2></header>
    {% bibliography --file DZ_TalksPosters --query @*[researchtopic~=talk]--group_by none --order descending %}
  </section>
</div>
