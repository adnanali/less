module LinkHelper
  def prev_next(current)
   items = @pages.find(:all,
                       :in_directory => @page.dir,
                       :recursive => true,
                       :reverse => false,
                       :sort_by => "created_at")
 
   home_page = @pages.find(:title => current.category, :in_directory => @page.dir)
   items.delete(home_page)

   index = items.index(current)
   prev_page = items.first == current ? nil : items[index-1]
   next_page = items.last == current ? nil : items[index+1]

   html = '<div class="nav">'
   unless prev_page.nil?
     html += link_to "previous", prev_page.url
   end
   if !prev_page.nil? && !next_page.nil?
    html += " | "
   end
   unless next_page.nil?
    html += link_to "next", next_page.url
   end
   html += '</div>'
 
   return html
  end
end
 
Webby::Helpers.register(LinkHelper)
