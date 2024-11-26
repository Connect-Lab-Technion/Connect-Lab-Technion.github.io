---
title: Robotic Testbed and Validation 
research_code: Robotics
layout: research
image: /img/research/Robotics/turtlebots1.png
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
price: 8 # for sorting 

---

While the primary focus of research in our group is on the theoretical foundations of network system, we also recognize the importance of validating our ideas on real-world systems.  A multi-robot testbed provides an excellent platform to test our ideas and also attract undergraduate students to our research group.  We are developing both ground and aerial robots for this puprose.  We also collaborate with roboticsts to help realize our more sophisticated research ideas.

### Robot platforms 

<div class="columns is-multiline">
  {% assign sorted_products = site.team | where:"category","robots" | sort: "deployment" | reverse %}
  {% for product in sorted_products %}
    <div class="column is-one-fifth-desktop is-6-tablet">
      <a href="{{ product.url | prepend: site.baseurl }}">
        <div class="card">
          {% if product.image %}
            <div class="card-image">
              <figure class="image is-3by3" style="display: flex; align-items: center; justify-content: center; max-width: 250px; max-height: 250px; overflow: hidden;">
                <img src="{{ product.image }}" alt="{{ product.title }}" style="width: 250px; height: 250px; object-fit: cover; display: block; margin: auto;">
              </figure>
            </div>
          {% endif %}
          <div class="card-content">
            <p class="title is-6">{{ product.title }}</p>
            <p class="subtitle is-6">{{ product.subtitle }}</p>
          </div>
        </div>
      </a>
    </div>
  {% endfor %}
</div>


### Related Publications

{% bibliography --query @*[researchtopic~=robotics] --group_by none --order descending %}
