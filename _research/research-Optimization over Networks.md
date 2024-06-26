---
title: Optimization Over Networks
research_code: OPT  
layout: research
image: /img/research/NDSOptimization/x_n20_T70.jpg
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
price: 7 # for sorting 

---

Distributed optimization has become a vital aspect of research for multi-agent systems. On the one hand, it is important to study and develop algorithms that solve global optimization problem at a local and distributed level. This has immediate applications in problems related to the development of “smart-grid” power systems, as well as problems related to team decision-making. On the other hand, tools from optimization can lead to deep insights into the behavior of highly complex and non-linear dynamical system. Our research explores the following ideas:
* how optimization theory emerges as tool for analyzing complex interconnected tools
* optimization as a tool for solving distributed control and decision making problems
* optimization for network identification and other graph properties

<div style="display: flex; justify-content: center;">
  <img src="/img/research/NDSOptimization/network_design.png" alt="Design of optimal graphs" style="max-width: 75%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/NDSOptimization/group-coordination.png" alt="Team extremum seeking" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/NDSOptimization/netid.png" alt="Network identification" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
</div>

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=optimization] --group_by none --order descending %}
