---
title: Secure and Resilient Networked Systems
research_code: FDI
layout: research
image: /img/research/NDSRobust/secure_nds2.png
card_alt: Secure-by-design network in which encrypted task information reveals a channel attack
card_label: Resilience
summary: Analysis and design for networks that must operate through uncertainty, faults, communication failures, and malicious interference.
hero_caption: A representative figure from our secure-by-design consensus work, where the task encoding allows the network manager to expose structured channel tampering.
story: Resilience is a property of the architecture, not only of an anomaly detector. We study how graph structure, coding, uncertainty, and redundancy can make coordinated dynamics withstand faults and attacks.
research_questions:
  - How can the control objective itself be encoded against channel tampering?
  - Which graph structures retain rank, agreement, or performance after faults?
  - How do uncertainty and heterogeneous dynamics change consensus robustness?
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
menubar_toc: true
toc_title: Topics
price: 6 # for sorting 

---

Large-scale networked systems must continue to operate despite uncertainty, faults, communication failures, and malicious interference. Security and resilience therefore need to be part of the control architecture, not only an after-the-fact detection layer.

Our work studies secure-by-design consensus, robustness of networked dynamics, structural resilience, and fault-tolerant graph properties. The emphasis on this page is the robustness and security layer; related consensus and network-identification methods are handled on their own pages when that is the primary contribution.

## Secure-by-Design Consensus

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Secure-by-design consensus modifies the information exchanged over the network so that channel tampering can be detected or mitigated by the protocol structure itself. Instead of treating attacks as external disturbances, the controller architecture encodes redundancy and objective information directly into the consensus process.</p>
    <p>Our work develops objective-coding methods and robustness analysis tools for structured channel tampering in consensus networks.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/publications/snapshots/Fabris2022a_J.jpg" alt="Secure-by-design consensus architecture from the publication">
      <figcaption>The objective-coding architecture used to analyze structured channel tampering.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Fabris2023_J||key=Fabris2022a_J] --group_by none --order descending %}

## Robust Consensus and Network Uncertainty

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Robust consensus asks how graph weights, uncertainty, heterogeneity, and higher-order agent dynamics affect the ability of a network to reach agreement. These questions are especially important when the communication graph is weighted, directed, or only approximately known.</p>
    <p>This work develops robustness measures, uncertainty analysis, and graph-dependent tools for consensus networks under model mismatch and heterogeneous dynamics.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/research/NDSRobust/effective_resistance-eps-converted-to.png" alt="Effective-resistance robustness measure for uncertain consensus networks">
      <figcaption>Graph-theoretic robustness measures for uncertain consensus networks.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Muhkerjee2017a_J||key=Muhkerjee2017b_J||key=Mukherjee2016a||key=Zelazo2014a_J||key=Mukherjee2016b] --group_by none --order descending %}

## Structural Resilience and Fault Tolerance

<div class="columns is-vcentered is-variable is-5 research-topic-row">
  <div class="column is-two-thirds">
    <p>Some resilience questions depend mainly on structure: which sparsity patterns preserve rank, how many faults can a cluster assignment tolerate, and where does the graph architecture create unavoidable vulnerability? These problems require tools from structural systems theory, graph theory, and combinatorics.</p>
    <p>Our work studies structural rank, resilience of sparsity patterns, and fault-tolerant cluster assignment in multi-agent systems.</p>
  </div>
  <div class="column">
    <figure class="research-figure">
      <img src="/img/publications/snapshots/Belabbas2021a_J.jpg" alt="Graph used to characterize structural rank and resilience">
      <figcaption>A representative graph construction from the structural-rank and resilience study.</figcaption>
    </figure>
  </div>
</div>

<p class="title is-4 research-publications">Representative Publications:</p>
{% bibliography --query @*[key=Sharf2025a_J||key=Belabbas2021a_J] --group_by none --order descending %}

## Complete Related Publications

<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=robust] --group_by none --order descending %}
