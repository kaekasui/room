class Admin::PrioritiesController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_priority, only: [:show, :edit, :update, :destroy]

  # GET /priorities
  # GET /priorities.json
  def index
    @priorities = Priority.all
  end

  # GET /priorities/1
  # GET /priorities/1.json
  def show
  end

  # GET /priorities/new
  def new
    @priority = Priority.new
  end

  # GET /priorities/1/edit
  def edit
  end

  # POST /priorities
  # POST /priorities.json
  def create
    @priority = Priority.new(priority_params)

    respond_to do |format|
      if @priority.save
        format.html { redirect_to ['admin', @priority], notice: 'Priority was successfully created.' }
        format.json { render action: 'show', status: :created, location: @priority }
      else
        format.html { render action: 'new' }
        format.json { render json: @priority.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_all
    # 既存情報の更新
    if @priorities
      @priorities.each do |priority|
        priority_param = priority_params[priority.id.to_s]
        priority.update_attributes(priority_param.symbolize_keys)
      end
    end

p priority_params["new"]
    # 新規優先度の作成
    if priority_params["new"]
      priority_params["new"].each do |param_id, value|
        Priority.create(name: value["name"])
      end
    end

    redirect_to admin_priorities_path
  end

  # DELETE /priorities/1
  # DELETE /priorities/1.json
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

  def priority_params
    params.require(:priority)
  end

  def set_menu
    @admin_menu = "ticket"
  end
end
