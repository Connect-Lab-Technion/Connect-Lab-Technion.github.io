---
layout: page
title: Control Conference Dates
show_sidebar: false
hide_footer: false
hero_height: is-small
hero_image: /img/Connect_head_bkg.png
sitemap: false
---

<style>
.conference-gate,
.conference-dates {
  max-width: 1100px;
  margin: 0 auto;
}

.conference-gate {
  padding: 1.5rem;
  border: 1px solid #ddd;
  border-radius: 6px;
  background: #fafafa;
}

.conference-gate label {
  display: block;
  font-weight: 600;
  margin-bottom: 0.5rem;
}

.conference-gate input {
  max-width: 280px;
  margin-right: 0.5rem;
}

.conference-gate .help {
  color: #666;
  margin-top: 0.75rem;
}

.conference-dates {
  display: none;
}

.conference-summary {
  margin-bottom: 1.25rem;
}

.conference-toolbar {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin: 1rem 0;
}

.conference-toolbar a {
  border: 1px solid #d8d8d8;
  border-radius: 4px;
  padding: 0.3rem 0.55rem;
  color: #333;
}

.conference-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 0.95rem;
}

.conference-table th,
.conference-table td {
  border-bottom: 1px solid #e6e6e6;
  padding: 0.65rem;
  vertical-align: top;
}

.conference-table th {
  background: #f5f5f5;
  font-weight: 700;
}

.conference-table .past {
  color: #777;
}

.conference-table .tbd {
  color: #8a5a00;
}

.conference-table .topic {
  white-space: nowrap;
}

.conference-note {
  color: #555;
  font-size: 0.9rem;
}

@media screen and (max-width: 780px) {
  .conference-table,
  .conference-table thead,
  .conference-table tbody,
  .conference-table th,
  .conference-table td,
  .conference-table tr {
    display: block;
  }

  .conference-table thead {
    display: none;
  }

  .conference-table tr {
    border: 1px solid #e6e6e6;
    border-radius: 6px;
    margin-bottom: 0.75rem;
    padding: 0.5rem;
  }

  .conference-table td {
    border-bottom: 0;
    padding: 0.35rem 0.25rem;
  }

  .conference-table td::before {
    content: attr(data-label) ": ";
    font-weight: 700;
  }
}
</style>

<div id="conference-gate" class="conference-gate">
  <label for="conference-password">Password</label>
  <input id="conference-password" class="input" type="password" autocomplete="current-password">
  <button id="conference-unlock" class="button is-link">Open</button>
  <p id="conference-error" class="help" aria-live="polite">This page is unlinked from the public navigation. The lightweight password is for convenience only.</p>
</div>

<div id="conference-dates" class="conference-dates">

<p class="conference-summary">
Updated August 10, 2026. This internal page tracks upcoming submission opportunities for control, learning for control, networked systems, nonlinear control, and closely related systems venues. Expired deadlines are intentionally omitted.
</p>

<div class="conference-toolbar">
  <a href="#upcoming-deadlines">Upcoming Deadlines</a>
  <a href="#annual-control">Annual Control</a>
  <a href="#networked-systems">Networked Systems</a>
  <a href="#nonlinear-hybrid">Nonlinear and Hybrid</a>
  <a href="#learning-applications">Learning and Applications</a>
  <a href="#watch-list">Watch List</a>
  <a href="#sources">Sources</a>
</div>

## Upcoming Deadlines
<div id="upcoming-deadlines" style="padding-top: 80px; margin-top: -80px;"></div>

