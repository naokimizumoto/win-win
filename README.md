# README

win-win
## サイト概要（詳しく）
個別指導学習塾向けのアプリケーション。生徒、講師、保護者がそれぞれタブレットを使って利用することを想定して製作しました。
生徒に関しては、授業中、自学習、宿題で扱う教材を利用できるようにし、また授業日や宿題内容の確認もタブレットで一括管理することを想定しました。
保護者に関しては、塾からの連絡事項と、講師からの日報（授業中の生徒の様子や授業の進捗報告等）を確認できるものにしました。
講師に関しては、担当生徒の管理、生徒が使用する教材の管理、保護者への連絡事項、生徒の授業日の登録等を一括管理できるようにしました。

### サイトテーマ
授業、自習、宿題をタブレット一台で一括管理し、より講師が「教える」ことに集中することができる

### テーマを選んだ理由
現在就業中の学習塾は、通塾している全日制と通信制の生徒が合わせて200人を超える比較的大規模のキャンパスです。
キャンパスにおいて改善したい問題点がいくつかあります。
一つ目は、多くの講師が一日に大量にコピーをするのでコピー用紙が慢性的に足りていないということと、コピーをするのに数分待つことも珍しくないということ。
二つ目は、生徒がよく教材を忘れてしまうということ。教材を忘れる→置き教材をコピー→時間と資源が無駄の悪循環になります。
こういった問題を改善するために、タブレット一括で色々な管理ができるアプリを開発しました。
タブレットを使用することで、教材のコピーを最小限に抑え、毎回の授業で渡すべき授業記録もコピーをする必要がなくなり、生徒本人がタブレットを忘れたとしても教室置きのタブレットで授業を行うことができるため、生徒、講師双方にとって役に立つと考えこのアプリを開発しました。誰かの一助となれば幸いです。



### ターゲットユーザ
学習塾に通っている中学、高校、大学受験を検討している小1~高3までの学生

### 主な利用シーン
授業用教材、宿題用教材、自学習用教材としての利用

## 設計書
<ER図>https://app.diagrams.net/#G1WOSgADXgV2pebiK50EeFWLU1pOehNgKF
＜テーブル定義書＞https://docs.google.com/spreadsheets/d/1VIlTukB1NedpLGBl5wbWzDpE45iywl78YjvpQ7VNqEE/edit#gid=1333200775
＜詳細設計＞https://docs.google.com/spreadsheets/d/1PoxkKQAb6ZvQo9Awy6MBVqmcmIMxv8zf_E2lkpA7ZnQ/edit#gid=0

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1utG8uwvybDeKEnfHjkuoxpTNWt2bddW7zWBkCFbRB4o/edit#gid=566224576

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
