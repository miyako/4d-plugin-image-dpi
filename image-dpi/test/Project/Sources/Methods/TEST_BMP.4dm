//%attributes = {}
$file:=File:C1566("/RESOURCES/sample.tiff")

READ PICTURE FILE:C678($file.platformPath;$image)

CONVERT PICTURE:C1002($image;".bmp")

$status:=Set image DPI ($image;150)  //(converted to pixel per metre)

If ($status.success)
	
	$image:=$status.formats.query("type == :1";"@bmp@")[0].image
	
	$path:=System folder:C487(Desktop:K41:16)+Replace string:C233(Timestamp:C1445;":";"-";*)+".bmp"
	
	WRITE PICTURE FILE:C680($path;$image)
	
	OPEN URL:C673($path;"Preview")  //the DPI is generally respected in print, not screen
	
End if 