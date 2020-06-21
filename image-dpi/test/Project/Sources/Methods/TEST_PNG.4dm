//%attributes = {}
$file:=File:C1566("/RESOURCES/sample.tiff")

READ PICTURE FILE:C678($file.platformPath;$image)

CONVERT PICTURE:C1002($image;".png")

$status:=Set image DPI ($image;1200)

If ($status.success)
	
	$image:=$status.formats.query("type == :1";"@png@")[0].image
	
	$path:=System folder:C487(Desktop:K41:16)+Replace string:C233(Timestamp:C1445;":";"-";*)+".png"
	
	WRITE PICTURE FILE:C680($path;$image)
	
	OPEN URL:C673($path;"Preview")  //the DPI is generally respected in print, not screen
	
End if 