xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";

declare option output:method "html5";
declare option output:media-type "text/html";

<html>
    <body>
        <ul>
        {
            for $doc in collection("/db/apps/tei-publisher/data/annotate")
            return 
                <li>
                    <p>{$doc//tei:titleStmt/tei:title[@type="label"]/text()}</p>
                    <p>{$doc//tei:titleStmt/tei:title[@type="description"]/text()}</p>
                    <p>{$doc//tei:idno/text()}</p>
                </li>
        }
        </ul>
    </body>
</html>