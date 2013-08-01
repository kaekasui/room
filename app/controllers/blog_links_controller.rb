class BlogLinksController < ApplicationController
  before_action :set_blog_link, only: [:show, :edit, :update, :destroy]

  # GET /blog_links
  # GET /blog_links.json
  def index
    @blog_links = BlogLink.all
  end

  # GET /blog_links/1
  # GET /blog_links/1.json
  def show
  end

  # GET /blog_links/new
  def new
    @blog_link = BlogLink.new
  end

  # GET /blog_links/1/edit
  def edit
  end

  # POST /blog_links
  # POST /blog_links.json
  def create
    @blog_link = BlogLink.new(blog_link_params)

    respond_to do |format|
      if @blog_link.save
        format.html { redirect_to @blog_link, notice: 'Blog link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @blog_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_links/1
  # PATCH/PUT /blog_links/1.json
  def update
    respond_to do |format|
      if @blog_link.update(blog_link_params)
        format.html { redirect_to @blog_link, notice: 'Blog link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_links/1
  # DELETE /blog_links/1.json
  def destroy
    @blog_link.destroy
    respond_to do |format|
      format.html { redirect_to blog_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_link
      @blog_link = BlogLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_link_params
      params.require(:blog_link).permit(:title, :author, :introduction, :url, :position, :draft, :deleted_at)
    end
end
