class AccountController < ApplicationController

  # Show the registration page
  def register
    @user = User.new
    @mission_id = params[:id]
    respond_to do |format|
      format.html #register.html.erb
    end
  end

  # Actually create an account
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

end
