#!/bin/bash
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
            <a href='#' id='booking.sh'>Platz buchen!</a>
            <a href='#' id='123'>Register</a>
            </p>
          </div>
          <div id='book'>
            <p id='infoText'><p>
          </div>
          <div id='inhalt'>
            <div class='inhalt'>
                <h2> Bitte geben Sie nun Ihre Daten und den Termin, wann Sie buchen möchten, ein:</h2></br></br></br>

                <form action='bookit.sh' method='get'>
                    <select name='chooseCourt'>
                          <option value='1'>Platz 1</option>
                          <option value='2'>Platz 2</option>
                          <option value='3'>Platz 3</option>
                          <option value='4'>Platz 4</option>
                    </select>

                    <select name='chooseTime'>
                        <option value='07:00-08:00'>07-08 Uhr</option>
                        <option value='08:00-09:00'>08-09 Uhr</option>
                        <option value='09:00-10:00'>09-10 Uhr</option>
                        <option value='10:00-11:00'>10-11 Uhr</option>
                        <option value='11:00-12:00'>11-12 Uhr</option>
                        <option value='12:00-13:00'>12-13 Uhr</option>
                        <option value='13:00-14:00'>13-14 Uhr</option>
                        <option value='14:00-15:00'>14-15 Uhr</option>
                        <option value='15:00-16:00'>15-16 Uhr</option>
                        <option value='16:00-17:00'>16-17 Uhr</option>
                        <option value='17:00-18:00'>17-18 Uhr</option>
                    </select>

                    </br></br>
                    <p>Vorname:<input type='text' name='vorname' value='' maxlength='50'></p></br>
                    <p>Nachname:<input type='text' name='nachname' value='' maxlength='50'></p></br>
                    <input type='submit' id='button1'>
                </form>
            </div>
        </div>

      </div>
    </body>
</html>"