<table class="conference-table">
  <thead>
    <tr>
      <th>Deadline</th>
      <th>Conference</th>
      <th>What</th>
      <th>Conference Dates</th>
      <th>Location</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td data-label="Deadline">September 18, 2026</td>
      <td data-label="Conference">CDC 2026</td>
      <td data-label="What">Final submission deadline</td>
      <td data-label="Conference Dates">December 15-18, 2026</td>
      <td data-label="Location">Honolulu, Hawaii, USA</td>
    </tr>
    <tr>
      <td data-label="Deadline">September 25, 2026</td>
      <td data-label="Conference">Allerton 2026</td>
      <td data-label="What">Final manuscript deadline</td>
      <td data-label="Conference Dates">September 15-18, 2026</td>
      <td data-label="Location">Illinois, USA</td>
    </tr>
    <tr>
      <td data-label="Deadline">September 25, 2026</td>
      <td data-label="Conference">ACC 2027</td>
      <td data-label="What">ACC manuscript submission</td>
      <td data-label="Conference Dates">July 7-9, 2027</td>
      <td data-label="Location">Philadelphia, Pennsylvania, USA</td>
    </tr>
    <tr>
      <td data-label="Deadline">October 26, 2026</td>
      <td data-label="Conference">SIAM DS27</td>
      <td data-label="What">Minisymposium proposal deadline</td>
      <td data-label="Conference Dates">May 24-28, 2027</td>
      <td data-label="Location">Long Beach, California, USA</td>
    </tr>
    <tr>
      <td data-label="Deadline">October 31, 2026</td>
      <td data-label="Conference">ECC 2027</td>
      <td data-label="What">Paper and invited-session proposal deadline</td>
      <td data-label="Conference Dates">July 13-16, 2027</td>
      <td data-label="Location">Brussels, Belgium</td>
    </tr>
    <tr>
      <td data-label="Deadline">November 23, 2026</td>
      <td data-label="Conference">SIAM DS27</td>
      <td data-label="What">Contributed lecture, poster, and minisymposium abstract deadline</td>
      <td data-label="Conference Dates">May 24-28, 2027</td>
      <td data-label="Location">Long Beach, California, USA</td>
    </tr>
    <tr>
      <td data-label="Deadline">February 7, 2027</td>
      <td data-label="Conference">CCTA 2027</td>
      <td data-label="What">Full paper submission date</td>
      <td data-label="Conference Dates">2027, exact conference dates to verify</td>
      <td data-label="Location">To verify</td>
    </tr>
  </tbody>
</table>

## Annual Control
<div id="annual-control" style="padding-top: 80px; margin-top: -80px;"></div>

<table class="conference-table">
  <thead>
    <tr>
      <th>Conference</th>
      <th class="topic">Area</th>
      <th>Submission Dates</th>
      <th>Conference Dates</th>
      <th>Location</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td data-label="Conference"><a href="https://cdc2026.ieeecss.org/">IEEE CDC 2026</a></td>
      <td data-label="Area" class="topic">Control theory</td>
      <td data-label="Submission Dates">Final submission: September 18, 2026.</td>
      <td data-label="Conference Dates">December 15-18, 2026</td>
      <td data-label="Location">Honolulu, Hawaii, USA</td>
      <td data-label="Notes">Flagship IEEE CSS conference.</td>
    </tr>
    <tr>
      <td data-label="Conference"><a href="https://acc2027.a2c2.org/">American Control Conference 2027</a></td>
      <td data-label="Area" class="topic">Control systems</td>
      <td data-label="Submission Dates">Joint ACC + L-CSS manuscript: September 11, 2026. ACC manuscript: September 25, 2026.</td>
      <td data-label="Conference Dates">July 7-9, 2027</td>
      <td data-label="Location">Philadelphia, Pennsylvania, USA</td>
      <td data-label="Notes">Main annual North American controls venue.</td>
    </tr>
    <tr>
      <td data-label="Conference"><a href="https://ecc27.euca-ecc.org/">European Control Conference 2027</a></td>
      <td data-label="Area" class="topic">Control systems</td>
      <td data-label="Submission Dates">Submission site opens: September 1, 2026. Papers and invited sessions: October 31, 2026. Workshops and industry abstracts: January 31, 2027.</td>
      <td data-label="Conference Dates">July 13-16, 2027</td>
      <td data-label="Location">Brussels, Belgium</td>
      <td data-label="Notes">EUCA flagship conference.</td>
    </tr>
    <tr>
      <td data-label="Conference"><a href="https://allerton.csl.illinois.edu/">Allerton 2026</a></td>
      <td data-label="Area" class="topic">Communication, control, computing</td>
      <td data-label="Submission Dates">Final versions: September 25, 2026.</td>
      <td data-label="Conference Dates">September 15-18, 2026</td>
      <td data-label="Location">Illinois, USA</td>
      <td data-label="Notes">Useful for networked control, communication-constrained control, and information systems.</td>
    </tr>
  </tbody>
