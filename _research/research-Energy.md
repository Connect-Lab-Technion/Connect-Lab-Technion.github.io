---
title: Distributed Energy Systems
research_code: NRG
layout: research
image: /img/research/Energy/solar_community.jpg
hero_height: is-small
hero_image: /img/connect_globe.jpeg  
price: 7 # for sorting 

---

The future electric power grid will be based on a robust infrastructure combining renewable energy sources and a networked and interactive energy market connecting the consumer and energy producer. The advantages of a smart-grid range from a decreased environmental impact, economic benefits, and a more robust service. One of the challenges associated with developing a smart-grid is its physical scale. Current energy needs require large-scale generation of power from centralized plants. One vision for smart-grids is to supplement this energy production with renewable sources of energy, including wind and solar power, energy storage elements, and an interactive energy market where end-users can modulate their demand according to energy prices and personal utility.

Our research primarily focuses on distributed algorithms for solving the *economic dispatch* and *unit commitment* problem for networks of heterogeneous energy generation and storage devices.  In collaboration with the [Turbomachinery and Heat Transfer Laboratory
](https://bcukurel.net.technion.ac.il/), we have been working with detailed dynamic models of micro-gas turbines to design robust optimization algorithms for these problems.


<div style="display: flex; justify-content: center;">
  <img src="/img/research/Energy/ScheduleFigure_50x30_1.png" alt="Robust scheduling" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/Energy/statetransition.png" alt="State Transition" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/Energy/HIL.png" alt="HIL Environment" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
</div>

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=energy] --group_by none --order descending %}
