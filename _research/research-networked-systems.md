---
title: Control of Multi-Agent Systems
research_code: NDS
layout: research
image: /img/research/NDS/dynamic_network.jpg
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
menubar_toc: true
toc_title: Topics
price: 1 # for sorting 

---
Multi-agent systems are large-scale systems comprised of coupled dynamic units, such as power-generation sources in a distribution network, sensor nodes in an estimation network, or teams of autonomous vehicles. These systems interact through communication, sensing, or physical coupling graphs, so their behavior is shaped jointly by the dynamics of the individual agents and by the structure of the network interconnecting them.

This page focuses on foundational questions in the control of multi-agent and networked dynamic systems. We use the interaction graph as a systems-theoretic object: it determines which relative measurements are available, how disturbances propagate, which modes are observable or controllable, and how performance scales with the size and structure of the network. The main research questions we study here are:

1. How does the underlying connection topology affect stability, performance, and identifiability?
2. Can graph structure and local controllers be designed together?
3. What can be inferred about a network from limited measurements of its dynamics?

Some publications tagged as networked dynamic systems also belong to other first-level research themes, such as formation control, passivity, event-triggered control, resilient networks, optimization, energy systems, and robotics. Those themes are handled on their own pages; this page keeps the emphasis on the core networked-systems layer.

## Modeling, Stability, and Graph Structure

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>At the most basic level, networked dynamic systems require models that combine agent dynamics with graph-theoretic interconnections. Our work studies how the graph enters system representations, how edge and node descriptions relate to each other, and how graph properties shape stability, zeros, performance, and admissible motions.</p>
    <p>This includes relative sensing networks, weighted Laplacians, signed and oriented graphs, graph contractions, model reduction, internal stability of diffusive couplings, and newer control-affine network models.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/NDS/control_affine_synchronization.png" alt="Control-affine network trajectories synchronizing">
      <figcaption>Admissible actuation pattern producing synchronization in a control-affine oscillator network.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Zelazo_LCSS26||key=Barkai2023a_J||key=leiter2021product||key=Leiter2021_J||key=Chen2018a_J||key=Zelazo2010_J||key=Briegel2011||key=Zelazo2009] --group_by none --order descending %}

## Consensus and Agreement Protocols

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>A fundamental task in multi-agent coordination is the ability of agents to distributedly agree on a quantity of interest. This may include common headings or speeds for vehicles, states in distributed estimation, or shared references in synchronized systems. In this part of the research program, consensus is treated as a canonical networked-system problem for understanding how graph orientation, edge dynamics, sampled measurements, filtering, and performance metrics affect convergence.</p>
    <p>Our work studies consensus from several complementary angles, including edge agreement, sampled-data consensus, graph orientation, pointing consensus, model reduction, and agreement protocol design.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/NDS/consensus_traj.png" alt="Consensus trajectories converging to agreement">
      <figcaption>Agent trajectories converging toward a common agreement value.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Barkai2026_ECC||key=Barkai2022a_J||key=Zelazo2018a||key=Trinh2018a||key=Leiter2017a||key=Zelazo2011_J||key=Zelazo2012a||key=Zelazo2009b_J||key=Zelazo2009] --group_by none --order descending %}

## Network Identification and Inference

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>In many networked systems, the interaction structure is not fully known. Links may fail, communication may be hidden, agents may be semi-autonomous, or the network may be too large to inspect directly. Network identification asks how to recover graph structure, detect changes, or infer special agents using only limited measurements from the network.</p>
    <p>Our work develops identification methods for diffusively coupled systems, link-fault monitoring for nonlinear networks, and leader identification in semi-autonomous consensus protocols.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/NDS/network_identification_sparse_matrix.png" alt="Sparse matrix pattern used in network identification">
      <figcaption>Sparse interaction patterns arising in network-identification problems.</figcaption>
    </figure>
  </div>
</div>

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-half">
    <figure class="research-figure">
      <img src="/img/research/NDS/leader_identification_sequence.png" alt="Leader identification through graph sequence densification">
      <figcaption>Leader-follower structure revealed through graph densification.</figcaption>
    </figure>
  </div>
  <div class="column">
    <p>Identification also connects naturally to spectral graph theory. For example, Fiedler-vector structure can reveal leader-follower partitions when the graph sequence has the right separation properties.</p>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[researchtopic~=netID] --group_by none --order descending %}

## Connections to Other Themes

Several directions build directly on the networked-systems foundations above, but have their own focused research pages:

* [Formation Control](/research/research-Formation%20Control/) studies spatial coordination and rigidity-based sensing/control architectures.
* [Passivity and Nonlinear Control](/research/research-Passivity/) develops energy-based and nonlinear tools for interconnected systems.
* [Distributed Energy Systems](/research/research-Energy/) applies distributed algorithms to power and energy networks.
* [Event Triggered Control and Estimation](/research/research-EventTrigger/) focuses on communication-efficient control and filtering.
* [Secure and Resilient Networked Systems](/research/research-SecureNetworks/) focuses on robustness, faults, and adversarial network behavior.
* [Optimization Over Networks](/research/research-Optimization%20over%20Networks/) focuses on distributed optimization and topology-design methods.
* [Robotic Testbed and Validation](/research/research-Robotics/) focuses on experimental platforms for validating multi-agent methods.

## Complete Related Publications

All publications tagged in this area are listed below. Some also appear on the more specific theme pages above when their primary contribution belongs there.

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=nds] --group_by none --order descending %}
