//result.selected:=True
//result.result:=Form.curItem.value
Form:C1466.selected:=True:C214

If (Form:C1466.curItem#Null:C1517)
	Form:C1466.result:=Form:C1466.curItem.value
Else 
	Form:C1466.result:=Null:C1517
End if 

If (Form:C1466.listedited)
	//リスト修正する
	//copy listで指定されたリストを複製し、コレクションの中身を複製されたリストにぶち込んでいき、最後にSAVE LISTで元のリスト名を指定して保存する
	$listRef:=New list:C375
	For each ($itemObject; Form:C1466.listdata)
		APPEND TO LIST:C376($listRef; $itemObject.value; $itemObject.index)
	End for each 
	//ARRAY TEXT($array; 0)
	//ARRAY LONGINT($arraylong; 0)
	//LIST TO ARRAY($listRef; $array; $arraylong)
	SAVE LIST:C384($listRef; Form:C1466.listname)
	CLEAR LIST:C377($listRef)
Else 
	
End if 

ACCEPT:C269
