$object:=New object:C1471("value"; ""; "index"; -1)

Form:C1466.listdata.push($object)
LISTBOX SELECT ROW:C912(*; "List Box"; Form:C1466.listdata.length)
GOTO OBJECT:C206(*; "List Box")

Form:C1466.listedited:=True:C214
