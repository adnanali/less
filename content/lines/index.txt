---
title:       lines
created_at:  2008-08-02 14:06:40.000000 -06:00
filter:
  - erb
  - gfm
---
<h1>lines</h1>

<ol>
  <%
    p = @pages.find(:limit => :all, :in_directory => @page.dir, :recursive => true,
                           :reverse => false, :sort_by => "created_at")
    p.delete(@page)
    p.each do |pp|
    %>
    <li><%= link_to(pp.title, pp) %></li>
  <% end %>
</ol>
