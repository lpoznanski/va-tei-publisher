xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

let $root := "/db/apps/tei-publisher/data/playground/annotate/"

(:for $doc in collection($root):)
(:return util:document-name($doc):)
(:return file:move("/db/apps/tei-publisher/data/playground/annotate/Q47.xml", "/db/apps/tei-publisher/data/playground/annotate/xxx.xml"):)
return file:exists("/db/apps/tei-publisher/data/playground/annotate/Q14.xml")
