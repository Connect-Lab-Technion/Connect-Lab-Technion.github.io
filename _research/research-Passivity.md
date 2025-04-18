---
title: Passivity and Nonlinear Control
research_code: FDI
layout: research
image: /img/research/Passivity/PSGBlockDiagram.png
hero_height: is-small
hero_image: /img/Connect_head_bkg.png  
price: 3 # for sorting 

---

Over the last few decades, many engineering systems
have become much more complex, as networked systems
and large-scale systems turned common, and “system-of-systems” evolved into a leading design methodology. To
address the ever-growing complexity of systems, many
researchers suggested various component-level tools that guarantee system-level properties. One important example of such
a notion is passivity, which can be informally stated as
“energy-based control." Passivity theory has proven to be
a powerful tool across many application domains, primarily due to interconnection preserving properties and connections to performance and stability analysis of nonlinear systems.

Our research focuses primarily on passivity theory as both an analysis and synthesis tool for networked systems.  Our most profound result shows that diffusively coupled networked systems can be analyzed using notions from convex networked optimization theory where passivity serves as the bridge between the dynamical systems world and the optimization world.  This work has led to new geometric and optimization based approaches for passivation of passivity-short systems.  

<div style="display: flex; justify-content: center;">
  <img src="/img/research/Passivity/networkd_duality.png" alt="Diffusive Networks and Network Optimization" style="max-width: 50%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/Passivity/net_passivation.png" alt="Network Passivation" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/Passivity/passivation.png" alt="Passivation, monotonicity, and convexity" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
</div>



<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=passivity] --group_by none --order descending %}
