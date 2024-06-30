---
title: Control of Multi-Agent Systems
research_code: NDS
layout: research
image: /img/research/NDS/dynamic_network.jpg
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
price: 7 # for sorting 

---
Multi-agent systems are large-scale systems comprised of a group of coupled dynamic units, such as power generation sources in a power distribution network or a team of autonomous and unmanned vehicles. These systems interact via an exchange of information over a communication and sensing network. The complexity of this general class of problems arises from the heterogeneous dynamics of the systems comprising it, the diversity of interaction and communication mediums, and their scale in terms of the number of interacting systems and system interconnections. While research in this area is very active within the controls community, there remain many challenging and open problems that must be addressed before considering this a complete theory. The fundamental research questions we are looking at are:

1. How does the underlying connection topology of networked dynamic systems affect its systems-theoretic properties?
2. Can the connection topology be designed in conjunction with other synthesis techniques and tools used for dynamic systems?

We explore many different research questions in this area.  Below is a sample of some of our contributions.

## Consensus Algorithms

<div style="display: flex; align-items: flex-start;">
  <div style="flex: 2; padding-right: 20px;">
    <p>A fundamental task in many multi-agent coordination problems is the ability of the agents to distributedly agree on some quantity of interest. This may include agreeing on a common heading and speed for autonomous vehicles, opinions in social networks, or estimates of measured quantities. Our works have explored how the information exchange structure between agents influences the performance of these consensus algorithms.</p>
  </div>
  <div style="flex: 1;">
    <div style="text-align: center;">
      <img src="/img/research/NDS/consensus_traj.png" alt="Consensus trajectories" style="width: 70%;">
      <div style="margin-top: 10px;">
        <em>Trajectories of a consensus protocol.</em>
      </div>
    </div>
  </div>
</div>

<p class="title is-4">Selected Publications:</p>
{% bibliography --query @*[researchtopic~=consensus] --group_by none --order descending %}


## Network Identification

<div style="display: flex; align-items: flex-start;">
  <div style="flex: 2; padding-right: 20px;">
    <p>Many large scale networks are often designed with hopes of plug-and-play behavior. In other applications, agents in a network may be vulnerable to attack or failure resulting in changes to the network structure and behavior.  As a result, the network structure may not be known.  It is of interest, therefore, to try to estimate or recover the network structure using only limited measurements from the network itself.  This  is known as the network identification problem. </p>
  </div>
  <div style="flex: 1;">
    <div style="text-align: center;">
      <img src="/img/research/NDS/netid_ex.png" alt="Network Identification" style="width: 70%;">
      <div style="margin-top: 10px;">
        <em>Fault identification in networks.</em>
      </div>
    </div>
  </div>
</div>

<p class="title is-4">Selected Publications:</p>
{% bibliography --query @*[researchtopic~=netID] --group_by none --order descending %}



All our publications in this area can be found below:

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=nds] --group_by none --order descending %}
