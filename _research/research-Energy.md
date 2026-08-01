---
title: Distributed Energy Systems
research_code: NRG
layout: research
image: /img/research/Energy/solar_community.jpg
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
menubar_toc: true
toc_title: Topics
price: 4 # for sorting 

---

Distributed energy systems combine physical generation assets, storage, uncertain demand, and market-like coordination mechanisms. The research challenge is not only to optimize an operating point, but to do so while respecting device dynamics, heat-power coupling, uncertainty, and the communication limits of large energy networks.

This page focuses on energy-system work in the group. Related optimization and networked-systems methods appear on their own pages when the main contribution is methodological rather than energy-specific.

## Economic Dispatch and Unit Commitment

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Economic dispatch asks how a set of distributed generators should share power demand while minimizing operating cost and respecting technical constraints. In distributed settings, the problem becomes especially challenging because generation units may be heterogeneous, demands may be uncertain, and coordination must be achieved without relying on a single centralized controller.</p>
    <p>Our work develops optimization-based scheduling and dispatch methods for energy networks, with emphasis on combined heat-and-power operation and robust operation under demand uncertainty.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/Energy/ScheduleFigure_50x30_1.png" alt="Robust unit schedule for distributed energy generation">
      <figcaption>Scheduling structure for distributed generation under operational constraints.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Sharf2021b_J||key=Rist2016_J||key=Rist2017||key=Peleg2022] --group_by none --order descending %}

## Micro-Gas Turbine and CHP Modeling

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Combined heat-and-power systems require control and optimization models that capture both electrical and thermal outputs. In collaboration with the Turbomachinery and Heat Transfer Laboratory, we study micro-gas-turbine operation as a concrete platform for connecting energy management algorithms with detailed device dynamics.</p>
    <p>The resulting models support dispatch decisions that account for transient behavior, thermal coupling, and uncertainty in both electrical and heat demand.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/Energy/statetransition.png" alt="State transition model for micro-gas turbine operation">
      <figcaption>State-transition view used for micro-gas-turbine dispatch and scheduling.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Sharf2021b_J||key=Rist2016_J||key=Rist2017] --group_by none --order descending %}

## Off-Grid Management and Validation

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Off-grid and islanded systems expose the central systems problem in energy management: local decisions must maintain reliability while balancing renewables, storage, and controllable loads. Hardware-in-the-loop environments and smart sensing platforms make it possible to test these ideas against realistic device and network behavior.</p>
    <p>This line of work connects energy management, monitoring, and validation, and provides an application setting for the broader distributed optimization tools developed in the group.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/Energy/HIL.png" alt="Hardware-in-the-loop environment for energy systems">
      <figcaption>Hardware-in-the-loop environment for testing energy-management strategies.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Zelazo2011a_J||key=Ulmer2021] --group_by none --order descending %}

## Complete Related Publications

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=energy] --group_by none --order descending %}
