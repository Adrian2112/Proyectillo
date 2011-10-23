module ApplicationHelper
  
  def hasht_to_js_hash(params)
    params = params.map { |k,v| "'#{k}' : '#{v}'" }.join(", ")
    return "{ #{params} }"
  end
  
end
