class AccountController < ApplicationController
  before_filter :authenticate_user!, :only => [:home, :accomplishments, :quest_log, :password]
  #before_filter :ensure_user, :only => [:home, :accomplishments, :quest_log, :password]
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
    logger.info "Got in action home in account controller"
    @force_refresh_on_login = true
  	@user = get_user
    @level = @user.get_level
    if(@level)
      next_level = @level.get_next_level
      if(next_level)
        @points_required = next_level.points_required - @user.total_points
      end
    end

    @missions = get_user.missionStatuses.select{|s| s.activated?}.map{|m| m.mission}
    logger.info "Current missions: " + @missions.inspect

  	#Update first name if any
  	if(request.post? && params[:user])
  	   @user.update_attributes(params[:user])
	  end
  end
  
  # Show upcoming missions
  def quest_log
    @upcoming_quests = get_user.missionStatuses.find(:all)
    @upcoming_quests = @upcoming_quests.select{|quest| (!quest.completed?) || quest.mission.repeatable?}
    @missions = @upcoming_quests.map { |ms| ms.mission }
    @missions_title = "Upcoming Quests"
  end
  
  # Show accomplishments
  def accomplishments
    mission_statuses = get_user.missionStatuses.find(:all, :conditions=>["status = ?", MissionStatus::COMPLETED_STATUS])
    @missions = mission_statuses.map { |ms| ms.mission }
    @missions_title = "Accomplishments"
  end
  
  # Allow user login
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:email], params[:password])
      if user #login success
        session[:user_id] = user.id
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
        redirect_to(:controller =>"mission_game", :action => "index")
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
    redirect_to :controller => 'mission_game', :action => 'index'
  end
  
  # Change password
  def password
    @user = get_user
    if request.post?
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Successfully updated password!'
        redirect_to(:action => "home")
      end
    end
  end

  def setAvatar
    @user = get_user
    @img = params[:img]
    if(@user and @img)
      @user.saveAvatar(@img)
    end
    redirect_to(:action => "home")
  end
  
  private
  
  def choose_layout
    if (request.xhr?)
    	@ajax=true
    	false
	  else
	    case(action_name)
      when 'home'
        return 'account'
      when 'accomplishments'
        return 'account'
      when 'quest_log'
        return 'account'
      else
  		  return 'mission_game'
		  end
  	end
  end
end
