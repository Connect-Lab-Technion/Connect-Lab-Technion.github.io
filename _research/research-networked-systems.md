---
title: Control of Multi-Agent Systems Systems
research_code: NDS
layout: research
image: /img/research/NDSAnalysis/dynamic_network.jpg
hero_height: is-small
hero_image: /img/connect_globe.jpeg  
price: 7 # for sorting 

---
Multi-agent systems are large-scale systems comprised of a group of coupled dynamic units, such as power generation sources in a power distribution network or a team of autonomous and unmanned vehicles. These systems interact via an exchange of information over a communication and sensing network. The complexity of this general class of problems arises from the heterogeneous dynamics of the systems comprising it, the diversity of interaction and communication mediums, and their scale in terms of the number of interacting systems and system interconnections. While research in this area is very active within the controls community, there remain many challenging and open problems that must be addressed before considering this a complete theory. The fundamental research questions we are looking at are:

1. How does the underlying connection topology of networked dynamic systems affect its systems-theoretic properties?
2. Can the connection topology be designed in conjunction with other synthesis techniques and tools used for dynamic systems?

# Canonical Modeling of Networked Dynamic Systems

Identifying the structure of canonical models for networked dynamic systems allows for a systematic way to study the properties of the system for both analysis and synthesis purposes. At times it is very straightforward to embed the connection topology of a networked system inside the overall dynamics. However, it becomes more enlightening to specify the connection topology as an additional parameter to the system dynamics, allowing for a more transparent understanding of how that parameter affects. 

<p>
    <img src="/img/research/NDSAnalysis/NDS_classification.jpg" alt="Classification of network dynamic systems" style="width: 30%;">
    <em>Classification of network dynamic systems</em>
</p>

Additional related works are provided below.

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=Placeholder] --group_by none --order descending %}
