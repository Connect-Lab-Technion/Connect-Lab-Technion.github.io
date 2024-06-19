---
title: Passivity and Nonlinear Control
research_code: FDI
layout: research
image: /img/research/Passivity/PSGBlockDiagram.png
hero_height: is-small
hero_image: /img/connect_globe.jpeg  
price: 7 # for sorting 

---

Over the last few decades, many engineering systems
have become much more complex, as networked systems
and large-scale systems turned common, and “system-ofsystems” evolved into a leading design methodology. To
address the ever-growing complexity of systems, many
researchers suggested various component-level tools that guarantee system-level properties. One important example of such
a notion is passivity, which can be informally stated as
“energy-based control." Passivity theory has proven to be
a powerful tool across many application domains, primarily due to interconnection preserving properties and connections to performance and stability analysis of nonlinear systems.


<p class="title is-4">Related Publications:</p>
{% bibliography --query @*[researchtopic~=passivity] --group_by none --order descending %}
