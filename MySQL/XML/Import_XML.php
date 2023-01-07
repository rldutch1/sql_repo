<?php
$oDOM = new DOMDocument();
$oDOM->loadXML(file_get_contents('cdocuments1290.xml'));
foreach ($oDOM->getElementsByTagName('conferences') as $Conferences1)
{

$Subject=mysql_real_escape_string($Conferences1->getElementsByTagName('Subject')->item(0)->nodeValue);
$Event=mysql_real_escape_string($Conferences1->getElementsByTagName('Event')->item(0).VALUE);

}

$sql = "insert into `Conferences` (`Event`, `Subject`) values ('$Event', '$Subject')";
$perform_insert = mysql_query($sql) or die("<b>Data could not be entered</b>.\n<br />Query: " . $query . "<br />\nError: (" . mysql_errno() . ") " . mysql_error())  

/*
Hello,

I have been trying to find a way to export data from an xml document and back into mysql. i have wrote the following code:

PHP Code is above:

XML Code:

The above code works perfectly if the xml is set in a different layout to what i want, this is the layout that works:

[XML]
<conferences>
<Subject>134142832</Subject>
<Event>More Time</Event>
</conferences>
[/XML]

the layout i need to use is the following:

[XML]
<conferences>
<Subject value="134142832" />
<Event VALUE="More Time" />
</conferences>
[/XML]


I've been stuck on this for a while now and wonder if anyone could help please?

In the XML document theirs is about 300 separate XML's all looking like the above and all will need to be imported.

Hope this makes sense.

Many Thanks

Suggested action was to look at this solution:
http://www.php.net/manual/en/domelem...tattribute.php

Samples at the bottom.

Response to the suggestion:
Thank you Spufi, i have tried that already and cannot get it to work, any ideas?

Many Thanks

Source: http://www.webdeveloper.com/forum/showthread.php?258036-RESOLVED-XML-to-MySql-Using-PHP

*/



?>