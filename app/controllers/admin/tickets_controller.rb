class Admin::TicketsController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    @statuses = Status.all
    @priorities = Priority.all
    @trackers = Tracker.all
    @tickets = Ticket.all.page(params[:page]).per(100)
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.created_by = current_user.id
    @ticket.updated_by = current_user.id
    Categorization.transaction do
      category_ids = ticket_category_params.nil? ? [] : ticket_category_params
      category_ids.each do |category_id|
        @ticket.categorizations << Categorization.create(category_id: category_id)
      end

      respond_to do |format|
        if @ticket.save
          format.html { redirect_to ['admin', @ticket], notice: 'Ticket was successfully created.' }
          format.json { render action: 'show', status: :created, location: @ticket }
        else
          format.html { render action: 'new' }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    Categorization.transaction do
      category_ids = ticket_category_params.nil? ? [] : ticket_category_params
      current_category_ids = @ticket.categorizations.map { |v| v.category_id.to_s }

      adding_categories = category_ids - current_category_ids
      deleting_categories = current_category_ids - category_ids
      adding_categories.each do |category_id|
        @ticket.categorizations << Categorization.create(category_id: category_id)
      end
      deleting_categories.each do |category_id|
        @ticket.categorizations.delete(category_id)
      end

      respond_to do |format|
        if @ticket.update(ticket_params)
          @ticket.updated_by = current_user.id
	  if @ticket.save
            format.html { redirect_to ['admin', @ticket], notice: 'Ticket was successfully updated.' }
            format.json { head :no_content }
	  end
        else
          format.html { render action: 'edit' }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to admin_tickets_path }
      format.json { head :no_content }
    end
  end

  def set_tickets
    conditions = params
    conditions.delete("controller")
    conditions.delete("action")
    conditions.delete("page")
    @tickets = conditions.count == 0 ? Ticket.all.page(params[:page]).per(100) : Ticket.where(conditions).page(params[:page]).per(100)
    respond_to do |format|
      format.js
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:id, :project_id, :title, :content, :progress, :status_id, :priority_id, :version_id, :user_id, :tracker_id, :created_by, :deleted_at)
    end

    def ticket_category_params
      params.require(:categories) unless params[:categories].nil?
    end

  def set_menu
    @admin_menu = "ticket"
  end
end
