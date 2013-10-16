class ScholarshipMessagesController < ApplicationController
  respond_to :html

  def index
  end

  def create
    mail = ScholarshipMessage.new(params[:contact_form])
    if mail.deliver
      redirect_to root_path, :notice => 'Email has been sent.'
    else
      redirect_to root_path, :notice => 'Email could not be sent.'
    end
  end

end