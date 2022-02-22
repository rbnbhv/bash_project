#!/bin/bash
mkdir -p /tmp/$$
cd /tmp/$$
cp /var/www/html/writable/gebucht.txt gebucht.txt
echo "Content-type: text/html

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>Reserviere deinen Tennisplatz!</title>
<link href='../styles.css' rel='stylesheet' type='text/css'>
</head>

<body>
  <div id='navigation'>
    <div id='banner'>
      <h1>Platzreservierung</h1>
    </div>
    <p id='menu'>
      <a href='index.sh'>Home</a>
      <a href='booking.sh' id='buchen'>Platz buchen!</a>
      <a href='#' id='123'>Register</a>
    </p>
  </div>
  <div id='inhalt'>
    <div class='inhalt'>
      <h2> Ihre Buchung: </h2><br><br><br><br>
"

saveIFS=$IFS
IFS='&'

parm1=($QUERY_STRING)
IFS=$saveIFS

tmp_platz=${parm1[0]}
tmp_zeit=${parm1[1]}
tmp_vorname=${parm1[2]}
tmp_nachname=${parm1[3]}

zeit=${parm1[1]#*=}


# die 4 Parametereingaben
zeitEingabe=${zeit//%3A/:}
vornameEingabe=${parm1[2]#*=}
nachnameEingabe=${parm1[3]#*=}
platzEingabe=${parm1[0]#*=}

# echo "$platzEingabe <br> $zeitEingabe <br> $vornameEingabe <br> $nachnameEingabe <br><br>"

while read zeitraum platz1 platz2 platz3 platz4
do
  if [[ $zeitraum == $zeitEingabe ]]
  then
    if [[ "$platzEingabe" == "1" ]]
    then
      tmp=$platz1
      if [[ $tmp == "frei" ]]
      then
        tmp2="$zeitraum $platz1 $platz2 $platz3 $platz4"
        platz1_neu="${vornameEingabe}_${nachnameEingabe}"
        tmp3="$zeitraum $platz1_neu $platz2 $platz3 $platz4"
        echo "<p> Sie haben Platz $platzEingabe von $zeitEingabe Uhr erfolgreich gebucht!"
      else
       echo "Der Platz ist leider bereits von $platz1 gebucht"
      fi
    elif [[ $platzEingabe == "2" ]]
    then
      tmp=$platz2
      if [[ $tmp == "frei" ]]
      then
        tmp2="$zeitraum $platz1 $platz2 $platz3 $platz4"
        platz2_neu="${vornameEingabe}_${nachnameEingabe}"
        tmp3="$zeitraum $platz1 $platz2_neu $platz3 $platz4"
        echo "<p> Sie haben Platz $platzEingabe von $zeitEingabe Uhr erfolgreich gebucht!"
      else
       echo "Der Platz ist leider bereits von $platz2 gebucht"
      fi
    elif [[ $platzEingabe == "3" ]]
    then
      tmp=$platz3
      if [[ $tmp == "frei" ]]
      then
        tmp2="$zeitraum $platz1 $platz2 $platz3 $platz4"
        platz3_neu="${vornameEingabe}_${nachnameEingabe}"
        tmp3="$zeitraum $platz1 $platz2 $platz3_neu $platz4"
        echo "<p> Sie haben Platz $platzEingabe von $zeitEingabe Uhr erfolgreich gebucht!"
      else
       echo "Der Platz ist leider bereits von $platz3 gebucht"
      fi
    elif [[ $platzEingabe == "4" ]]
    then
      tmp=$platz4
      if [[ $tmp == "frei" ]]
      then
        tmp2="$zeitraum $platz1 $platz2 $platz3 $platz4"
        platz4_neu="${vornameEingabe}_${nachnameEingabe}"
        tmp3="$zeitraum $platz1 $platz2 $platz3 $platz4_neu"
        echo "<p> Sie haben Platz $platzEingabe von $zeitEingabe Uhr erfolgreich gebucht!"
      else
       echo "Der Platz ist leider bereits von $platz4 gebucht"
      fi
    fi
  #echo "TMP2: $tmp2 läuft <br>"
  fi
done < gebucht.txt

  #echo "SED: s/$tmp2/$tmp3/ <br>"
  sed -i "s/${tmp2}/${tmp3}/g" gebucht.txt
  echo "
      </div>
    </div>
  </body>
</html>
";
cp gebucht.txt /var/www/html/writable/