class CustomizedContentsController < ApplicationController
  before_action :set_customized_content, only: [:show, :edit, :update, :destroy, :show_format_content]

  # GET /customized_contents
  # GET /customized_contents.json
  def index
    @customized_contents = CustomizedContent.all
  end

  # GET /customized_contents/1
  # GET /customized_contents/1.json
  def show

  end

  def show_format_content

    if !defined?(@customized_content).nil?
      @images = ContentImage.where(:customized_contents_id => @customized_content.id)
    else
      redirect_to :show_form_for_user
    end

  end

  # GET /customized_contents/new
  def new
    @customized_content = CustomizedContent.new
  end

  # GET /customized_contents/1/edit
  def edit
  end

  # POST /customized_contents
  # POST /customized_contents.json
  def create
    @customized_content = CustomizedContent.new(customized_content_params)

    respond_to do |format|


      if @customized_content.save
        format.html {redirect_to @customized_content, notice: 'Customized content was successfully created.'}
        format.json {render :show, status: :created, location: @customized_content}
      else
        format.html {render :new}
        format.json {render json: @customized_content.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /customized_contents/1
  # PATCH/PUT /customized_contents/1.json
  def update
    respond_to do |format|
      if @customized_content.update(customized_content_params)
        format.html {redirect_to @customized_content, notice: 'Customized content was successfully updated.'}
        format.json {render :show, status: :ok, location: @customized_content}
      else
        format.html {render :edit}
        format.json {render json: @customized_content.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /customized_contents/1
  # DELETE /customized_contents/1.json
  def destroy
    @customized_content.destroy
    respond_to do |format|
      format.html {redirect_to customized_contents_url, notice: 'Customized content was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customized_content
    if !params[:id].nil?
      @customized_content = CustomizedContent.find(params[:id])
    else
      @customized_content = CustomizedContent.first()
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customized_content_params
    params.require(:customized_content).permit(:title, :textContent, :titleMenu)
  end
end
