---
layout: page
title: Publications by type
show_sidebar: false
hide_footer: false
hide_hero: true
---

<div class="publications-index publications-by-type" id="publications-top">
  <header class="publications-hero">
    <p class="publications-kicker">Research output · Connect Lab</p>
    <h1>Publications<br>by type.</h1>
    <p class="publications-intro">Browse peer-reviewed articles, conference papers, technical reports, theses, and patents across the lab’s research programme.</p>
    <nav class="publications-view-switch" aria-label="Publication views">
      <a href="{{ '/publications/' | relative_url }}">By year</a>
      <a class="is-active" href="{{ '/publications_by_type/' | relative_url }}">By type</a>
      <a href="{{ '/talks/' | relative_url }}">Talks &amp; slides</a>
    </nav>
  </header>

  <section class="publications-tools" aria-labelledby="publication-search-title">
    <div>
      <p class="publications-kicker">Find a work</p>
      <h2 id="publication-search-title">Search every format.</h2>
    </div>
    <div class="publications-search-wrap">
      <label class="sr-only" for="publication-search">Search publications</label>
      <input id="publication-search" type="search" placeholder="Title, author, venue, or keyword…" autocomplete="off">
      <button id="publication-search-clear" type="button">Clear</button>
      <p id="publication-search-status" aria-live="polite"></p>
    </div>
  </section>

  <nav class="publications-year-nav" aria-label="Jump to publication type">
    <span>Jump to</span>
    <a href="#journal-articles">Journals</a><a href="#conference-articles">Conferences</a><a href="#book-chapters">Books</a><a href="#technical-reports">Reports</a><a href="#theses">Theses</a><a href="#patents">Patents</a>
  </nav>

  <main class="publication-types">
    <section class="publication-type-section" id="journal-articles">
      <header><p class="publications-kicker">Peer reviewed</p><h2>Journal articles.</h2><span class="publication-type-count"></span></header>
      {% bibliography --group_by none --query @article --order descending %}
    </section>
    <section class="publication-type-section" id="conference-articles">
      <header><p class="publications-kicker">Proceedings</p><h2>Conference articles.</h2><span class="publication-type-count"></span></header>
      {% bibliography --group_by none --query @InProceedings --order descending %}
    </section>
    <section class="publication-type-section" id="book-chapters">
      <header><p class="publications-kicker">Long form</p><h2>Book chapters.</h2><span class="publication-type-count"></span></header>
      {% bibliography --group_by none --query @incollection --order descending %}
    </section>
    <section class="publication-type-section" id="technical-reports">
      <header><p class="publications-kicker">Preprints</p><h2>ArXiv &amp; technical reports.</h2><span class="publication-type-count"></span></header>
      {% bibliography --group_by none --query @TechReport --order descending %}
    </section>
    <section class="publication-type-section" id="theses">
      <header><p class="publications-kicker">Student research</p><h2>PhD &amp; MSc theses.</h2><span class="publication-type-count"></span></header>
      {% bibliography --group_by none --query @thesis --order descending %}
    </section>
    <section class="publication-type-section" id="patents">
      <header><p class="publications-kicker">Intellectual property</p><h2>Patents.</h2><span class="publication-type-count"></span></header>
      {% bibliography --file DZ_patents --group_by none --order descending %}
    </section>
  </main>

  <aside class="publications-cta">
    <p class="publications-kicker">Prefer a timeline?</p>
    <h2>See how the work has developed over time.</h2>
    <a href="{{ '/publications/' | relative_url }}">Browse chronologically <span aria-hidden="true">→</span></a>
  </aside>
</div>

<script>
(function () {
  var root = document.querySelector('.publications-by-type');
  if (!root) return;
  var input = document.getElementById('publication-search');
  var clear = document.getElementById('publication-search-clear');
  var status = document.getElementById('publication-search-status');
  var entries = Array.prototype.slice.call(root.querySelectorAll('.bibliography > li'));
  var sections = Array.prototype.slice.call(root.querySelectorAll('.publication-type-section'));

  sections.forEach(function (section) {
    var count = section.querySelectorAll('.bibliography > li').length;
    section.querySelector('.publication-type-count').textContent = count + (count === 1 ? ' work' : ' works');
  });

  function filterPublications() {
    var query = input.value.trim().toLowerCase();
    var visible = 0;
    entries.forEach(function (entry) {
      var match = !query || entry.textContent.toLowerCase().indexOf(query) !== -1;
      entry.hidden = !match;
      if (match) visible += 1;
    });
    sections.forEach(function (section) {
      section.hidden = !section.querySelector('.bibliography > li:not([hidden])');
    });
    clear.classList.toggle('is-visible', !!query);
    status.textContent = query ? visible + (visible === 1 ? ' matching work' : ' matching works') : entries.length + ' works across all formats';
  }

  input.addEventListener('input', filterPublications);
  clear.addEventListener('click', function () { input.value = ''; filterPublications(); input.focus(); });
  filterPublications();
})();

function setPublicationPanel(panel, open) {
  if (!panel) return;
  panel.hidden = !open;
  var entry = panel.closest('.publication-entry');
  var button = entry && entry.querySelector('[aria-controls="' + panel.id + '"]');
  if (button) {
    button.setAttribute('aria-expanded', String(open));
    if (panel.id.indexOf('snapshot-') === 0) {
      var symbol = button.querySelector('span');
      if (symbol) symbol.textContent = open ? '−' : '+';
    }
  }
}

function toggleBibtex(key) {
  var panel = document.getElementById('bibtex-' + key);
  if (!panel) return;
  var willOpen = panel.hidden;
  if (willOpen) setPublicationPanel(document.getElementById('snapshot-' + key), false);
  setPublicationPanel(panel, willOpen);
}

function togglePublicationSnapshot(key) {
  var panel = document.getElementById('snapshot-' + key);
  if (!panel) return;
  var willOpen = panel.hidden;
  if (willOpen) setPublicationPanel(document.getElementById('bibtex-' + key), false);
  setPublicationPanel(panel, willOpen);
}
</script>
