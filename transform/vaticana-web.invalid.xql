(:~

    Transformation module generated from TEI ODD extensions for processing models.
    ODD: /db/apps/tei-publisher/odd/vaticana.odd
 :)
xquery version "3.1";

module namespace model="http://www.tei-c.org/pm/models/vaticana/web";

declare default element namespace "http://www.tei-c.org/ns/1.0";

declare namespace xhtml='http://www.w3.org/1999/xhtml';

declare namespace pb='http://teipublisher.com/1.0';

import module namespace css="http://www.tei-c.org/tei-simple/xquery/css";

import module namespace html="http://www.tei-c.org/tei-simple/xquery/functions";

(:~

    Main entry point for the transformation.
    
 :)
declare function model:transform($options as map(*), $input as node()*) {
        
    let $config :=
        map:merge(($options,
            map {
                "output": ["web"],
                "odd": "/db/apps/tei-publisher/odd/vaticana.odd",
                "apply": model:apply#2,
                "apply-children": model:apply-children#3
            }
        ))
    
    return (
        html:prepare($config, $input),
    
        let $output := model:apply($config, $input)
        return
            html:finish($config, $output)
    )
};

declare function model:apply($config as map(*), $input as node()*) {
        let $parameters := 
        if (exists($config?parameters)) then $config?parameters else map {}
        let $mode := 
        if (exists($config?mode)) then $config?mode else ()
        let $trackIds := 
        $parameters?track-ids
        let $get := 
        model:source($parameters, ?)
    return
    $input !         (
            let $node := 
                .
            return
                            typeswitch(.)
                    case element(affiliation) return
                        html:alternate($config, ., ("tei-affiliation", css:map-rend-to-class(.)), ., ., concat('https://va.wiki.kul.pl/wiki/Item:', @ref), map {})                        => model:map($node, $trackIds)
                    case element(date) return
                        if (@when) then
                            html:alternate($config, ., ("tei-date", css:map-rend-to-class(.)), ., ., @when, map {})                            => model:map($node, $trackIds)
                        else
                            $config?apply($config, ./node())
                    case element(measure) return
                        html:alternate($config, ., ("tei-measure", css:map-rend-to-class(.)), ., ., @unit, @quantity, @commodity, map {})                        => model:map($node, $trackIds)
                    case element(abstract) return
                        html:section($config, ., ("tei-abstract", css:map-rend-to-class(.)), .)                        => model:map($node, $trackIds)
                    case element(teiHeader) return
                        (
                            html:block($config, ., ("tei-teiHeader1", css:map-rend-to-class(.)), //titleStmt/title)                            => model:map($node, $trackIds),
                            html:block($config, ., ("tei-teiHeader2", css:map-rend-to-class(.)), //msName)                            => model:map($node, $trackIds)
                        )

                    case element(div) return
                        (
                            html:block($config, ., ("tei-div1", css:map-rend-to-class(.)), root(.)//profileDesc/abstract)                            => model:map($node, $trackIds),
                            html:section($config, ., ("tei-div2", css:map-rend-to-class(.)), .)                            => model:map($node, $trackIds)
                        )

                    case element(exist:match) return
                        html:match($config, ., .)
                    case element() return
                        if (namespace-uri(.) = 'http://www.tei-c.org/ns/1.0') then
                            $config?apply($config, ./node())
                        else
                            .
                    case text() | xs:anyAtomicType return
                        html:escapeChars(.)
                    default return 
                        $config?apply($config, ./node())

        )

};

declare function model:apply-children($config as map(*), $node as element(), $content as item()*) {
        
    if ($config?template) then
        $content
    else
        $content ! (
            typeswitch(.)
                case element() return
                    if (. is $node) then
                        $config?apply($config, ./node())
                    else
                        $config?apply($config, .)
                default return
                    html:escapeChars(.)
        )
};

declare function model:source($parameters as map(*), $elem as element()) {
        
    let $id := $elem/@exist:id
    return
        if ($id and $parameters?root) then
            util:node-by-id($parameters?root, $id)
        else
            $elem
};

declare function model:process-annotation($html, $context as node()) {
        
    let $classRegex := analyze-string($html/@class, '\s?annotation-([^\s]+)\s?')
    return
        if ($classRegex//fn:match) then (
            if ($html/@data-type) then
                ()
            else
                attribute data-type { ($classRegex//fn:group)[1]/string() },
            if ($html/@data-annotation) then
                ()
            else
                attribute data-annotation {
                    map:merge($context/@* ! map:entry(node-name(.), ./string()))
                    => serialize(map { "method": "json" })
                }
        ) else
            ()
                    
};

declare function model:map($html, $context as node(), $trackIds as item()?) {
        
    if ($trackIds) then
        for $node in $html
        return
            typeswitch ($node)
                case document-node() | comment() | processing-instruction() return 
                    $node
                case element() return
                    if ($node/@class = ("footnote")) then
                        if (local-name($node) = 'pb-popover') then
                            ()
                        else
                            element { node-name($node) }{
                                $node/@*,
                                $node/*[@class="fn-number"],
                                model:map($node/*[@class="fn-content"], $context, $trackIds)
                            }
                    else
                        element { node-name($node) }{
                            attribute data-tei { util:node-id($context) },
                            $node/@*,
                            model:process-annotation($node, $context),
                            $node/node()
                        }
                default return
                    <pb-anchor data-tei="{ util:node-id($context) }">{$node}</pb-anchor>
    else
        $html
                    
};

