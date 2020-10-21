class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create

    required_params = [:email, :name, :contact, :ad_id]

    @res = verify_required_params(nil, required_params)

    unless @res == true
      flash[:danger] = @res
      return redirect_back(fallback_location: request.referer)
      # respond_to do |format|
      #   format.html {  }
      #   format.js # call create.js.erb on save errors
      #   format.json { render json: @res }
      # end
    else
      inquiry_params = {}
      required_params.map{ |p| inquiry_params[p] = params[p] if params[p].present? }
      inquiry_params[:source] = current_user

      @inquiry = Inquiry.new(inquiry_params)
      @res = nil
      respond_to do |format|
        if @inquiry.save
          flash[:success] = 'Inquiry was successfully sent'
          return redirect_back(fallback_location: request.referer)
        else
          flash[:danger] = @inquiry.errors
          return redirect_back(fallback_location: request.referer)
        end
      end
    end
  end
end