</table>

## Networked Systems
<div id="networked-systems" style="padding-top: 80px; margin-top: -80px;"></div>

<table class="conference-table">
  <thead>
    <tr>
      <th>Conference</th>
      <th class="topic">Area</th>
      <th>Submission Dates</th>
      <th>Conference Dates</th>
      <th>Location</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td data-label="Conference"><a href="https://www.siam.org/conferences-events/siam-conferences/ds27/submissions/">SIAM DS27</a></td>
      <td data-label="Area" class="topic">Dynamical systems</td>
      <td data-label="Submission Dates">Minisymposium proposals: October 26, 2026. Contributed lecture, poster, and minisymposium abstracts: November 23, 2026.</td>
      <td data-label="Conference Dates">May 24-28, 2027</td>
      <td data-label="Location">Long Beach, California, USA</td>
      <td data-label="Notes">Good for networks, dynamics, control, and applied mathematics audiences.</td>
    </tr>
  </tbody>
</table>

## Nonlinear and Hybrid
<div id="nonlinear-hybrid" style="padding-top: 80px; margin-top: -80px;"></div>

<table class="conference-table">
  <thead>
    <tr>
      <th>Conference</th>
      <th class="topic">Area</th>
      <th>Submission Dates</th>
      <th>Conference Dates</th>
      <th>Location</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td data-label="Conference"><a href="https://www.ifac-control.org/conferences/analysis-and-control-of-nonlinear-dynamics-and-chaos-8th-acndc-2027tm">IFAC ACNDC 2027</a></td>
      <td data-label="Area" class="topic">Nonlinear dynamics</td>
      <td data-label="Submission Dates"><span class="tbd">Submission deadlines not found on the IFAC listing yet.</span></td>
      <td data-label="Conference Dates">June 9-11, 2027</td>
      <td data-label="Location">Monte Porzio Catone, Rome, Italy</td>
      <td data-label="Notes">Specialized venue for nonlinear dynamics, chaos, and control.</td>
    </tr>
  </tbody>
</table>

## Learning and Applications
<div id="learning-applications" style="padding-top: 80px; margin-top: -80px;"></div>

<table class="conference-table">
  <thead>
    <tr>
      <th>Conference</th>
      <th class="topic">Area</th>
      <th>Submission Dates</th>
      <th>Conference Dates</th>
      <th>Location</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td data-label="Conference"><a href="https://ccta2027.ieeecss.org/">IEEE CCTA 2027</a></td>
      <td data-label="Area" class="topic">Control applications</td>
      <td data-label="Submission Dates">Full paper: February 7, 2027. Notification: May 15, 2027. Final paper: June 23, 2027. Late breaking: June 30, 2027.</td>
      <td data-label="Conference Dates"><span class="tbd">To verify on conference site.</span></td>
      <td data-label="Location"><span class="tbd">To verify on conference site.</span></td>
      <td data-label="Notes">Good annual option for applied control work.</td>
    </tr>
  </tbody>
</table>

## Watch List
<div id="watch-list" style="padding-top: 80px; margin-top: -80px;"></div>

