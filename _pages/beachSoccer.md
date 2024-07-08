---
layout: default
permalink: /beachSoccer/
title: Beach Soccer
nav: true
nav_order: 4
---

<div class="post">

  <div class="header-bar">
    <h1>Beach Soccer</h1>
    <h2>{{ site.blog_description }}</h2>
  </div>

  <ul class="post-list">
    {% for post in site.beachSoccer %}
      <li>
        <h3>
          <a class="post-title" href="{{ post.url | relative_url }}">{{ post.title }}</a>
        </h3>
        <p>{{ post.description }}</p>
        {% if post.thumbnail %}
          <img class="post-thumbnail" src="{{ post.thumbnail | relative_url }}" alt="{{ post.title }}">
        {% endif %}
      </li>
    {% endfor %}
  </ul>

</div>