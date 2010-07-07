module MissionGameHelper
  def generate_image_map_link_css(region)
    generated_css = "a.LINK#{region.id} {left:#{region.link_css_left}px; " + 
                                "top:#{region.link_css_top}px; " +
                                "width:#{region.link_css_width}px; " +
                                "padding-top:#{region.link_css_padding}px; "
    generated_css += "z-index:#{region.link_css_zindex}px;" if !region.link_css_zindex.nil?                          
    generated_css += "}"    
    return generated_css                            
  end
  
  def generate_image_map_link(region)
    generated_html = "<dd><a " +
                        "class = \"LINK#{region.id} popup_link\"" +
                        "title = \"#{region.name}\"" +
                        "href = \"javascript:alert('Coming soon!3');return false;\">" +
                        render(:partial=>'world_mission_popup', :locals=>{:world_mission=>region}) +
                      "</a></dd>"
    return generated_html
  end
end
