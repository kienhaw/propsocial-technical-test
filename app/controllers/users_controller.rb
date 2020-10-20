class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create

    required_params = [:email, :password, :first_name, :last_name, :dob, :nric, :phone_number]

    @res = verify_required_params(:user, required_params)
    # @res[:ic_image]

    unless @res == true
      respond_to do |format|
        format.html { render :new }
        format.js # call create.js.erb on save errors
        format.json { render json: @res }
      end
    else
      user_params = {}
      required_params.map{ |p| user_params[p] = params[:user][p] if params[:user][p].present? }

      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html
          format.js
        else
          format.html { render :new }
          format.js # call create.js.erb on save errors
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

end
