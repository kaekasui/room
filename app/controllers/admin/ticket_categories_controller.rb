class Admin::TicketCategoriesController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_ticket_category, only: [:destroy]
  before_action :set_ticket_categories, only: [:index, :update_all]

  def index
  end

  def new
    @ticket_category = TicketCategory.new
  end

  def create
    @ticket_category = TicketCategory.new(ticket_category_param)
    respond_to do |format|
      if @ticket_category.save
        format.html { redirect_to admin_ticket_categories_path, notice: 'Ticket category was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update_all
    # 既存情報の更新
    if @ticket_categories
      @ticket_categories.each do |category|
        category_param = ticket_category_params[category.id.to_s]
        category.update_attributes(category_param.symbolize_keys)
      end
    end

    # 新規カテゴリの作成
    if ticket_category_params["new"]
      ticket_category_params["new"].each do |param_id, value|
        TicketCategory.create(name: value["name"])
      end
    end

    redirect_to admin_ticket_categories_path
  end

  def destroy
    @ticket_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_ticket_categories_path }
      format.json { head :no_content }
    end
  end

  private

  def set_ticket_category
    @ticket_category = TicketCategory.find(params[:id])
  end

  def set_ticket_categories
    @ticket_categories = TicketCategory.all
  end

  def ticket_category_param
    params.require(:ticket_category).permit(:name, :project_id)
  end

  def ticket_category_params
    params.require(:ticket_category)
  end

  def set_menu
    @admin_menu = "ticket"
  end
end
