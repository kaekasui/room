# language: ja

機能: ブログにコメントを投稿する

  ブログに対しコメントを投稿し、
  各ブログのコメント一覧にて投稿したコメントを閲覧できる。
  また、別のブログではコメント数は0件であることを確認する。
  ブログのコメント投稿には、名前と内容が必須とする。
  例) ブログの記事へのコメントが8件登録されていた場合、8件表示される

  シナリオ: ブログにコメントを投稿
    前提 ブログの記事が 1 件登録されている
    かつ ブログの記事の詳細画面が表示されている
    もし コメントフォームのテキストフィールド "タイトル" に値を入力する
    かつ コメントフォームのテキストフィールド "URL" に値を入力する
    かつ コメントフォームのテキストフィールド "Mail" に値を入力する
    かつ コメントフォームのテキストフィールド "名前" に値を入力する
    かつ コメントフォームのテキストエリア "内容" に値を入力する
    かつ コメントフォームのテキストフィールド "パスワード" に値を入力する
    かつ コメントフォームの "登録する" ボタンをクリックする
    ならば コメントが 1 件表示される

  シナリオ: ブログのコメントの名前を空で投稿
    前提 ブログの記事が 1 件登録されている
    かつ ブログの記事の詳細画面が表示されている
    もし コメントフォームのテキストフィールド "タイトル" に値を入力する
    かつ コメントフォームのテキストフィールド "名前" に値を入力しない
    かつ コメントフォームのテキストエリア "内容" に値を入力する
    ならば コメントが登録されず表示されない

  シナリオ: ブログのコメントの内容を空で投稿
    前提 ブログの記事が 1 件登録されている
    かつ ブログの記事の詳細画面が表示されている
    もし コメントフォームのテキストフィールド "タイトル" に値を入力する
    かつ コメントフォームのテキストフィールド "名前" に値を入力する
    かつ コメントフォームのテキストエリア "内容" に値を入力しない
    ならば コメントが登録されず表示されない

