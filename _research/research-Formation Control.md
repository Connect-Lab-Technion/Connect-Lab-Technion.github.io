---
title: Formation Control
research_code: Formation
layout: research
image: /img/research/FormationControl/formation_maneuver3D.png
hero_height: is-small
hero_image: /img/connect_globe.jpeg  
price: 7 # for sorting 

---

Many applications for cooperative multi-agent networks
require the agents to arrange themselves into some spatial
pattern. This can include alignment of orientations and velocities for flocking behaviors, or specific formations like
spacecraft constellations for sensing or vehicle platoons for
autonomous driving. The *formation control* problem seeks to design distributed control strategies for each agent that ensure the entire ensemble can arrange into the desired formation.

There are many challenges associated with the formation control problem.  They include:
* sensing capabilities of each agent (bearing, range, relative positions, etc.);
* availability or absence of a common reference frame;
* dynamics of each agent.


*Formation rigidity* is an architectural requirement of multi-agent systems when a common inertial reference frame is unavailable.  Rigidity is a property of the sensing and communication graph of the system that allows team objectives such as formation control and localization to be achieved using range-only measurements.  This project is exploring various aspects of formation rigidity, including dynamic controllers to ensure the rigidity property is maintained in a multi-robot formation even in the presence of various constraints such as collision and obstacle avoidance or sensing and communication ranges, and notions of optimality for rigid formations.

<div style="display: flex; justify-content: center;">
  <img src="/img/research/FormationControl/fig_sim_Global_2D_polygon_final.png" alt="Bearing-only Formation Control" style="max-width: 30%; margin: 0 10px;">
  <img src="/img/research/FormationControl/Example8_traj.png" alt="Symmetry Forced Formations" style="max-width: 30%; margin: 0 10px;">
  <img src="/img/research/FormationControl/FeketeFormation.png" alt="Formation Balancing" style="max-width: 30%; margin: 0 10px;">
</div>

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=formationcontrol] --group_by none --order descending %}
