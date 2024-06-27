---
layout: page
title: Publications
show_sidebar: false
hide_footer: false
hero_height: is-small
hero_image: /img/Connect_head_bkg.png 
---

<style>
.csl-block {
    font-size: 16px;
}
.csl-title, .csl-author, .csl-event, .csl-editor, .csl-venue {
    display: block;
    position: relative;
    font-size: 16px;
}

.csl-title b {
    font-weight: 600;
}

.csl-content {
    display: inline-block;
    vertical-align: top;
    padding-left: 20px;
}

.bibliography {
   list-style-type: none;
}
</style>

 <div id="Top"></div>

Sort publications [<span style="color:red">
chronologically
</span>]({{ site.baseurl }}/publications/) or by <span style="color:red">
<b>type</b>
</span>. You are also welcome to browse slides from [<span style="color:red">
talks
</span>]({{ site.baseurl }}/talks).

<!-- You are also welcome to browse slides from [<span style="color:red">talks</span>]({{ site.baseurl }}/talks). -->


[[Journal Articles]](#Journal-Articles) [[Book Chapters]](#Book-Chapters) [[Conference Articles]](#Conference-Articles) [[ArXiv & Technical Reports]](#Technical-Reports) [[PhD & MSc Theses]](#Theses) [[Patents](#Patents)]

# Journal Articles
<div id="Journal-Articles" style="padding-top: 150px; margin-top: -150px;"></div>
{% bibliography --group_by none --query @article --order descending %}

[Back to Top](#Top)

# Book Chapters
<div id="Book-Chapters" style="padding-top: 150px; margin-top: -150px;"></div>
{% bibliography --group_by none --query @incollection --order descending %}

[Back to Top](#Top)

# Conference Articles
<div id="Conference-Articles" style="padding-top: 150px; margin-top: -150px;"></div>
{% bibliography --group_by none --query @InProceedings --order descending %}

[Back to Top](#Top)

# ArXiv and Technical Reports
<div id="Technical-Reports" style="padding-top: 150px; margin-top: -150px;"></div>
{% bibliography --group_by none --query @TechReport --order descending %}

[Back to Top](#Top)

# PhD & MSc Theses
<div id="Theses" style="padding-top: 150px; margin-top: -150px;"></div>
{% bibliography --group_by none --query @thesis --order descending %}

[Back to Top](#Top)

<!--# Master's Theses
<div id="Master-Theses"></div>
{% bibliography --group_by none --query @mastersthesis --order descending %}-->

# Patents
<div id="Patents" style="padding-top: 150px; margin-top: -150px;"></div>
{% bibliography --file DZ_patents  --group_by none  --order descending %}

[Back to Top](#Top)

