module ApplicationHelper

  # 改行を改行タグへ変換する
  def to_skip(text)
    text.gsub(/\r\n|\r|\n/, "<br />")
  end

  def icon
    "icon_images/clover.gif"
  end

  # 入力必須の項目であった場合に「*」を表示する
  def asterisk(object, attribute)
    mark = raw "<span class='asterisk'>*</span>"
    mark if object.class.validators_on(attribute).map(&:class).include? ActiveRecord::Validations::PresenceValidator
  end

  def admin_menu_list(menu)
    case menu
      when "blog" then
        [
          I18n.t("admin_menu.blogs"),
          I18n.t("admin_menu.blog_comments"),
          I18n.t("admin_menu.blog_links"),
          I18n.t("admin_menu.mail_forms")
        ]
      when "setting" then
        [
          I18n.t("admin_menu.versions"),
          I18n.t("admin_menu.users")
        ]
    end
  end
end
