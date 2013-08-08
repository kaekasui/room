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
end
