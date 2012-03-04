class TagsController < ApplicationController
  
  def index
    @tags = Tag.where("nombre LIKE ?", "%#{params[:q]}%")
    
    respond_to do |f|
      f.json {render :json => @tags.map{|t| {:id => t.id, :nombre => t.nombre} } }
    end
  end
end
