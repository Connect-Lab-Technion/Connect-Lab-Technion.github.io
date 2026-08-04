---
title: Passivity and Nonlinear Control
research_code: FDI
layout: research
image: /img/research/Passivity/PSGBlockDiagram.png
hero_height: is-small
hero_image: /img/Connect_head_bkg.png  
menubar_toc: true
toc_title: Topics
price: 3 # for sorting 

---

Passivity is an energy-based property that is especially useful for interconnected and nonlinear systems. Because passive systems preserve stability under broad classes of interconnections, passivity provides a constructive way to move between component-level properties and network-level guarantees.

Our work uses passivity both as an analysis tool and as a synthesis tool. A recurring theme is the connection between passivity, monotonicity, convex network optimization, cooperative control of systems that are not passive before feedback design, and newer geometric notions of dissipativity relative to target manifolds.

## Passivity, Duality, and Network Optimization

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Passivity-based cooperative control can be interpreted through the lens of network optimization. This viewpoint reveals a duality between diffusive interconnections and optimization constraints, and it explains why steady-state behavior in passive networks often solves an implicit optimization problem.</p>
    <p>These results connect edge agreement, passivity analysis, inverse optimality, and distributed controller synthesis for networked systems.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/Passivity/networkd_duality.png" alt="Duality between diffusive networks and network optimization">
      <figcaption>Duality between diffusive network interconnections and optimization structure.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Burger2014_J||key=Mathias2013||key=Zelazo2009b_J||key=Sharf2017a_J||key=Sharf2017b_J] --group_by none --order descending %}

## Passivation of Passive-Short Systems

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Many nonlinear systems are not passive with the inputs and outputs available to the controller. Passivation asks how to transform or regularize the input-output map so that the resulting closed-loop component can be safely interconnected with other agents.</p>
    <p>Our work develops geometric and optimization-based passivation methods for passive-short systems, including characterizations of passivizing input-output transformations for SISO and MIMO nonlinear systems.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/Passivity/passivation.png" alt="Passivation through monotonicity and convexity">
      <figcaption>Passivation through geometric, monotonicity, and convexity-based transformations.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Sharf2024_J||key=Sharf2021c_J||key=Sharf2019c_J||key=Sharf2019a_J||key=Jain2018a_J||key=Sharf2020] --group_by none --order descending %}

## Transversal and Geometric Passivity

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Classical passivity usually measures energy exchange relative to an equilibrium, a shifted equilibrium, or a pair of trajectories. Transversal passivity changes the reference object: the target can be a manifold, orbit, agreement set, or other geometric constraint, and the dissipation certificate only penalizes motion transverse to that target.</p>
    <p>Our ongoing work develops this geometric viewpoint for interconnected systems. The central objects are manifold error maps, tubular retractions, and compatibility conditions that allow feedback interconnections to preserve transverse dissipativity. This gives a passivity framework for behaviors such as agreement, synchronization, and limit-cycle regulation, where motion along the target set should remain free.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/Passivity/transversal_passivity_geometry.png" alt="Manifold error map for transversal passivity">
      <figcaption>Geometric passivity uses manifold error maps to measure the transverse distance to a target set.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Related Material:</p>
<p><a href="/Talks/UW_GeoPassivity.pdf">Toward a Geometric Theory of Passivity</a> presents the current transversal passivity framework.</p>

## Nonlinear Consensus and Identification

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Passivity also gives tools for analyzing nonlinear consensus, orientation effects in directed networks, and data-driven questions such as network identification. In these problems, the passivity property acts as a bridge between local nonlinear dynamics and global graph-dependent behavior.</p>
    <p>This direction connects passivity analysis on digraphs, network feedback passivation, and passivity-based methods for recovering network structure.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/Passivity/net_passivation.png" alt="Network feedback passivation architecture">
      <figcaption>Network feedback passivation for cooperative control of passive-short agents.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Yue2025_CDC||key=Sharf2019a_J||key=Sharf2018a||key=Sharf2019a] --group_by none --order descending %}

## Complete Related Publications

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=passivity] --group_by none --order descending %}
