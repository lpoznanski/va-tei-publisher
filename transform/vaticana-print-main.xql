import module namespace m='http://www.tei-c.org/pm/models/vaticana/print' at '/db/apps/tei-publisher/transform/vaticana-print.xql';

declare variable $xml external;

declare variable $parameters external;

let $options := map {
    "styles": ["transform/vaticana.css"],
    "collection": "/db/apps/tei-publisher/transform",
    "parameters": if (exists($parameters)) then $parameters else map {}
}
return m:transform($options, $xml)