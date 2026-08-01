---
title: Optimization Over Networks
research_code: OPT  
layout: research
image: /img/research/NDSOptimization/x_n20_T70.jpg
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
menubar_toc: true
toc_title: Topics
price: 7 # for sorting 

---

Optimization over networks appears in two complementary ways in our research. First, distributed algorithms allow agents to solve a shared optimization or decision-making problem using only local communication. Second, optimization provides a language for analyzing complex networked dynamical systems, including passivity-based control, clustering, sparse design, and cooperative seeking.

This page focuses on the optimization layer itself. Energy dispatch, passivity, and network identification papers are included when their main contribution is also tagged as optimization.

## Distributed Negotiation and Decision Making

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Distributed negotiation problems model agents that must agree on a decision while respecting local preferences, dynamics, and communication constraints. The resulting algorithms blend optimization, agreement protocols, and feedback interconnections.</p>
    <p>Our work studies finite-time dual methods, switching communication, real-time preference-based agreement, and negotiation with connectivity constraints.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/NDSOptimization/group-coordination.png" alt="Distributed team coordination through optimization">
      <figcaption>Distributed decision making and cooperative optimization over a network.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Zelazo2013_J||key=Zelazo2012b||key=Zelazo2011||key=Shoushan2017||key=BenShoushan2017] --group_by none --order descending %}

## Network Design, Clustering, and Sparsity

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Many networked-control problems ask for a graph, weighting, or sparsity pattern that optimizes performance while preserving structural properties. These questions connect graph theory, convex optimization, and dynamical-systems analysis.</p>
    <p>Our work studies sparse relative sensing networks, cycle design, clustering in dynamical networks, and optimization-based graph synthesis.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/NDSOptimization/network_design.png" alt="Optimization-based network design">
      <figcaption>Network design problems connect graph structure to closed-loop performance.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Schuler2013||key=Burger2011_J||key=Burger2012||key=Schuler2012||key=Zelazo2012d||key=Zelazo2011b] --group_by none --order descending %}

## Control Synthesis and Cooperative Seeking

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Optimization also provides synthesis tools for cooperative control. In passivity-based settings, network optimization gives a constructive route to controller design. In source-seeking and zeroth-order settings, agents use local measurements to optimize an objective that is not available in closed form.</p>
    <p>This thread includes optimization-based cooperative control synthesis, networked zeroth-order oracles, moving-source seeking, and energy-dispatch problems with device constraints.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/NDSOptimization/netid.png" alt="Optimization structure for network inference and control synthesis">
      <figcaption>Optimization structure arising in network inference and cooperative control synthesis.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Michael2022a_J||key=Michael2020a||key=Sharf2017b_J||key=Sharf2017a_J||key=Jain2018a_J||key=Sharf2019a||key=Rist2016_J||key=Sharf2021b_J] --group_by none --order descending %}

## Complete Related Publications

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=optimization] --group_by none --order descending %}
