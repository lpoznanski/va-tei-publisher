xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

let $root := "/db/apps/tei-publisher/data/annotate/"

for $doc in collection($root)
(:return document-uri($doc):)
(:return util:document-name($doc):)
return xmldb:rename($root, util:document-name($doc), concat($doc/tei:TEI/@xml:id, ".xml"))
