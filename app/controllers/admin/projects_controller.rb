class Admin::ProjectsController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to admin_projects_path, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to admin_projects_path, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to admin_projects_path }
      format.json { head :no_content }
    end
  end

  def update_all
   # @projects = Project.all
    Project.where(main: true).each do |project|
      project.main = false
      project.save
    end
    @project = Project.find(project_params["main"])
    @project.main = true
    @project.save
    
    redirect_to admin_projects_path
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:main, :title, :content, :deleted_at)
  end

  def set_menu
    @admin_menu = "ticket"
  end
end
