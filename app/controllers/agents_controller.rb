class AgentsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @agent = Agent.new
  end

  def create

    required_params = [:email, :password, :first_name, :last_name, :dob, :nric, :phone_number, :ren_no, :agency_name]

    @res = verify_required_params(:agent, required_params)
    # @res[:ic_image]
    unless @res == true
      @res += ", ic_image" unless params[:user][:ic_image].present?
      @res += ", agent_id_image" unless params[:user][:agent_id_image].present?
      respond_to do |format|
        format.html { render :new }
        format.js # call create.js.erb on save errors
        format.json { render json: @res }
      end
    else
      agent_params = {}
      required_params.map{ |p| agent_params[p] = params[:agent][p] if params[:agent][p].present? }

      @agent = Agent.new(agent_params)
      @res = nil
      respond_to do |format|
        if @agent.save

          image = Image.new
          image.source = @agent
          image.name = params[:agent][:ic_image]
          image.remark = "ic_image"
          image.save!

          id_image = Image.new
          id_image.source = @agent
          id_image.name = params[:agent][:agent_id_image]
          id_image.remark = "agent_id_image"
          id_image.save!

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
