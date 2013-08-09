# language: ja

機能: ブログの一覧を表示する

  訪問ユーザーは、
  ブログの一覧画面にてブログの一覧を閲覧することができる。
  ページング機能を利用しているため、各ページに10件まで表示される。
  例）ブログの記事が12件の場合、2ページ目に2件表示される。

  シナリオアウトライン: ブログの一覧表示
    前提 ブログの記事が <items> 件登録されている
    もし ブログ一覧ページの <page> ページ目が表示されている
    ならば ブログの記事が <display> 件表示される
    例: 
      | items | page | display |
      | 1     | 1    | 1       |
      | 2     | 1    | 2       |
      | 4     | 1    | 4       |
      | 8     | 1    | 8       |
      | 10    | 1    | 10      |
      | 11    | 1    | 10      |
      | 12    | 1    | 10      |
      | 13    | 2    | 3       |
      | 22    | 2    | 10      |
      | 22    | 3    | 2       |