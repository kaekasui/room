class Admin::VersionsController < ApplicationController
  before_action :find_versions, only: [:index, :update_all]

  def index
  end

  def update_all
    @versions.each do |version|
      version_param = version_params[version.id.to_s]
      version.update_attributes(version_param.symbolize_keys)
      version.id == current_version_params.to_i ? version.update_attributes(current: true) : version.update_attributes(current:false)
    end
    redirect_to admin_versions_path
  end

  private
  def version_params
    params.require(:version)
  end

  def current_version_params
    params.require(:current).permit(:current_version)[:current_version]
  end

  def find_versions
    @versions = Version.all
  end
end
