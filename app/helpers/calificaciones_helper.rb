module CalificacionesHelper
  
  def rating_stars(f, atributo)
    radio_buttons = ""
    (1..10).each do |i|
      radio_buttons << f.radio_button(atributo, i, :class => "star {split:2}")
    end
    radio_buttons.html_safe
  end
  
end
