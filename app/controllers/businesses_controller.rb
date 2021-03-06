class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
    if params[:search]
      @businesses = Business.search(params[:search]).order("name ASC")
    else
      @businesses = Business.all.order('name ASC')
    end
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @businesses = Business.all
  end

  # GET /businesses/new
  def new
    redirect_to businesses_path unless is_owner?
    @business = Business.new
  end

  # GET /businesses/1/edit
  # Admin access for businesses
  def edit
    redirect_to businesses_path unless is_admin?
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
    # @business.user_id = current_user.id

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Your store has been updated!' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Your store was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:user_id, :neighborhood_id, :borough_id, :name, :street_address, :email, :website, :phone, :profile_photo, :map, :admin_email, :percent_to_client, :markdown_info, :consignment_period, :return_policy, :return_of_consigned_goods, :appointment_info, :special_offers, :ecommerce_site, :city, :state, :zip, :sunday_opening, :sunday_closing, :monday_opening, :monday_closing, :tuesday_opening, :tuesday_closing, :wednesday_opening, :wednesday_closing, :thursday_opening, :thursday_closing, :friday_opening, :friday_closing, :saturday_opening, :saturday_closing, :additional_info, :restrictions, :pickup_available, :store_bio, :shop_additional_info, :authenticity, :biztag_ids => [], :biztags_attributes => [:id, :name], :designer_ids => [], :designers_attributes => [:id, :name], :reviews_attributes => [:content, :rating, :user_id], :photos_attributes => [:business_photo_file_name, :business_photo_content_type, :business_photo_file_size, :business_photo_updated_at, :description, :user_id, :business_photo])
    end

    # Individual admin access for businesses
    def is_admin?
      if user_signed_in? 
        ((current_user.email == "consigndotnyc@gmail.com") || (current_user.email == @business.admin_email))
      end
    end

    # CONSIGN.NYC admin
    def is_owner?
      if user_signed_in?
        (current_user.email == "consigndotnyc@gmail.com")
      end
    end

end
