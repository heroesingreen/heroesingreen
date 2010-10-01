class SignupController < ApplicationController
  #Newsletter signup
  def index
    @signupEmail = SignupEmail.new
    @signupEmail.email = 'Email Address'
    respond_to do |format|
        format.html #signup.html.erb
    end
  end
  
  def create
    @signupEmail = SignupEmail.new(params[:signupEmail])
    respond_to do |format|
      if @signupEmail.save
        flash.now[:notice] = 'Great! You\'ll hear from us soon.'
      else
        flash[:error] = @signupEmail.errors
      end
      format.html {render "index"}
    end
  end
end