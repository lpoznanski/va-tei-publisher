import module namespace m='http://www.tei-c.org/pm/models/Vaticana/epub' at '/db/apps/tei-publisher/transform/Vaticana-epub.xql';

declare variable $xml external;

declare variable $parameters external;

let $options := map {
    "styles": ["transform/Vaticana.css"],
    "collection": "/db/apps/tei-publisher/transform",
    "parameters": if (exists($parameters)) then $parameters else map {}
}
return m:transform($options, $xml)