class Admin::VersionsController < Admin::AdminBaseController
  before_action :set_menu
  before_action :find_versions, only: [:index, :update_all]
  before_action :set_version, only: [:new]

  def index
  end

  def new
  end

  def create
    @version = Version.new(version_params)
    respond_to do |format|
      if @version.save
        format.html { redirect_to admin_versions_path, notice: "created version" }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update_all
    # 既存バージョン情報の更新
    @versions.each do |version|
      param = version_param[version.id.to_s]
      version.update_attributes(param.symbolize_keys)
      version.id == current_version_params.to_i ? version.update_attributes(current: true) : version.update_attributes(current: false)
    end

    # 新規バージョン情報の作成
    unless version_param["new"].blank?
      version_param["new"].each do |param_id, value|
        version = Version.create(name: value)
        if !current_version_params.blank? and current_version_params.to_i == 0 
          current_id = current_version_params.slice(4..-1)
          param_id == current_id ? version.update_attributes(current:true) : version.update_attributes(current: false)
        end
      end
    end

    redirect_to admin_versions_path
  end

  def destroy
    record = Version.find(version_id_param)
    record.destroy

    redirect_to admin_versions_path
  end

  private

  def version_param
    params.require(:version)
  end

  def version_params
    params.require(:version).permit(:release_at, :name)
  end

  def current_version_params
    params.require(:version).permit(:current)[:current]
  end

  def set_version
    @version = Version.new
  end

  def version_id_param
    params.require(:id)
  end

  def find_versions
    @versions = Version.all
  end

  def set_menu
    @admin_menu = "setting"
  end
end
