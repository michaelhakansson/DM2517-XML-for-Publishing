<?php header("Content-type: text/xml; charset=utf-8"); ?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://purl.org/rss/1.0/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:syn="http://purl.org/rss/1.0/modules/syndication/">
<channel rdf:about="http://www.nada.kth.se/media/Theses/">
    <title>Examensarbeten medieteknik</title>
    <link>http://www.nada.kth.se/media/Theses/</link>
    <description>Examensarbeten inom medieteknik.</description>
    <dc:language>sv</dc:language>
    <dc:rights>Copyright KTH/Nada/Media</dc:rights>
    <dc:date><?php
    date_default_timezone_set('Europe/Stockholm'); // Set timezone
    $date = date('c', time()); // layout c = 2006-01-01T00:00+00:00
    print utf8_encode($date);
    ?></dc:date>
    <dc:publisher>KTH/Nada/Media</dc:publisher>
    <dc:creator>bjornh@kth.se</dc:creator>
    <syn:updatePeriod>daily</syn:updatePeriod>
    <syn:updateFrequency>1</syn:updateFrequency>
    <syn:updateBase><?php
    date_default_timezone_set('Europe/Stockholm'); // Set timezone
    $date = date('c', time()); // layout c = 2006-01-01T00:00+00:00
    print utf8_encode($date);
    ?></syn:updateBase>

    <?php
    // Connect using host, username, password and databasename
    $link = mysqli_connect('localhost', 'rsslab', 'rsslab', 'rsslab');

    // Check connection
    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    }

    // Items
    $queryitems = "SELECT link FROM exjobbsfeed";
    if (($resultitems = mysqli_query($link, $queryitems)) === false) {
        printf("Query failed: %s<br />\n%s", $queryitems, mysqli_error($link));
        exit();
    }
    $returnitems = "<items><rdf:Seq>";
    while($line = $resultitems->fetch_object()) {
        $thelink = $line->link;
        $link_fixed = str_replace(' ', '%20', $thelink);
        $returnitems .= "<rdf:li rdf:resource='$link_fixed'/>";
    }
    $returnitems .= "</rdf:Seq></items><image rdf:resource='http://www.nada.kth.se/media/images/kth.png'/></channel>";

    // Item
    // The SQL query
    $query = "SELECT title, link, description, creator, feeddate FROM exjobbsfeed ORDER BY feeddate ASC";

    // Execute the query
    if (($result = mysqli_query($link, $query)) === false) {
        printf("Query failed: %s<br />\n%s", $query, mysqli_error($link));
        exit();
    }

    $returnstring = '';
    // Loop over the resulting lines
    while ($line = $result->fetch_object()) {
            // Store results from each row in variables
            $thelink = $line->link;
            $title = $line->title;
            $description = $line->description;
            $creator = $line->creator;
            $feeddate = $line->feeddate;

            // Fix for special characters
            $link_fixed = str_replace(' ', '%20', $thelink);
            $desc_fixed = str_replace('&', '&amp;', $description);

            // Convert string to time
            $date = strtotime($feeddate);
            $feeddate_fixed = utf8_encode(date('c', $date));

            // Store the result we want by appending strings to the variable $returnstring
            $returnstring .= "<item rdf:about='$link_fixed'>";
            $returnstring .= "<title>$title</title>";
            $returnstring .= "<link>$link_fixed</link>";
            $returnstring .= "<description>$desc_fixed</description>";
            $returnstring .= "<dc:creator>$creator</dc:creator>";
            $returnstring .= "<dc:date>$feeddate_fixed</dc:date>";
            $returnstring .= "</item>";
        }

        // Free result and just in case encode result to utf8 before returning
        mysqli_free_result($result);
        print utf8_encode($returnitems);
        print utf8_encode($returnstring);
        ?>
</rdf:RDF>
