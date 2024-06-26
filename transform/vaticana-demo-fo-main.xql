import module namespace m='http://www.tei-c.org/pm/models/vaticana-demo/fo' at '/db/apps/tei-publisher/transform/vaticana-demo-fo.xql';

declare variable $xml external;

declare variable $parameters external;

let $options := map {
    "styles": ["transform/vaticana-demo.css"],
    "collection": "/db/apps/tei-publisher/transform",
    "parameters": if (exists($parameters)) then $parameters else map {}
}
return m:transform($options, $xml)