---
title: Formation Control
research_code: Formation
layout: research
image: /img/research/FormationControl/formation_maneuver3D.png
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
price: 2 # for sorting 

---

Many applications for cooperative multi-agent networks
require the agents to arrange themselves into some spatial
pattern. This can include alignment of orientations and velocities for flocking behaviors, or specific formations like
spacecraft constellations for sensing or vehicle platoons for
autonomous driving. The *formation control* problem seeks to design distributed control strategies for each agent that ensure the entire ensemble can arrange into the desired formation.

A fundamental challenge for solving the formation control problem relates to the sensing and control architecture for the multi-agent system.  Our approach is to leverage results from *rigidity theory*. Rigidity theory studies the solution of a set of geometric constraints on a discrete configuration of points in an Euclidean space. These constraints can include distance or
bearing constraints between pairs of points. Of interest in
rigidity theory is to determine whether the set of polynomial
equations representing these constraints (i) has a solution
(independence); (ii) has locally isolated solutions (rigidity); or (iii) has exactly one solution in the given space up to isometric motions (global rigidity).  

Our research explores various aspects of rigidity theory and formation control.  Topics include:
* Formation control using bearing sensing and bearing rigidity theory.
* Alternative architectures exploiting symmetry found in formations.
* Dynamic controllers to ensure the rigidity property is maintained in a multi-robot formation with uncertain environments.
* Formations consisting of heterogeneous agent types with different sensing capabilities.

<div style="display: flex; justify-content: center;">
  <img src="/img/research/FormationControl/fig_sim_Global_2D_polygon_final.png" alt="Bearing-only Formation Control" style="width: 75%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/FormationControl/Example8_traj.png" alt="Symmetry Forced Formations" style="width: 75%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/FormationControl/FeketeFormation.png" alt="Formation Balancing" style="width: 75%; margin: 0 10px; object-fit: contain; max-height: 200px;">
</div>

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=formationcontrol] --group_by none --order descending %}
