class Admin::BlogCategoriesController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_blog_category, only: [:destroy]
  before_action :set_blog_categories, only: [:index, :update_all]

  def index
  end

  def update_all
    # 既存情報の更新
    if @blog_categories
      @blog_categories.each do |category|
        category_param = blog_category_params[category.id.to_s]
        category.update_attributes(category_param.symbolize_keys)
      end
    end

    # 新規優先度の作成
    if blog_category_params["new"]
      blog_category_params["new"].each do |param_id, value|
        BlogCategory.create(name: value["name"])
      end
    end

    redirect_to admin_blog_categories_path
  end

  def destroy
    @blog_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_blog_categories_path }
      format.json { head :no_content }
    end
  end

  private

  def set_blog_category
    @blog_category = BlogCategory.find(params[:id])
  end

  def set_blog_categories
    @blog_categories = BlogCategory.all
  end

  def blog_category_param
    params.require(:blog_category).permit(:name)
  end

  def blog_category_params
    params.require(:blog_category)
  end

  def set_menu
    @admin_menu = "blog"
  end
end
