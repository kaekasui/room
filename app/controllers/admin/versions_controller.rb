class Admin::VersionsController < ApplicationController
  before_action :find_versions, only: [:index, :update_all]

  def index
  end

  def update_all
    # 既存バージョン情報の更新
    @versions.each do |version|
      version_param = version_params[version.id.to_s]
      version.update_attributes(version_param.symbolize_keys)
      version.id == current_version_params.to_i ? version.update_attributes(current: true) : version.update_attributes(current: false)
    end

    # 新規バージョン情報の作成
    version_params["new"].each do |param_id, value|
      version = Version.create(name: value)
      if current_version_params.to_i == 0
        current_id = current_version_params.slice(4..-1)
        param_id == current_id ? version.update_attributes(current:true) : version.update_attributes(current: false)
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
  def version_params
    params.require(:version)
  end

  def current_version_params
    params.require(:version).permit(:current)[:current]
  end

  def version_id_param
    params.require(:id)
  end

  def find_versions
    @versions = Version.all
  end
end
