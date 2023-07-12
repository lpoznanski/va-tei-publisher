import module namespace m='http://www.tei-c.org/pm/models/dta/fo' at '/db/apps/tei-publisher/transform/dta-fo.xql';

declare variable $xml external;

declare variable $parameters external;

let $options := map {
    "styles": ["transform/dta.css"],
    "collection": "/db/apps/tei-publisher/transform",
    "parameters": if (exists($parameters)) then $parameters else map {}
}
return m:transform($options, $xml)