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

Sort publications [<span style="color:red">
chronologically
</span>]({{ site.baseurl }}/publications/) or by [<span style="color:red">
type
</span>]({{ site.baseurl }}/publications_by_type/). You are also welcome to browse slides from <span style="color:red">
<b>talks</b>
</span>.

[[Invited](#Invited)] [[Talks](#Talks)]

# Plenary, Invited, and Workshop Talks
<div id="Invited" style="padding-top: 150px; margin-top: -150px;"></div>

{% bibliography --file DZ_TalksPosters --query @*[researchtopic~=invited]--group_by none --order descending %}

# Seminar Talks
<div id="Talks" style="padding-top: 150px; margin-top: -150px;"></div>

{% bibliography --file DZ_TalksPosters --query @*[researchtopic~=talk]--group_by none --order descending %}