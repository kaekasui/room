class Admin::TrackersController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_tracker, only: [:destroy]
  before_action :set_trackers, only: [:index, :update_all]

  def index
  end

  def update_all
    # 既存情報の更新
    if @trackers
      @trackers.each do |tracker|
        tracker_param = tracker_params[tracker.id.to_s]
        tracker.update_attributes(tracker_param.symbolize_keys)
      end
    end

    # 新規優先度の作成
    if tracker_params["new"]
      tracker_params["new"].each do |param_id, value|
        Tracker.create(name: value["name"])
      end
    end

    redirect_to admin_trackers_path
  end

  def destroy
    @tracker.destroy
    respond_to do |format|
      format.html { redirect_to admin_trackers_path }
      format.json { head :no_content }
    end
  end

  private

  def set_tracker
    @tracker = Tracker.find(params[:id])
  end

  def set_trackers
    @trackers = Tracker.all
  end

  def tracker_params
    params.require(:tracker)
  end

  def set_menu
    @admin_menu = "ticket"
  end
end
