module ApplicationHelper

  # 改行を改行タグへ変換する
  def to_skip(text)
    text.gsub(/\r\n|\r|\n/, "<br />")
  end
end
