class AdsController < ApplicationController

  def index
    @ads = Ad.all
  end

  def new
    @ad = current_user.ads.new
  end

  def create
    required_params = [:property_name, :price, :ad_type]

    @res = verify_required_params(:ad, required_params)

    unless @res == true
      @res += ", images" unless params[:ad][:images].present?
      respond_to do |format|
        format.html { render :new }
        format.js # call create.js.erb on save errors
        format.json { render json: @res }
      end
    else
      ad_params = {}
      required_params.map{ |p| ad_params[p] = params[:ad][p] if params[:ad][p].present? }

      @ad = current_user.ads.new(ad_params)

      @res = nil
      respond_to do |format|
        if @ad.save

          params[:ad][:images].each do |image|
            img = Image.new
            img.source = @ad
            img.name = image
            img.remark = "property_image"
            img.save!
          end

          format.html
          format.js
        else
          format.html { render :new }
          format.js # call create.js.erb on save errors
          format.json { render json: @ad.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end
end
