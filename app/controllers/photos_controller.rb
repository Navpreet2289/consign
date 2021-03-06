class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    redirect_to "/photos" unless is_owner?
  end

  # GET /photos/new
  def new
    redirect_to "/photos" unless is_owner?
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    redirect_to "/photos" unless is_owner?
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo.business, notice: 'Photo was successfully uploaded.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { redirect_to @photo.business, notice: 'Please make sure description is less than 20 characters and photo is less than 3 mb.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to @photo.user, notice: 'Your photo has been deleted.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:business_id, :user_id, :business_photo_file_name, :business_photo_content_type, :business_photo_file_size, :business_photo_updated_at, :description, :business_photo)
    end

    # CONSIGN.NYC admin
    def is_owner?
      if user_signed_in?
        (current_user.email == "consigndotnyc@gmail.com")
      end
    end

end
