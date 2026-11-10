---
title: Robotic Testbed and Validation
research_code: Robotics
layout: research
image: /img/home/connect-lab-robots.webp
card_alt: Mobile robots arranged as a multi-agent formation in the lab
card_label: Experimental validation
summary: Experimental platforms for testing how theoretical guarantees survive real sensing, communication, computation, and actuation constraints.
hero_caption: Connect Lab ground robots provide a reusable testbed for formation control, network inference, and distributed coordination.
story: Experiments are where modeling assumptions become visible. Our platforms let us test how sensing limits, computation, actuator dynamics, and communication constraints reshape theoretically sound controllers.
research_questions:
  - Which theoretical guarantees remain meaningful on physical robots?
  - How should a platform expose sensing and actuation limits without hiding them behind proprietary control layers?
  - Can one testbed support research, rapid prototyping, and control education?
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
menubar_toc: true
toc_title: Topics
price: 8 # for sorting 

---

The group is primarily focused on the theoretical foundations of networked and multi-agent systems, but robotic validation is essential for testing which assumptions survive contact with real sensing, computation, communication, and actuation constraints.

Our robotic work provides experimental platforms for formation control, rigidity maintenance, aerial robotics, cooperative manipulation, and education-oriented control prototyping.

## Robot Platforms

<p>We are developing ground and aerial robots for validating multi-agent control ideas and for involving students in hands-on systems research. The current platforms maintained by the group are listed below.</p>

<div class="research-platform-grid">
  {% assign sorted_products = site.team | where:"category","robots" | sort: "deployment" | reverse %}
  {% for product in sorted_products %}
    <a class="research-platform-card" href="{{ product.url | prepend: site.baseurl }}">
      {% if product.image %}<figure><img src="{{ product.image }}" alt="{{ product.title }}"></figure>{% endif %}
      <div><p>{{ product.title }}</p><span>{{ product.subtitle }}</span></div>
    </a>
  {% endfor %}
</div>

## Robotic Formation Validation

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Formation-control theory becomes especially useful when it can be translated into controllers for ground robots, quadrotors, and heterogeneous teams. Robotic experiments expose practical issues such as range-only measurements, limited visual sensing, actuator saturation, and the need to preserve rigidity while moving through uncertain environments.</p>
    <p>This work validates rigidity maintenance, bearing-based formation control, formation balancing, and multi-robot maneuvering on physical platforms.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/FormationControl/formation_maneuver3D.png" alt="Three-dimensional formation maneuvering experiment">
      <figcaption>Formation maneuvering and validation on multi-robot platforms.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Liu_IEEETRo2019||key=Schiano2016a||key=Zelazo2013a_J||key=Zelazo2012c] --group_by none --order descending %}

## Cooperative Manipulation and Open Platforms

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Robotic validation also includes cooperative manipulation and open-source platforms for control education and rapid prototyping. These projects connect the group with experimental robotics collaborators and provide reusable infrastructure for future networked-control demonstrations.</p>
    <p>Recent work includes rigidity-based cooperative manipulation and an open-source quadcopter platform for Simulink-based control design.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/Robotics/turtlebots1.png" alt="Ground robots in the Connect Lab testbed">
      <figcaption>Ground-robot testbed used for multi-agent control experiments.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Attias_IACAS2024||key=Verginis2023_J||key=Drellich2021] --group_by none --order descending %}

## Complete Related Publications

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=robotics] --group_by none --order descending %}
