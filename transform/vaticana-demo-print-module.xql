module namespace pml='http://www.tei-c.org/pm/models/vaticana-demo/print/module';

import module namespace m='http://www.tei-c.org/pm/models/vaticana-demo/print' at '/db/apps/tei-publisher/transform/vaticana-demo-print.xql';

(: Generated library module to be directly imported into code which
 : needs to transform TEI nodes using the ODD this module is based on.
 :)
declare function pml:transform($xml as node()*, $parameters as map(*)?) {

   let $options := map {
       "styles": ["transform/vaticana-demo.css"],
       "collection": "/db/apps/tei-publisher/transform",
       "parameters": if (exists($parameters)) then $parameters else map {}
   }
   return m:transform($options, $xml)
};