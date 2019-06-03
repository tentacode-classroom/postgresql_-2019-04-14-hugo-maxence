<?php

$directory = __DIR__;

//exec( "rm -fr imports/" );
//for ($i = 0; $i < 24; $i++) {
//    exec( "wget https://data.gharchive.org/2019-04-14-$i.json.gz -P \"$directory/imports\"" );
//}
//
//exec("gunzip $directory/imports/*.json.gz");

$json = '[';

foreach (scandir("$directory/imports") as $file) {
    if (strpos($file, '.json') !== false) {
        $json .= file_get_contents("$directory/imports/$file");
    }
}

$json .= ']';

var_dump($json);
