class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      Notifications.new_message(@message).deliver
      redirect_to(root_path, :notice => "Agradecemos tu retroalimentación")
    else
      flash.now.alert = "Por favor llena todos los campos."
      render :new
    end
  end

end
