---
title: Fault Detection & Isolation Over Networks
research_code: FDI
layout: research
image: /img/research/FDINetworks/FDI_network_local.jpg
hero_height: is-small
hero_image: /img/connect_globe.jpeg  
price: 7 # for sorting 

---

An unwritten axiom of engineered systems is that they break. The consequences of failures in engineered systems can range from economic catostrophe to the loss of human life. While creating failure-free systems is not yet realizable, there has been great progress towards the development of safety mechanisms that can identify and respond to various failures within a system. This has lead to an important formal sub-discipline in the engineering sciences known as fault detection and isolation (FDI). Advances in FDI have also led to the notion of designing fault tolerant systems; these are systems that are able to maintain a certain level of performance and operation even in the presence of component-level failures.

Despite the success of FDI across many application domains, there remains a lack of results for large-scale and distributed systems. Indeed, even fundamental methods for the analysis and design of these systems has not reached the maturity of their monolithic counterparts. Despite this, dependance on these systems is growing at an increasing rate such as can be seen with power distribution networks, transportation networks, and large-scale manufacturing plants. The architecture of these systems, characterized by the coupling of a large number of dynamic systems over an information exchange network, is nevertheless a core component of many future projects, including development of the “smart-grid,” autonomous transportation networks, and automated air traffic control. As the theory of these systems mature and as they become more integrated into today’s infrastructure, it becomes paramount that a corresponding theory of fault detection and isolation for these systems is also developed.

This project seeks to contribute fundamental theoretical results and validation methods for fault detection and isolation in networked dynamic systems.


<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=Placeholder] --group_by none --order descending %}
