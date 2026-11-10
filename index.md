---
title: Cooperative Networks and Controls Lab
layout: page
show_sidebar: false
hide_hero: true
hide_footer: false
---

<div class="home-page">
  <section class="home-hero" aria-labelledby="home-title">
    <div class="home-hero__copy">
      <p class="home-eyebrow">Cooperative Networks and Controls Lab · Technion</p>
      <h1 id="home-title">Theory for <span>networked dynamical systems.</span></h1>
      <p class="home-intro">We develop mathematical foundations for coordination, stability, and performance in multi-agent systems—where systems and control theory meets graph theory.</p>
      <div class="home-actions">
        <a class="home-button home-button--primary" href="{{ site.baseurl }}/research/">Explore our research <span aria-hidden="true">→</span></a>
        <a class="home-button home-button--secondary" href="{{ site.baseurl }}/current-members/">Meet the team</a>
      </div>
    </div>
    <figure class="home-hero__visual home-hero__visual--figure">
      <img src="{{ site.baseurl }}/img/home/geometric-passivity.webp" alt="Geometric decomposition into motion tangent and transverse to a target manifold" width="1536" height="1024" fetchpriority="high">
      <figcaption><span>Geometric passivity</span>Separating motion along a target manifold from transverse disagreement</figcaption>
    </figure>
  </section>

  <section class="home-mission" aria-labelledby="mission-title">
    <div>
      <p class="home-section-label">Our mission</p>
      <h2 id="mission-title">Understanding networks.<br>Enabling cooperation.</h2>
    </div>
    <div class="home-mission__text">
      <p>The Connect Lab develops theory for the fundamental challenges behind coordination in networked and multi-agent systems. Our work draws on systems and control, graph theory, geometry, and optimization.</p>
      <p>We are part of the <a href="https://aerospace.technion.ac.il/">Stephen B. Klein Faculty of Aerospace Engineering</a> at the <a href="https://www.technion.ac.il/">Technion – Israel Institute of Technology</a>, with our physical home in the <a href="https://pfcl.technion.ac.il/">Philadelphia Flight Control Laboratory</a>.</p>
    </div>
  </section>

  <section class="home-research" aria-labelledby="research-title">
    <div class="home-section-heading">
      <div>
        <p class="home-section-label">What we explore</p>
        <h2 id="research-title">Theory at the dynamics–graph interface</h2>
      </div>
      <a class="home-text-link" href="{{ site.baseurl }}/research/">View all research <span aria-hidden="true">→</span></a>
    </div>
    <div class="home-research-grid">
      <a class="home-research-card home-research-card--wide" href="{{ site.baseurl }}/research/research-Formation%20Control/">
        <img src="{{ site.baseurl }}/img/home/formation-trajectories.png" alt="Trajectories of a four-agent formation converging to a target framework" loading="lazy">
        <div class="home-research-card__body"><span>01</span><h3>Rigidity &amp; formation control</h3><p>Geometry, controllability, and stability for formations with directed and undirected sensing.</p></div>
      </a>
      <a class="home-research-card" href="{{ site.baseurl }}/research/research-Passivity/">
        <img src="{{ site.baseurl }}/img/home/transversal-passivity-paper.png" alt="Input and output manifolds in the transversal passivity framework" loading="lazy">
        <div class="home-research-card__body"><span>02</span><h3>Geometric passivity</h3><p>Dissipation and feedback theory relative to manifolds rather than isolated equilibria.</p></div>
      </a>
      <a class="home-research-card" href="{{ site.baseurl }}/research/research-networked-systems/">
        <img src="{{ site.baseurl }}/img/home/network-dynamics.webp" alt="A dynamical system interconnected with a communication graph in a feedback loop" loading="lazy">
        <div class="home-research-card__body"><span>03</span><h3>Network dynamics &amp; consensus</h3><p>Structural methods for collective behavior, identification, reduction, and resilience.</p></div>
      </a>
    </div>
  </section>

  <section class="home-news" aria-labelledby="news-title">
    <div class="home-section-heading">
      <div><p class="home-section-label">From the lab</p><h2 id="news-title">Latest news</h2></div>
      <a class="home-text-link" href="{{ site.baseurl }}/news_archive/">All news <span aria-hidden="true">→</span></a>
    </div>
    <div class="home-news-grid">
      {% assign sorted_news = site.news | sort: 'date' | reverse %}
      {% for news in sorted_news limit:6 %}
        <article class="home-news-card">
          <time datetime="{{ news.date | date: '%Y-%m-%d' }}">{{ news.date | date: "%d %b %Y" }}</time>
          <h3><a href="{{ site.baseurl }}{{ news.url }}">{{ news.title }}</a></h3>
          {% if news.description %}<p>{{ news.description | escape }}</p>{% endif %}
          <a class="home-news-card__link" href="{{ site.baseurl }}{{ news.url }}" aria-label="Read {{ news.title | escape }}">Read story <span aria-hidden="true">↗</span></a>
        </article>
      {% endfor %}
    </div>
  </section>

  <section class="home-join" aria-labelledby="join-title">
    <div><p class="home-section-label">Join the network</p><h2 id="join-title">Curious minds are always welcome.</h2></div>
    <div><p>We are always looking for highly motivated students and researchers who want to rethink how autonomous systems cooperate.</p><a class="home-button home-button--light" href="{{ site.baseurl }}/Positions/">See open opportunities <span aria-hidden="true">→</span></a></div>
  </section>
</div>
