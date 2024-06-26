---
title: Secure and Resillient Networked Systems
research_code: FDI
layout: research
image: /img/research/NDSRobust/secure_nds2.png
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
price: 7 # for sorting 

---

As large scale and networked technical infrastructures become more common, we must ensure that they can operate robustly and with resillience in the face of model uncertainties or even antagonistic attacks.  Our research explores novel frameworks and methodologies for designing secure and resilient multi-agent systems.  Our research takes a proactive approach, aiming to develop inherently secure systems with built-in breach detection mechanisms and countermeasures.

We adopt a systematic approach to incorporate security considerations into the fundamental design principles of networked dynamical systems, creating systems that are secure by design. Our research encompasses the development of analytical tools, algorithms, and frameworks that facilitate the design and analysis of secure multi-agent systems, enhancing their resilience against various types of attacks and ensuring their ability to accomplish their intended tasks reliably.  We also develop analysis tools to help quantify the robustness, or vulnerability, of the network system to attacks.  

<div style="display: flex; justify-content: center;">
  <img src="/img/research/NDSRobust/secure_nds1.png" alt="Secure consensus" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/NDSRobust/effective_resistance-eps-converted-to.png" alt="Network robustness" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
  <img src="/img/research/NDSRobust/structure_rank.png" alt="Structural rank" style="max-width: 30%; margin: 0 10px; object-fit: contain; max-height: 200px;">
</div>


<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=robust] --group_by none --order descending %}
