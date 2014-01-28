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
        {
          I18n.t('admin_menu.new_blog') => "new_admin_blog_path",
          I18n.t('admin_menu.blogs') => "admin_blogs_path",
          I18n.t('admin_menu.blog_categories') => "admin_blog_categories_path",
          I18n.t('admin_menu.blog_comments') => "admin_blog_comments_path",
          I18n.t('admin_menu.blog_links') => "admin_blog_links_path",
          I18n.t('admin_menu.mail_forms') => "admin_mail_forms_path"
        }
      when "ticket" then
        {
          I18n.t('admin_menu.projects') => "admin_projects_path",
          I18n.t('admin_menu.tickets') => "admin_tickets_path",
          I18n.t('admin_menu.priorities') => "admin_priorities_path",
          I18n.t('admin_menu.statuses') => "admin_statuses_path",
          I18n.t('admin_menu.trackers') => "admin_trackers_path",
          I18n.t('admin_menu.ticket_categories') => "admin_ticket_categories_path",
          I18n.t('admin_menu.ticket_versions') => "admin_ticket_versions_path"
        }
      when "setting" then
        {
          I18n.t('admin_menu.versions') => "admin_versions_path",
          I18n.t('admin_menu.users') => "admin_users_path"
        }
    end
  end

  def current_version
    Version.where(current: true).first
  end

  def markdown(text)
    html = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(hard_wrap: true),
      tables: true,
      autolink: true,
      superscript: true,
      strikethrough: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      space_after_headers: true
    ).render(text)
    syntax_highlighter(html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("pre").each do |pre|
      pre.replace(Pygments.highlight(
        pre.text.rstrip,
        lexer: pre.children.attribute("class").value
      ))
    end
    doc.to_s
  end
end
