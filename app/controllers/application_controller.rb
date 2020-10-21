class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :current_role
  helper_method :logged_in?

  def current_user
    if session[:login_type] == "user"
      User.find_by(id: session[:user_id])
    else
      Agent.find_by(id: session[:user_id])
    end
  end

  def current_role
    session[:login_type]
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
   redirect_to '/login' unless logged_in?
  end

  def verify_required_params(model_type, required_params = [])
    missing_params = []
    required_params.each do |req|
      next if params[model_type][req] == true || params[model_type][req] == false # handle param value is boolean
      missing_params.push(req) unless params[model_type][req].present?
    end

    return "Missing required parameter(s): #{missing_params.join(', ')}" if missing_params.present?
    return missing_params.blank?
  end

end
