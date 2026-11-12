---
title: Cooperative Networks and Controls Lab
layout: page
show_sidebar: false
hide_hero: true
hide_footer: false
---

<div class="home-alt">
  <section class="home-alt-hero" aria-labelledby="alt-title">
    <div class="home-alt-hero__intro">
      <p class="home-alt-kicker">Cooperative Networks and Controls Lab · Technion</p>
      <h1 id="alt-title">Mathematical structure behind <em>collective behavior.</em></h1>
      <p>We develop theory for networked dynamical and multi-agent systems at the intersection of control, graph theory, geometry, and optimization.</p>
      <div class="home-alt-links">
        <a href="{{ site.baseurl }}/research/">Research areas <span aria-hidden="true">↗</span></a>
        <a href="{{ site.baseurl }}/publications/">Publications <span aria-hidden="true">↗</span></a>
      </div>
    </div>

    <article class="home-alt-feature" aria-labelledby="featured-paper-title">
      <div class="home-alt-feature__label"><span>Paper of the week</span><time id="featured-paper-date" datetime="2026">2026</time></div>
      <img id="featured-paper-figure" src="{{ site.baseurl }}/img/home/transversal-passivity-paper.png" alt="Representative figure for the featured paper">
      <div class="home-alt-feature__copy">
        <p class="home-alt-tag" id="featured-paper-topic">Geometric systems theory</p>
        <h2 id="featured-paper-title">Transversal Passivity: Dissipation Relative to Input and Output Manifolds</h2>
        <p class="home-alt-feature__meta" id="featured-paper-authors">Fengyu Yue and Daniel Zelazo · 2026</p>
        <p id="featured-paper-description">Classical passivity measures energy relative to an equilibrium. This work develops a framework that measures only the error transverse to prescribed manifolds—allowing motion along the target while retaining feedback and convergence guarantees.</p>
        <div class="home-alt-feature__actions">
          <a id="featured-paper-link" href="https://arxiv.org/abs/2611.06251">Read the paper <span aria-hidden="true">→</span></a>
          <a href="{{ site.baseurl }}/publications/">Browse publications</a>
        </div>
      </div>
    </article>
  </section>

  <section class="home-alt-questions" aria-labelledby="questions-title">
    <div class="home-alt-section-title">
      <p>Our perspective</p>
      <h2 id="questions-title">The questions that drive us</h2>
    </div>
    <ol>
      <li>
        <span>01</span>
        <figure class="home-alt-question-figure"><img src="{{ site.baseurl }}/img/home/paper-interface-reduction.png" alt="Network with designated control and output nodes"><figcaption>Interface structure</figcaption></figure>
        <p>How does network structure shape stability and performance?</p>
      </li>
      <li>
        <span>02</span>
        <figure class="home-alt-question-figure"><img src="{{ site.baseurl }}/img/home/question-geometry.svg" alt="Rigid and flexible frameworks, together with a shape shown at two scales"><figcaption>Rigid · flexible · scale</figcaption></figure>
        <p>Which geometric properties make collective objectives achievable?</p>
      </li>
      <li>
        <span>03</span>
        <figure class="home-alt-question-figure"><img src="{{ site.baseurl }}/img/home/question-convergence.svg" alt="Three-dimensional agent trajectories converging to a target formation"><figcaption>Trajectories → target shape</figcaption></figure>
        <p>How can local interactions produce reliable global behavior?</p>
      </li>
      <li>
        <span>04</span>
        <figure class="home-alt-question-figure"><img src="{{ site.baseurl }}/img/home/question-inference.svg" alt="Observed signals entering an inference method that outputs a network graph"><figcaption>Measurements → inferred graph</figcaption></figure>
        <p>What can be inferred, optimized, or secured from limited network information?</p>
      </li>
    </ol>
  </section>

  <section class="home-alt-news" aria-labelledby="alt-news-title">
    <div class="home-alt-section-title home-alt-section-title--row">
      <div><p>Notes from the lab</p><h2 id="alt-news-title">Recent news</h2></div>
      <a href="{{ site.baseurl }}/news_archive/">News archive →</a>
    </div>
    <div class="home-alt-news__list">
      {% assign sorted_news = site.news | sort: 'date' | reverse %}
      {% for news in sorted_news limit:4 %}
      <a href="{{ site.baseurl }}{{ news.url }}">
        <time datetime="{{ news.date | date: '%Y-%m-%d' }}">{{ news.date | date: "%d.%m.%Y" }}</time>
        <h3>{{ news.title }}</h3>
        <span aria-hidden="true">↗</span>
      </a>
      {% endfor %}
    </div>
  </section>

  <section class="home-alt-footer-cta">
    <p>Students &amp; researchers</p>
    <h2>Interested in the theory of interconnected systems?</h2>
    <a href="{{ site.baseurl }}/Positions/">Work with us <span aria-hidden="true">→</span></a>
  </section>
