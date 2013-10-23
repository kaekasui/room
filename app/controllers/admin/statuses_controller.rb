class Admin::StatusesController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to ['admin', @status], notice: 'Status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @status }
      else
        format.html { render action: 'new' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
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
        Status.create(name: value["name"])
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
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status)
    end

  def set_menu
    @admin_menu = "ticket"
  end
end
