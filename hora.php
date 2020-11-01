<?php
setlocale(LC_TIME, "ES_CO");
echo strftime("%X");
setlocale(LC_TIME, "fi_FI");
echo strftime(" en finlandés es %X,");
setlocale(LC_TIME, "fr_FR");
echo strftime(" en francés %X y");
setlocale(LC_TIME, "de_DE");
echo strftime(" en alemán %X.\n");
date_default_timezone_set('America/Bogota');

$script_tz = date_default_timezone_get();

if (strcmp($script_tz, ini_get('date.timezone'))){
    echo 'Script timezone differs from ini-set timezone.';
} else {
    echo 'Script timezone and ini-set timezone match.';
}
echo $script_tz;
?>