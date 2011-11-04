module CalificacionesHelper
  
  def rating_stars(f, atributo)
    radio_buttons = ""
    10.times do |i|
      radio_buttons << f.radio_button(atributo, i+1, :class => "star {split:2}")
    end
    radio_buttons.html_safe
  end
  
end
