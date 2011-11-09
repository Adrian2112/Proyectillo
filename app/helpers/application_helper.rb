module ApplicationHelper
  
  def hasht_to_js_hash(params)
    params = params.map { |k,v| "'#{k}' : '#{v}'" }.join(", ")
    return "#{params}"
  end
  
  def links_coma(args)
    links = []
    # si son menos de 4 muestralos todos
    if args.size <= 4
      args.each do |arg|
        tooltip = {:title => arg.nombre, :class => "tooltip"} if arg.nombre.size > (100/args.size)
        links << link_to(truncate(arg.nombre, :length => (100/args.size)), arg, tooltip)
      end
      
      return links.join(", ").html_safe
      
    else
      args.first(3).each do |arg|
        links << link_to(truncate(arg.nombre, :length => 25), arg, :title => arg.nombre, :class => "tooltip")
      end
    end
    links = links.join(", ")
    if args.size > 3
      links << ","
      nombres = args[3..-1].map(&:nombre).join("<br/>")
      links << content_tag(:span, "y #{args.size-3} mas", :class => "underline tooltip", :title => nombres)
    end
    links.html_safe
  end
  
end
