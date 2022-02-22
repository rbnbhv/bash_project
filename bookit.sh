#!/bin/bash
echo "Content-type: text/html

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>Reserviere deinen Tennisplatz!</title>
<link href='../styles.css' rel='stylesheet' type='text/css'>
</head>

<body>"

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

echo "$platzEingabe <br> $zeitEingabe <br> $vornameEingabe <br> $nachnameEingabe <br><br>"

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
        platz1="${vornameEingabe}_${nachnameEingabe}"
        tmp3="$zeitraum $platz1 $platz2 $platz3 $platz4"
      fi
    elif [[ $platzEingabe == "2" ]]
    then
      tmp=$platz2
      if [[ $tmp == "frei" ]]
      then
        tmp2="$zeitraum $platz1 $platz2 $platz3 $platz4"
        platz2="${vornameEingabe}_${nachnameEingabe}"
        tmp3="$zeitraum $platz1 $platz2 $platz3 $platz4"
      fi
    elif [[ $platzEingabe == "3" ]]
    then
      tmp=$platz3
      if [[ $tmp == "frei" ]]
      then
        tmp2="$zeitraum $platz1 $platz2 $platz3 $platz4"
        platz3="${vornameEingabe}_${nachnameEingabe}"
        tmp3="$zeitraum $platz1 $platz2 $platz3 $platz4"
      fi
    elif [[ $platzEingabe == "4" ]]
    then
      tmp=$platz4
      if [[ $tmp == "frei" ]]
      then
        tmp2="$zeitraum $platz1 $platz2 $platz3 $platz4"
        platz4="${vornameEingabe}_${nachnameEingabe}"
        tmp3="$zeitraum $platz1 $platz2 $platz3 $platz4"
      fi
    fi
#  echo "TMP2: $tmp2 läuft <br>"
  #sed -i "s/$tmp2/$tmp3/g" 'gebucht.txt'
  #sed -i "s/07:00-08:00 frei frei frei frei/07:00-08:00 Ruben_Allenstein frei frei frei/g" gebucht.txt
 # echo "s/$tmp2/$tmp3/"
  fi
#  sed -i "s/$tmp2/$tmp3/" gebucht.txt
done <<< $(cat gebucht.txt)

  sed -i "s/07:00-08:00 frei frei frei frei/07:00-08:00 Ruben_Allenstein frei frei frei/g" gebucht.txt
  echo "SED: s/$tmp2/$tmp3/ <br>"
#  sed -i "s/${tmp2}/${tmp3}/g" gebucht.txt
echo "<br><br> TMP: $tmp";

if [[ $tmp == "frei" ]]
  then
  echo "<br> <br>Sie haben den Platz erfolgreich gebucht!"
fi

echo "
</body>
</html>
";

