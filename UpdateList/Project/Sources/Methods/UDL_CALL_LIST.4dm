//%attributes = {"shared":true}

// ----------------------------------------------------
// User name (OS): nobu teshima
// Date and time: 22/08/18, 15:00:31
// ----------------------------------------------------
// Method: CALL_LIST
// Description
// $1: text Name of the list to open/modify
// $0: object Selected or not in object.selected and Result value in object.result 
// Parameters
// ----------------------------------------------------

C_TEXT:C284($1; $listname)

$listname:=$1

$winref:=Open form window:C675("UDL_選択リスト"; Sheet form window:K39:12)
C_OBJECT:C1216($object)
$object:=New object:C1471("listdata"; New collection:C1472; "listname"; $listname; "updateList"; False:C215; "selected"; False:C215)
DIALOG:C40("UDL_選択リスト"; $object)

If ($object.updateList)
	CLOSE WINDOW:C154($winref)
	$winref:=Open form window:C675("UDL_更新可能リスト"; Sheet form window:K39:12)
	C_OBJECT:C1216($object)
	$object:=New object:C1471("listdata"; New collection:C1472; "listname"; $listname; "selected"; False:C215)
	DIALOG:C40("UDL_更新可能リスト"; $object)
	
End if 
CLOSE WINDOW:C154($winref)

If ($object.selected)
	If ($object.result#Null:C1517)
		OBJECT SET VALUE:C1742(OBJECT Get name:C1087(Object current:K67:2); $object.result)
	Else 
		OBJECT SET VALUE:C1742(OBJECT Get name:C1087(Object current:K67:2); "")  //ここではテキスト型と決め打ちしている
	End if 
Else 
	
End if 
