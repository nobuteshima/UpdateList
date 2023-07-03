$event:=FORM Event:C1606

Case of 
	: ($event.code=On Double Clicked:K2:5)
		
		If (Form:C1466.curItem#Null:C1517)
			
			Form:C1466.selected:=True:C214
			Form:C1466.result:=Form:C1466.curItem.value
			
			ACCEPT:C269
		End if 
		
End case 