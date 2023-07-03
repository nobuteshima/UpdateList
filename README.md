# User updating list
リストは「ユーザー更新可」プロパティを選択することで、ユーザーが直接リストを変更・編集可能でしたが、プロジェクトモードではそれはサポートされていません。
この例題では、簡易的なダイアログと階層リストコマンドを使用することでその機能を擬似的に再現しています。

## 概要
リストとは、ストラクチャーファイルに記録された値の集合です。データベースに入力する値などがあらかじめ決まっていて限定的な場合には、フィールドにリストを関連づけることで、
そのフィールドにフォーカスが入った時にリストが自動的に表示され、ユーザーが値の入力がしやすい、というメリットがあります。
そして、ツールボックスのリストエディターで「ユーザー更新可」チェックをつけたリストは、ダイアログが表示された時に更新ボタンをクリックすることでユーザー自らがリストを編集することができます。

これが可能だったのはバイナリーモードでのデータベースのみでした。
プロジェクトモードのアプリケーションでは、「ユーザー更新可」チェックボックスはサポートされなくなりました。
これは、プロジェクトモードのコンポーネントは実質的にはzipファイルであり、中身を書き換えることができないため、ユーザーが更新できなくなったという背景があります。

では、インタープリターモードであればどうでしょうか？
プロジェクトモードは全てがテキストファイルで表現されるため、標準コマンドを使用してそれらを書き換えることはもちろん可能です。
この例題にはユーザー更新可のリストを編集する際のダイアログを再現したダイアログを使用し、そこに表示される「ソート」/「挿入」/「追加」/「削除」ボタンの機能を標準コマンドで再現することで擬似的に「ユーザー更新可」機能を再現しています。

注意すべきことは2つあります。

1. このコンポーネントとして取り込むことはできません。
1. 表示されるダイアログはmac版でのダイアログを模しています。

この例題をコンポーネントとしてデータベースに取り込むことはできません。メソッドをホストに公開することは可能ですが、リストを呼び出そうとした場合、呼び出されるリストはコンポーネント側のリストであり、ホスト側のものではないので本来の機能を発揮することができません。
あくまで例題として、これを参考にしてデータベースに取り込んでみて下さい。

また、表示されるダイアログはmac版のダイアログを模しています。機能としてはそのままWindowsで使用しても問題はないと思いますが、mac版ほどの「完コピ」にはなっていないという点に注意して下さい。

## 例題
このサンプルを開き、「フォーム1」を実行してみて下さい。
フォームが開いたら上から3つ目の入力にフォーカスを入れると、リストが表示されます。「更新」ボタンをクリックするとその表示されているリストの編集画面へと移行します。

使用しているメソッドは`UDL_CALL_LIST`で、フォームオブジェクトの`On Getting Focus`イベントで使用されることを想定しています。
以下の様に指定します。

```4d
$event:=FORM Event

Case of 
	: ($event.code=On Getting Focus)
		UDL_CALL_LIST("送付先住所") //文字列でリスト名を指定
End case 
```
