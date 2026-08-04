---
title: Event Triggered Control and Estimation
research_code: Event Trigger
layout: research
image: /img/research/EventTrigger/EventTrigger.png
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
menubar_toc: true
toc_title: Topics
price: 5 # for sorting 

---

Continuous sensing and communication can be expensive for autonomous systems, especially when many agents must coordinate over shared or unreliable communication channels. Event-triggered and sampled-data strategies reduce this burden by updating only when new information is useful enough to justify communication or actuation.

This page focuses on event-triggered control, event-triggered estimation, and asynchronous sampled-data synchronization. Formation, filtering, and consensus results are included here when the triggering or sampling mechanism is the main contribution.

## Event-Triggered Estimation

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Distributed estimation problems require agents to fuse intermittent observations and neighbor information while maintaining filter consistency. Event-triggered consensus Kalman filtering studies when communication can be skipped without compromising estimation quality.</p>
    <p>Our work develops filter architectures for time-varying graphs, intermittent measurements, and event-based information exchange.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/EventTrigger/Kalman_ETC.png" alt="Event-triggered consensus Kalman filtering architecture">
      <figcaption>Event-triggered information exchange in distributed consensus Kalman filtering.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Priel2023_J||key=Priel2023a_C||key=Priel2021a||key=Priel2022] --group_by none --order descending %}

## Event-Based Formation Control

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>In formation control, event-triggered mechanisms reduce communication while preserving the geometric constraints needed for convergence. The trigger must account for both the agent dynamics and the formation objective, since stale measurements can degrade stability or distort the desired formation.</p>
    <p>This work connects event-triggered control with bearing-based formation stabilization and second-order multi-agent dynamics.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/EventTrigger/formation_etc.png" alt="Event-triggered bearing formation control response">
      <figcaption>Event-triggered updates for bearing-based formation stabilization.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Sewlia2023a_J||key=Sewlia2019a||key=Sewlia2020] --group_by none --order descending %}

## Sampled-Data and Asynchronous Synchronization

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Sampled-data synchronization studies how networked systems behave when agents communicate and update at discrete or asynchronous times. Rather than assuming continuous access to neighbor signals, the controller must tolerate sampling, delays, and irregular updates.</p>
    <p>Our recent work develops emulation and asynchronous sampled-data approaches for output-feedback synchronization with small communication delays.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/EventTrigger/emulation_sync.png" alt="Asynchronous sampled-data synchronization response">
      <figcaption>Sampled-data synchronization under asynchronous communication.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Barkai2024_CDC||key=Barkai2024_ECC||key=Barkai_IACAS2024||key=Barkai2023a] --group_by none --order descending %}

## Complete Related Publications
<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=eventtrigger] --group_by none --order descending %}
