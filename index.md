---
title: Cooperative Networks and Controls Lab (ConNeCt)
subtitle: Technion - Israel Institute of Technology
layout: page
show_sidebar: false
hide_footer: false
hero_height: is-small
hero_color: is-black
---

# Our Mission

The Cooperative Networks and Controls (ConNeCt) lab focuses on the control and coordination of multi-agent systems.  Our approach for studying these systems is through a blend of systems and control theory with graph theory.   While our heart and soul rests in the fundamental and theoretical challenges of networked systems, we also consider their real-world application through a robotic testbed consisting of ground and aerial vehicles.

The Connect lab is a research group in the [Stephen B. Klein Faculty of Aerospace Engineering](https://aerospace.technion.ac.il/) at the [Technion - Israel Institute of Technology](https://www.google.com/search?q=technion&rlz=1C5CHFA_enIL991IL991&oq=technion+&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIGCAEQRRg7MgYIAhBFGDwyBggDEEUYPDIGCAQQRRg8MgYIBRBFGDwyBggGEEUYPDIGCAcQRRg80gEIMzM0NmowajeoAgCwAgA&sourceid=chrome&ie=UTF-8).  Our team consists of students from across the Technion and researchers from around the world.  Our physical home is within the [Philadelphia Flight Control Laboratory](https://pfcl.technion.ac.il/).  Come visit!


<!-- Please visit our [<span style="color:red">
<b>research</b>
</span>](https://anpl-technion.github.io/research/) and [<span style="color:red">
<b>publications</b>
</span>](https://anpl-technion.github.io/publications/) pages to see our ongoing research activities. -->


<b>
We are always looking for highly-motivated individuals to join our group, see details [here]({{ site.baseurl }}/Positions).
</b>

<div class="slick-slider">
  {% for slide in site.data.home_slides %}
    <div>
      <img src="{{ slide.image }}" alt="{{ slide.description }}">
    </div>
  {% endfor %}
</div>


<h2>Latest News:</h2>
<ul class="news-list">
  {% assign sorted_news = site.news | sort: 'date' | reverse %}
  {% for news in sorted_news limit:10 %}
    <li>
      <a href="{{ news.url }}">{{ news.title }}</a>
      <span class="news-date">{{ news.date | date: "%B %-d, %Y" }}</span>
      <p class="news-description">{{ news.description | escape }}</p>
    </li>
  {% endfor %}
</ul>

[View All News]({{ site.baseurl }}/news_archive)



<!--<div style="display: flex; justify-content: center;">
  <a class="twitter-timeline" data-width="45%" data-height="800" href="https://twitter.com/ANPL_Technion?ref_src=twsrc%5Etfw%7Ctwcamp%5Eembeddedtimeline%7Ctwterm%5Escreen-name%3AANPL_Technion%7Ctwcon%5Es2">Tweets from Anpl Technion</a> 
  <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
  <a class="twitter-timeline" data-width="45%" data-height="800" href="https://twitter.com/vadim_indelman?ref_src=twsrc%5Etfw%7Ctwcamp%5Eembeddedtimeline%7Ctwterm%5Escreen-name%3Avadim_indelman%7Ctwcon%5Es2">Tweets from vadim indelman</a>
  <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 
</div>
-->
<hr>

<!--### We gratefully acknowledge our funding sources over the years: 

<div class="horizontal-grid-container">
  <div class="grid-item">
    <img src="/img/funding/ISF-logo3.png" alt="ISF">
  </div>
  <div class="grid-item">
    <img src="/img/funding/NSF-logo.jpeg" alt="BSF">
  </div>
  <div class="grid-item">
    <img src="/img/funding/BSF-logo.png" alt="BSF">
  </div>
    <!-- <div class="grid-item">
    <img src="/img/funding/TASP-logo.png" alt="TASP">
  </div> -->
  <!-- Add more grid items for more images -->
  <!-- </div>  -->


