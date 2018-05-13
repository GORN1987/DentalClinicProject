class ContentImagesController < ApplicationController
  before_action :set_content_image, only: [:show, :edit, :update, :destroy, :download_image]

  # GET /content_images
  # GET /content_images.json
  def index
    @content_images = ContentImage.all
  end

  # GET /content_images/1
  # GET /content_images/1.json
  def show
  end

  # GET /content_images/new
  def new
    @content_image = ContentImage.new
  end

  # GET /content_images/1/edit
  def edit
  end

  def upload_image


  end

  # POST /content_images
  # POST /content_images.json
  def create
    @content_image = ContentImage.new(content_image_params)

    if !params["content_image"]["file_upload"].nil?
      upload_file = params["content_image"]["file_upload"]
      file_name_conc = File.join("public/uploads/", upload_file.original_filename)
      File.open(file_name_conc, "wb") {|t| t.write(upload_file.read)}
      @content_image.file_name = file_name_conc
    end

    respond_to do |format|

      if @content_image.save
        format.html {redirect_to @content_image, notice: 'Content image was successfully created.'}
        format.json {render :show, status: :created, location: @content_image}
      else
        format.html {render :new}
        format.json {render json: @content_image.errors, status: :unprocessable_entity}
      end
    end
  end


  def download_image
    send_file @content_image.file_name, type: 'image/jpg', disposition: 'inline'
  end

  # PATCH/PUT /content_images/1
  # PATCH/PUT /content_images/1.json
  def update
    if !params["content_image"]["file_upload"].nil?
      upload_file = params["content_image"]["file_upload"]
      file_name_conc = File.join("public/uploads/", upload_file.original_filename)
      File.open(file_name_conc, "wb") {|t| t.write(upload_file.read)}
      @content_image.file_name = file_name_conc
    end


    respond_to do |format|
      if @content_image.update(content_image_params)
        format.html {redirect_to @content_image, notice: 'Content image was successfully updated.'}
        format.json {render :show, status: :ok, location: @content_image}
      else
        format.html {render :edit}
        format.json {render json: @content_image.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /content_images/1
  # DELETE /content_images/1.json
  def destroy
    @content_image.destroy
    respond_to do |format|
      format.html {redirect_to content_images_url, notice: 'Content image was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_content_image
    @content_image = ContentImage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def content_image_params
    params.require(:content_image).permit(:file_name, :image_text, :alternative_text, :optional_caption, :customized_contents_id)
  end
end
