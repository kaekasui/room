module ApplicationHelper

  # 改行を改行タグへ変換する
  def to_skip(text)
    text.gsub(/\r\n|\r|\n/, "<br />")
  end

  def icon
    "icon_images/clover.gif"
  end
end
