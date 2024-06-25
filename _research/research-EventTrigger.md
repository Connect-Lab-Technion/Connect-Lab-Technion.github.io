---
title: Event Triggered Control and Estimation
research_code: Event Trigger
layout: research
image: /img/research/EventTrigger/EventTrigger.png
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
price: 7 # for sorting 

---

Sensing and communication for autonomous sytsems can be demanding in terms of energy and communication consumption.  This problem is amplfied when considering teams of autonomous systems where it may be unreasonable to expect agents to continusouly communicate with other agents.  Event-triggered control strategies take a more opportunistic approach for control and estimation of dynamical systems.  In a multi-agent setting, agents may not need to communicate continuously in order to sovle the group task.  Our research explores how event triggering strategies can be used to solve cooperative control and estimation problems.  We consider bearing-based formation control problem, distributed Kalman filtering, and synchronization problems using event or asynchronous strategies.


<div style="display: flex; justify-content: center;">
  <img src="/img/research/EventTrigger/Kalman_ETC.png" alt="Kalman Event Triggered Filter" style="max-width: 75%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/EventTrigger/formation_etc.png" alt="Event triggered formation control" style="max-width: 75%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/EventTrigger/emulation_sync.png" alt="Asynchronous synchronization" style="max-width: 75%; margin: 0 10px; object-fit: contain; max-height: 200px;">
</div>

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=eventtrigger] --group_by none --order descending %}
