class SignupController < ApplicationController
  before_filter :authenticate_user!, :only => [:list]
  #before_filter :ensure_user, :only => [:list]

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
  
  #GET /signup/show
  def show
    @user = get_user
    if(@user and @user.admin)
      @emails = SignupEmail.all
      respond_to do |format|
        format.html #show.html.erb
        format.xml {render :xml => @emails}
      end
    else
      flash[:error] = 'Access Denied'
      redirect_to(:controller => "account", :action => "login")
    end
  end
  
end 
