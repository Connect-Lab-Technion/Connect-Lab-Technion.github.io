---
title: Formation Rigidity and Mutli-Robot Coordination
research_code: FOR
layout: research
image: /img/research/formationRigidity/edge_split.jpg
hero_height: is-small
hero_image: /img/connect_globe.jpeg  
price: 7 # for sorting 

---

The challenges associated with the design and implementation of multi-agent systems range from hardware and software considerations to the development of a solid theoretical
foundation for their operation. In particular, the sensing and communication capabilities of each agent will dictate the distributed protocols used to achieve team objectives. For example, if each agent in a multi-robot system is equipped with a GPS-like sensor, then tasks such as formation keeping or localization can be trivially accomplished by communication between robots of their state information in a common world-frame. However, in applications operating in harsher environments, i.e., indoors, underwater, or in deep-space, GPS is not a viable sensing option. Indeed, in these situations, agents must rely on sensing without knowledge of a common inertial reference frame. In these scenarios, relative sensing can provide accurate measurements of, for example, range or
bearing, but without any common reference frame.

Formation Rigidity is an architectural requirement of multi-agent systems when a common inertial reference frame is unavailable.  Rigidity is a property of the sensing and communication graph of the system that allows team objectives such as formation control and localization to be achieved using range-only measurements.  This project is exploring various aspects of formation rigidity, including dynamic controllers to ensure the rigidity property is maintained in a multi-robot formation even in the presence of various constraints such as collision and obstacle avoidance or sensing and communication ranges, and notions of optimality for rigid formations.

The following video demonstrates the successful implementation of our rigidity maintenance scheme with a quadrotor testbed.  These experiments were performed at the Max Planck Institute in Tuebingen, German and is connected to our recent article submission to the International Journal of Robotics Research (Distributed Rigidity Maintenance Control with Range-only Measurements for Multi-robot Systems)

Additional related works are provided below.

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=Placeholder] --group_by none --order descending %}
