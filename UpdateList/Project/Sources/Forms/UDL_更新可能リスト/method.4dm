$event:=FORM Event:C1606


Case of 
	: ($event.code=On Load:K2:1)
		$listname:=Form:C1466.listname
		ARRAY TEXT:C222($listarray; 0)
		LIST TO ARRAY:C288($listname; $listarray)
		For ($i; 1; Size of array:C274($listarray))
			$object:=New object:C1471("value"; $listarray{$i}; "index"; $i)
			Form:C1466.listdata.push($object)
		End for 
End case 