$object:=New object:C1471("value"; ""; "index"; -1)

If (Form:C1466.curItem#Null:C1517)
	Form:C1466.listdata.insert(Form:C1466.curPos-1; $object)
	LISTBOX SELECT ROW:C912(*; "List Box"; Form:C1466.curPos)
	GOTO OBJECT:C206(*; "List Box")
Else 
	Form:C1466.listdata.push($object)
	LISTBOX SELECT ROW:C912(*; "List Box"; Form:C1466.listdata.length)
	GOTO OBJECT:C206(*; "List Box")
End if 

Form:C1466.listedited:=True:C214
