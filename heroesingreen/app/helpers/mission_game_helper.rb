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
    world_url = url_for(:controller=>:mission_game,:action=>:world_missions,:id=>region.id)
    
    generated_link = link_to_prototype_ajax_dialog(
                        render(:partial=>'world_mission_popup', :locals=>{:world_mission=>region}), #Mouseover popup
                        {:url=>world_url, :options=>{:method=>'get'}},  #url to retrieve for js lightbox
                        'alert',{:className=>'alphacube',:width=>540, :okLabel=> "Close"}, #js lightbox options
                        {:class=>"LINK#{region.id} popup_link", :title=>region.name}) #HTML options
                        
                        
    generated_html = "<dd>#{generated_link}</dd>"
    
    
    return generated_html
  end
end
