class TicketCategoriesController < ApplicationController
  before_action :set_ticket_category, only: [:show, :edit, :update, :destroy]

  # GET /ticket_categories
  # GET /ticket_categories.json
  def index
    @ticket_categories = TicketCategory.all
  end

  # GET /ticket_categories/1
  # GET /ticket_categories/1.json
  def show
  end

  # GET /ticket_categories/new
  def new
    @ticket_category = TicketCategory.new
  end

  # GET /ticket_categories/1/edit
  def edit
  end

  # POST /ticket_categories
  # POST /ticket_categories.json
  def create
    @ticket_category = TicketCategory.new(ticket_category_params)

    respond_to do |format|
      if @ticket_category.save
        format.html { redirect_to @ticket_category, notice: 'Ticket category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_categories/1
  # PATCH/PUT /ticket_categories/1.json
  def update
    respond_to do |format|
      if @ticket_category.update(ticket_category_params)
        format.html { redirect_to @ticket_category, notice: 'Ticket category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_categories/1
  # DELETE /ticket_categories/1.json
  def destroy
    @ticket_category.destroy
    respond_to do |format|
      format.html { redirect_to ticket_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_category
      @ticket_category = TicketCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_category_params
      params.require(:ticket_category).permit(:name)
    end
end
