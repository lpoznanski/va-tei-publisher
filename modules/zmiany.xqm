xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

let $root := "/db/apps/tei-publisher/data/annotate/"

(:for $role in collection($root)//tei:roleName[not(@ana)]:)
(:return $role:)

(:for $role in collection($root)//tei:roleName[not(@ana)]:)
(:return ($role, util:document-name($role)) :)

(:for $role in doc("/db/apps/tei-publisher/data/annotate/Q5.xml")//tei:state:)
(:return $role:)
(:return update replace $role with <roleName xmlns="http://www.tei-c.org/ns/1.0" ana="stopien_swiecen" ref="{$role/@ref}">{$role/text()}</roleName>:)


(:for $item in collection($root)//tei:creation/tei:placeName:)
(:return $item:)
(:return update replace $item with <placeName xmlns="http://www.tei-c.org/ns/1.0" ref="va-Q67">{$item/text()}</placeName>:)


(:for $form1 in collection($root)//tei:catRef[@target="Provenit (versio 2)"]:)
(:return util:document-name($form1):)


(:for $item in collection($root)//tei:app:)
(:return $item/child::node():)
(:return update replace $item with "etc." <placeName xmlns="http://www.tei-c.org/ns/1.0" ref="va-Q67">{$item/text()}</placeName>:)


(:for $item in doc("/db/apps/tei-publisher/data/annotate/Q1.xml")//tei:body/tei:p:)
for $item in collection($root)
where $item//tei:catRef[@target="Provenit (versio 1)"]
return update replace $item//tei:app with <supplied xmlns="http://www.tei-c.org/ns/1.0" source="Q352" resp="edytor" cert="hipotetyczna">Hinc est, quod nos ...., ut confessor tuus, quem duxeris eligendum, omnium peccatorum tuorum .... semel tantum in mortis articulo plenam remissionem tibi .... auctoritate apostolica concedere valeat, devocioni tue tenore presencium indulgemus; sic tamen, quod ....</supplied>
(:return update replace $item//child::text()[contains(., "salutem etc. Provenit etc.")] with ", salutem etc. Provenit etc. ":)
(:return ($item//child::text()[contains(., "Provenit")], util:document-name($item)):)
(:return update replace $item//child::text() wit "salutem etc. Provenit etc.":)
(:return update replace $role with <roleName xmlns="http://www.tei-c.org/ns/1.0" ana="stopien_swiecen" ref="{$role/@ref}">{$role/text()}</roleName>:)
