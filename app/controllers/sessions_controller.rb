class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :login]

  def new
  end

  def create

  end

  def login
    @user = User.find_by(email: params[:email]) if params[:type] == "user"
    # @user = Agent.find_by(email: params[:email]) if params[:type] == "agent"
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id if params[:type] == "user"
       # session[:agent_id] = @user.id if params[:type] == "agent"
       session[:login_type] = params[:type]
       redirect_to '/ads'
    else
      @error = {message: "Failed to login, invalid credentials", type: "user"}
      respond_to do |format|
        format.html { render :new }
        format.js # call login.js.erb on save errors
        format.json { render json: @error }
      end
    end
  end

  def welcome
  end

  def logout
    reset_session
    redirect_to '/login'
  end
end