</div>

<script type="application/json" id="featured-paper-data">{{ site.data.featured_papers | jsonify }}</script>
<script>
(function () {
  var source = document.getElementById('featured-paper-data');
  if (!source) return;

  var papers;
  try { papers = JSON.parse(source.textContent); } catch (error) { return; }
  if (!papers || !papers.length) return;

  var maxYear = Math.max.apply(null, papers.map(function (paper) { return paper.year; }));
  var topicNames = {
    passivity: 'Passivity & nonlinear systems', formationcontrol: 'Formation control',
    consensus: 'Consensus & collective behavior', nds: 'Networked dynamical systems',
    optimization: 'Optimization over networks', eventtrigger: 'Event-triggered control',
    robotics: 'Multi-robot systems', secure: 'Resilient & secure networks', energy: 'Energy systems'
  };
  var topicDescriptions = {
    passivity: 'A systems-theoretic study of energy, interconnection, and stability in nonlinear or networked dynamics.',
    formationcontrol: 'A geometric study of how sensing, rigidity, and feedback shape coordinated formations.',
    consensus: 'A study of how local interaction laws generate agreement and collective dynamics across a network.',
    nds: 'A systems perspective on how graph structure and local dynamics determine global network behavior.',
    optimization: 'A study of computation and decision-making when information is distributed across a network.',
    eventtrigger: 'A study of when networked agents should communicate or update while preserving stability and performance.',
    robotics: 'A study of coordination, sensing, and control for teams of autonomous robots.',
    secure: 'A study of inference, resilience, and control when network information is limited or unreliable.',
    energy: 'A network-systems approach to analysis, optimization, and control in energy applications.'
  };

  function hash(text) {
    var value = 2166136261;
    for (var i = 0; i < text.length; i += 1) {
      value ^= text.charCodeAt(i);
      value = Math.imul(value, 16777619);
    }
    return value >>> 0;
  }

  papers.forEach(function (paper) {
    paper.weight = Math.max(1, 8 - (maxYear - paper.year) * 2);
  });
  papers.sort(function (a, b) { return hash(a.key) - hash(b.key); });

  var schedule = [];
  for (var round = 1; round <= 8; round += 1) {
    var candidates = papers.filter(function (paper) { return paper.weight >= round; });
    if (!candidates.length) continue;
    var offset = round % candidates.length;
    candidates = candidates.slice(offset).concat(candidates.slice(0, offset));
    if (schedule.length && candidates.length > 1 && schedule[schedule.length - 1].key === candidates[0].key) {
      candidates.push(candidates.shift());
    }
    schedule = schedule.concat(candidates);
  }
  if (!schedule.length) return;

  var now = new Date();
  var isoDate = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate()));
  var isoDay = isoDate.getUTCDay() || 7;
  isoDate.setUTCDate(isoDate.getUTCDate() + 4 - isoDay);
  var isoYear = isoDate.getUTCFullYear();
  var yearStart = new Date(Date.UTC(isoYear, 0, 1));
  var isoWeek = Math.ceil((((isoDate - yearStart) / 86400000) + 1) / 7);
  var week = Math.floor((Date.now() + 3 * 86400000) / 604800000);
  var paper = schedule[week % schedule.length];
  var primaryTopic = (paper.topics || []).find(function (topic) { return topicNames[topic]; });
  var description = paper.description || topicDescriptions[primaryTopic] ||
    'A contribution from the group on the mathematical foundations of interconnected dynamical systems.';
  if (description.length > 360) description = description.slice(0, 357).replace(/\s+\S*$/, '') + '…';

  document.getElementById('featured-paper-title').textContent = paper.title;
  document.getElementById('featured-paper-topic').textContent = topicNames[primaryTopic] || 'Network systems & control';
  document.getElementById('featured-paper-authors').textContent = paper.authors + ' · ' + paper.year;
  document.getElementById('featured-paper-description').textContent = description;
  document.getElementById('featured-paper-date').textContent = 'Week ' + isoWeek + ' · ' + isoYear;
  document.getElementById('featured-paper-date').setAttribute('datetime', isoYear + '-W' + String(isoWeek).padStart(2, '0'));
  document.getElementById('featured-paper-link').href = paper.link;
  var figure = document.getElementById('featured-paper-figure');
  figure.onerror = function () {
    if (figure.dataset.fallbackApplied) return;
    figure.dataset.fallbackApplied = 'true';
    figure.src = '{{ site.baseurl }}/img/logos/Connect_logo_full.png';
    figure.alt = 'Connect Lab';
  };
  figure.src = '{{ site.baseurl }}' + paper.figure;
  figure.alt = paper.figure_alt || ('Figure from “' + paper.title + '”');
}());
</script>

