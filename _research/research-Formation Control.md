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
autonomous driving.

The challenges associated with the design and implementation of multi-agent systems range from hardware and software considerations to the development of a solid theoretical
foundation for their operation. In particular, the sensing and communication capabilities of each agent will dictate the distributed protocols used to achieve team objectives. For example, if each agent in a multi-robot system is equipped with a GPS-like sensor, then tasks such as formation keeping or localization can be trivially accomplished by communication between robots of their state information in a common world-frame. However, in applications operating in harsher environments, i.e., indoors, underwater, or in deep-space, GPS is not a viable sensing option. Indeed, in these situations, agents must rely on sensing without knowledge of a common inertial reference frame. In these scenarios, relative sensing can provide accurate measurements of, for example, range or
bearing, but without any common reference frame.

Formation Rigidity is an architectural requirement of multi-agent systems when a common inertial reference frame is unavailable.  Rigidity is a property of the sensing and communication graph of the system that allows team objectives such as formation control and localization to be achieved using range-only measurements.  This project is exploring various aspects of formation rigidity, including dynamic controllers to ensure the rigidity property is maintained in a multi-robot formation even in the presence of various constraints such as collision and obstacle avoidance or sensing and communication ranges, and notions of optimality for rigid formations.

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=formationcontrol] --group_by none --order descending %}
