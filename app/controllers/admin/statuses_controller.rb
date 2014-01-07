class Admin::StatusesController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_status, only: [:show, :destroy]
  before_action :set_statuses, only: [:index, :update_all]

  def index
  end

  def update_all
    # 既存情報の更新
    if @statuses
      @statuses.each do |status|
        status_param = status_params[status.id.to_s]
        status.update_attributes(status_param.symbolize_keys)
      end
    end

    # 新規ステータスの作成
    if status_params["new"]
      status_params["new"].each do |param_id, value|
        Status.create(name: value["name"], finished: value["finished"])
      end
    end

    redirect_to admin_statuses_path
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to admin_statuses_path }
      format.json { head :no_content }
    end
  end

  private

  def set_status
    @status = Status.find(params[:id])
  end

  def set_statuses
    @statuses = Status.all
  end

  def status_params
    params.require(:status)
  end

  def set_menu
    @admin_menu = "ticket"
  end
end
