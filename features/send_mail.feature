# language: ja

機能: メールフォームからメールの送信ができる。

  訪問ユーザーは、
  ブログの一覧または詳細画面にて以下の情報を含んだメールを送信することができる。
  ・名前
  ・メールアドレス
  ・内容

  シナリオ:
    もし "ブログ一覧"ページを表示する
    かつ テキストエリア"#mail_form_content"に"mail"を入力する
    かつ ボタン"送信する"をクリックする
    ならば メッセージ"メールが送信されました。"が表示される

  シナリオ:
    もし "ブログ一覧"ページを表示する
    かつ ボタン"送信する"をクリックする
    ならば メッセージ"メールの送信に失敗しました。"が表示される