<table class="conference-table">
  <thead>
    <tr>
      <th>Conference</th>
      <th class="topic">Area</th>
      <th>Status</th>
      <th>Why Track</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td data-label="Conference"><a href="https://www.ifac-control.org/conferences/networked-systems-10th-necsys-2025tm">NecSys</a></td>
      <td data-label="Area" class="topic">Networked systems</td>
      <td data-label="Status"><span class="tbd">Next edition not posted yet.</span></td>
      <td data-label="Why Track">Core specialized venue for networked control systems.</td>
    </tr>
    <tr>
      <td data-label="Conference"><a href="https://conferences.ifac-control.org/nolcos2025/">IFAC NOLCOS</a></td>
      <td data-label="Area" class="topic">Nonlinear control</td>
      <td data-label="Status"><span class="tbd">Next deadline not posted yet.</span></td>
      <td data-label="Why Track">Primary specialized nonlinear-control symposium.</td>
    </tr>
    <tr>
      <td data-label="Conference"><a href="https://ifac2026.org/">IFAC World Congress</a></td>
      <td data-label="Area" class="topic">Automatic control</td>
      <td data-label="Status"><span class="tbd">Track next World Congress cycle after 2026.</span></td>
      <td data-label="Why Track">Triennial IFAC flagship event.</td>
    </tr>
    <tr>
      <td data-label="Conference"><a href="https://uwaterloo.ca/international-symposium-mathematical-theory-networks-systems/">MTNS</a></td>
      <td data-label="Area" class="topic">Systems theory</td>
      <td data-label="Status"><span class="tbd">Track next edition after 2026.</span></td>
      <td data-label="Why Track">Important venue for mathematical systems and control theory.</td>
    </tr>
    <tr>
      <td data-label="Conference"><a href="https://sites.google.com/usc.edu/l4dc2026/">L4DC</a></td>
      <td data-label="Area" class="topic">Learning + control</td>
      <td data-label="Status"><span class="tbd">Track next edition when announced.</span></td>
      <td data-label="Why Track">Useful for learning-based control, optimization, and data-driven dynamics.</td>
    </tr>
  </tbody>
</table>

## Sources
<div id="sources" style="padding-top: 80px; margin-top: -80px;"></div>

<p class="conference-note">
Primary sources used where available: <a href="https://cdc2026.ieeecss.org/">CDC 2026</a>,
<a href="https://acc2027.a2c2.org/">ACC 2027</a>,
<a href="https://ecc27.euca-ecc.org/">ECC 2027</a>,
<a href="https://ifac2026.org/">IFAC World Congress</a>,
<a href="https://uwaterloo.ca/international-symposium-mathematical-theory-networks-systems/key-dates">MTNS 2026</a>,
<a href="https://allerton.csl.illinois.edu/">Allerton 2026</a>,
<a href="https://www.ifac-control.org/conferences/networked-systems-10th-necsys-2025tm">NecSys IFAC listing</a>,
<a href="https://www.ifac-control.org/conferences/analysis-and-control-of-nonlinear-dynamics-and-chaos-8th-acndc-2027tm">ACNDC 2027</a>,
<a href="https://ccta2027.ieeecss.org/">CCTA 2027</a>,
<a href="https://sites.google.com/usc.edu/l4dc2026/">L4DC 2026</a>, and
<a href="https://www.siam.org/conferences-events/siam-conferences/ds27/submissions/">SIAM DS27</a>.
</p>

</div>

<script>
(function () {
  var password = "connect";
  var storageKey = "connect_control_conference_dates_unlocked";
  var gate = document.getElementById("conference-gate");
  var content = document.getElementById("conference-dates");
  var input = document.getElementById("conference-password");
  var button = document.getElementById("conference-unlock");
  var message = document.getElementById("conference-error");

  function showContent() {
    gate.style.display = "none";
    content.style.display = "block";
  }

  function unlock() {
    if (input.value === password) {
      window.sessionStorage.setItem(storageKey, "true");
      showContent();
    } else {
      message.textContent = "Incorrect password.";
      input.focus();
    }
  }

  if (window.sessionStorage.getItem(storageKey) === "true") {
    showContent();
  }

  button.addEventListener("click", unlock);
  input.addEventListener("keydown", function (event) {
    if (event.key === "Enter") {
      unlock();
    }
  });
})();
</script>
