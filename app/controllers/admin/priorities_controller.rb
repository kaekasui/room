class Admin::PrioritiesController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_priority, only: [:show, :edit, :update, :destroy]
  before_action :set_priorities, only: [:index, :update_all]

  def index
  end

  def update_all
    # 既存情報の更新
    if @priorities
      @priorities.each do |priority|
        priority_param = priority_params[priority.id.to_s]
        priority.update_attributes(priority_param.symbolize_keys)
      end
    end

    # 新規優先度の作成
    if priority_params["new"]
      priority_params["new"].each do |param_id, value|
        Priority.create(name: value["name"])
      end
    end

    redirect_to admin_priorities_path
  end

  def destroy
    @priority.destroy
    respond_to do |format|
      format.html { redirect_to admin_priorities_path }
      format.json { head :no_content }
    end
  end

  private
  def set_priority
    @priority = Priority.find(params[:id])
  end

  def set_priorities
    @priorities = Priority.all
  end

  def priority_params
    params.require(:priority)
  end

  def set_menu
    @admin_menu = "ticket"
  end
end
