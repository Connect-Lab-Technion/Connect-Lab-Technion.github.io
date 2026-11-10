---
layout: page
title: Publications
show_sidebar: false
hide_footer: false
hide_hero: true
---

<div class="publications-index" id="publications-top">
  <header class="publications-hero">
    <p class="publications-kicker">Research output · Connect Lab</p>
    <h1>Publications.</h1>
    <p class="publications-intro">Our work develops mathematical foundations for networked and multi-agent systems, from graph structure and geometric control to passivity, resilience, optimization, and robotic validation.</p>
    <nav class="publications-view-switch" aria-label="Publication views">
      <a class="is-active" href="{{ '/publications/' | relative_url }}">By year</a>
      <a href="{{ '/publications_by_type/' | relative_url }}">By type</a>
      <a href="{{ '/talks/' | relative_url }}">Talks &amp; slides</a>
    </nav>
  </header>

  <section class="publications-tools" aria-labelledby="publication-search-title">
    <div>
      <p class="publications-kicker">Find a work</p>
      <h2 id="publication-search-title">Search the catalogue.</h2>
    </div>
    <div class="publications-search-wrap">
      <label class="sr-only" for="publication-search">Search publications</label>
      <input id="publication-search" type="search" placeholder="Title, author, venue, or keyword…" autocomplete="off">
      <button id="publication-search-clear" type="button">Clear</button>
      <p id="publication-search-status" aria-live="polite"></p>
    </div>
  </section>

  <nav class="publications-year-nav" aria-label="Jump to year">
    <span>Jump to</span>
    <a href="#year-2026">2026</a><a href="#year-2025">2025</a><a href="#year-2024">2024</a><a href="#year-2023">2023</a><a href="#year-2022">2022</a><a href="#publication-archive">Earlier</a>
  </nav>

  <section class="publications-recent" aria-labelledby="recent-publications-title">
    <div class="publications-section-heading">
      <p class="publications-kicker">Current work</p>
      <h2 id="recent-publications-title">Recent publications.</h2>
    </div>

    <section class="publication-year" id="year-2026">
      <div class="publication-year__label"><span>2026</span><a href="#publications-top">Top ↑</a></div>
      <div class="publication-year__list">{% bibliography --query @*[year=2026] --group_by none %}</div>
    </section>
    <section class="publication-year" id="year-2025">
      <div class="publication-year__label"><span>2025</span><a href="#publications-top">Top ↑</a></div>
      <div class="publication-year__list">{% bibliography --query @*[year=2025] --group_by none %}</div>
    </section>
    <section class="publication-year" id="year-2024">
      <div class="publication-year__label"><span>2024</span><a href="#publications-top">Top ↑</a></div>
      <div class="publication-year__list">{% bibliography --query @*[year=2024] --group_by none %}</div>
    </section>
  </section>

  <section class="publications-archive" id="publication-archive" aria-labelledby="publication-archive-title">
    <div class="publications-section-heading">
      <p class="publications-kicker">2001—2023</p>
      <h2 id="publication-archive-title">Publication archive.</h2>
      <p>Select a year to explore earlier work. Searching opens the relevant years automatically.</p>
    </div>

    {% assign archive_years = "2023,2022,2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2002,2001" | split: "," %}
    <div class="publication-archive__years">
      {% for archive_year in archive_years %}
        <details class="publication-year publication-year--archive" id="year-{{ archive_year }}">
          <summary><span>{{ archive_year }}</span><span class="publication-year__count"></span><span class="publication-year__toggle" aria-hidden="true">+</span></summary>
          <div class="publication-year__list">{% bibliography --query @*[year={{ archive_year }}] --group_by none %}</div>
        </details>
      {% endfor %}
    </div>
  </section>

  <aside class="publications-cta">
    <p class="publications-kicker">Another route through the work</p>
    <h2>Follow the questions, not only the dates.</h2>
    <p>Our Research page connects representative papers to the ideas and systems that motivated them.</p>
    <a href="{{ '/research/' | relative_url }}">Explore research themes <span aria-hidden="true">→</span></a>
  </aside>
</div>

<script>
(function () {
  var root = document.querySelector('.publications-index');
  if (!root) return;
  var input = document.getElementById('publication-search');
  var clear = document.getElementById('publication-search-clear');
  var status = document.getElementById('publication-search-status');
  var entries = Array.prototype.slice.call(root.querySelectorAll('.bibliography > li'));
  var years = Array.prototype.slice.call(root.querySelectorAll('.publication-year'));

  years.forEach(function (year) {
    var count = year.querySelectorAll('.bibliography > li').length;
    var label = year.querySelector('.publication-year__count');
    if (label) label.textContent = count + (count === 1 ? ' work' : ' works');
  });

  function filterPublications() {
    var query = input.value.trim().toLowerCase();
    var visible = 0;
    entries.forEach(function (entry) {
      var match = !query || entry.textContent.toLowerCase().indexOf(query) !== -1;
      entry.hidden = !match;
      if (match) visible += 1;
    });
    years.forEach(function (year) {
      var hasMatch = !!year.querySelector('.bibliography > li:not([hidden])');
      year.hidden = !hasMatch;
      if (query && hasMatch && year.tagName === 'DETAILS') year.open = true;
    });
    clear.classList.toggle('is-visible', !!query);
    status.textContent = query ? visible + (visible === 1 ? ' matching work' : ' matching works') : entries.length + ' works in the catalogue';
  }

  input.addEventListener('input', filterPublications);
  clear.addEventListener('click', function () { input.value = ''; filterPublications(); input.focus(); });
  filterPublications();
})();

function toggleBibtex(key) {
  var panel = document.getElementById('bibtex-' + key);
  if (!panel) return;
  panel.hidden = !panel.hidden;
  var button = document.querySelector('[aria-controls="bibtex-' + key + '"]');
  if (button) button.setAttribute('aria-expanded', String(!panel.hidden));
}

function togglePublicationSnapshot(key) {
  var panel = document.getElementById('snapshot-' + key);
  if (!panel) return;
  panel.hidden = !panel.hidden;
  var button = document.querySelector('[aria-controls="snapshot-' + key + '"]');
  if (button) {
    button.setAttribute('aria-expanded', String(!panel.hidden));
    var symbol = button.querySelector('span');
    if (symbol) symbol.textContent = panel.hidden ? '+' : '−';
  }
  var frame = panel.querySelector('iframe[data-src]');
  if (frame && !frame.getAttribute('src')) frame.src = frame.getAttribute('data-src');
}
</script>
