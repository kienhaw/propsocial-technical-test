class AgentsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @agent = Agent.new
  end

  def create

    required_params = [:email, :password, :first_name, :last_name, :dob, :nric, :phone_number, :ren_no, :agency_name]

    @res = verify_required_params(:agent, required_params)
    # @res[:ic_image]
    byebug
    unless @res == true
      respond_to do |format|
        format.html { render :new }
        format.js # call create.js.erb on save errors
        format.json { render json: @res }
      end
    else
      agent_params = {}
      required_params.map{ |p| agent_params[p] = params[:agent][p] if params[:agent][p].present? }
      agent_params[:ic_image] = params[:agent][:ic_image] if params[:agent][:ic_image].present?
      agent_params[:agent_id_image] = params[:agent][:agent_id_image] if params[:agent][:agent_id_image].present?

      @agent = Agent.new(agent_params)
      @res = nil
      respond_to do |format|
        if @agent.save
          format.html
          format.js
        else
          format.html { render :new }
          format.js # call create.js.erb on save errors
          format.json { render json: @agent.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
