class AccountController < ApplicationController
  before_filter :ensure_user, :only => [:home]
  layout :choose_layout

  # Show the registration page
  def register
    @user = User.new
    @mission_id = params[:id]
    respond_to do |format|
      format.html #register.html.erb
    end
  end

  # Create an account
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = 'Account successfully created.'
        format.html {redirect_to :controller=>:mission_game, :action=>:complete, :id=>params[:id]}
      else
          flash[:error] = @user.errors
          format.html { render :action => "register" }
      end
    end
  end

  # Show user home page
  def home
    @force_refresh_on_login = true
  	@user = get_user
  end
  
  # Allow user login
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:email], params[:password])
      if user #login success
        session[:user_id] = user.id
        flash[:notice] = nil        
        if(request.xhr?) #AJAX?
        	if(params[:refresh]) #Some pages need the whole page to be refreshed
        		@force_refresh = true
        	end        	
        	render :partial => 'shared/login_module'
        else
        	redirect_to(:action => "home")
    	end
      else
        flash[:notice] = "Invalid user/password combination"
      end
    else #Not POST - display login module
      @suppress_ajax_login = true #Suppress the login ajax widget in the layout
    end
  end
  
  # Log user out
  def logout
    session[:user_id]=nil
    flash[:notice] = "You have been successfully logged out"
    if(params[:refresh]) #Some pages need the whole page to be refreshed
  		@force_refresh = true
  	end
    render :action => "login"
  end
  
  private
  
  def choose_layout
    if (request.xhr?)
    	@ajax=true
    	false
	  else
  		'mission_game'
  	end
  end
end
