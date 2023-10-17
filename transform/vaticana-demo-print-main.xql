import module namespace m='http://www.tei-c.org/pm/models/vaticana-demo/print' at '/db/apps/tei-publisher/transform/vaticana-demo-print.xql';

declare variable $xml external;

declare variable $parameters external;

let $options := map {
    "styles": ["transform/vaticana-demo.css"],
    "collection": "/db/apps/tei-publisher/transform",
    "parameters": if (exists($parameters)) then $parameters else map {}
}
return m:transform($options, $xml)