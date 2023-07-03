$event:=FORM Event:C1606

Case of 
	: ($event.code=On Double Clicked:K2:5)
		
		Form:C1466.selected:=True:C214
		
		If (Form:C1466.curItem#Null:C1517)
			Form:C1466.result:=Form:C1466.curItem.value
		Else 
			Form:C1466.result:=Null:C1517
		End if 
		
		If (Form:C1466.listedited)
			$listRef:=New list:C375
			
			For each ($itemObject; Form:C1466.listdata)
				APPEND TO LIST:C376($listRef; $itemObject.value; $itemObject.index)
			End for each 
			
			SAVE LIST:C384($listRef; Form:C1466.listname)
			CLEAR LIST:C377($listRef)
		Else 
		End if 
		
		ACCEPT:C269
		
End case 