# Liederbuch Template

## Einleitung

Dieses Template ist im Rahmen der Jugendarbeit des Arbeitskreises Roverstufe des Diözesanverband Freiburg der Deutschen Pfadfinderschaft Sankt Georg zwischen 2017 und 2018 entstanden.
Viele Stunden sind in das zusammenfrickeln eines ansehbaren LateX-Templates geflossen. Es wäre schade, wenn nicht noch jemand anderes dieses nutzen könnte. Wenn dir auffällt, dass wir etwas hätten besser lösen können, freuen wir uns über deinen Input.

Dies ist eine Modifizierte Version, welche nicht nur das einbinden von
Gitaren-Akkorde sondern ebenso das schreiben von Musiknoten unterstützt.
Ebenso wurde das Format angepasst.

## Features

* **Inhaltsverzeichnis**
* **Kuraten Verzeichnis** - Das Kuratenverzeichnis ist ein zweites Inhaltsverzeichnis am Ende des Liederbuch. Hier können alle geistlichen Lieder aufgelistet werden, damit sie vor einer Morgenrunde/Gottesdienst/Impuls schneller gefunden werden.
* **Verweise** - Lieder können auf ihr vorkommen in anderen Liederbüchern verweisen. So kann auch mit einem gemischten Bestand an Liederbüchern gemütlich gesungen werden.
* **Auf der nächsten Seite geht es weiter Symbol** - Unerfahrenen Sängern kann es passieren, dass Sie nicht merken, das ein Lied eigentlich noch weitergeht. Einfach weil sich ein Zeilenumbruch eingeschlichen hat. EIn kleines Symbol am Ende einer Seite hilft hier weiter.
* **Jederzeit den Titel und Interpreten sehen** - Titel und Interpret findest du auf jeder Seite in der Kopfzeile. So findest du beim Durchblättern noch schneller das richtige Lied.
* **Musik Noten** - Die modifizierte version unterstützt nun auch das schreiben vom Musiknoten.
* **Infoboxen** - Nun können auch einfach Infoboxen zu den Liedern hinzugefügt werden.
## Projektaufbau

### Liederbuch.tex

Die Hauptdatei. Hier wird das Layout festgelegt, benutzerdefinierte Befehle angelegt, die Struktur des Liederbuches definiert, Lieder eingebunden, ...

### bilder/...

Hier werden alle Bilder und grafischen Gestaltungselemente die in Liedern verwendet werden abgelegt.

### icons/...

Kleine Icons die im Layout verwendet werden, werden hier gespeichert.

### lieder/...

Alle Lieder die im Liederbuch verwendet werden, werden hier gespeichert. Einen Schwung Illustrationen haben wir hier schon abgespeichert. Bitte beachte die dort abgelegte LICENSE.md Datei wenn du sie verwenden möchtest.

## Lieder anlegen

Eine Lieddatei beginnt immer mit folgenden Header:

```tex
\def\Titel{Die Gedanken sind frei}
\def\Interpret{Deutsches Volkslied}
\def\Referenz{Möglicher Querverweis auf ein gebräuchliches Liederbuch deiner Wahl}

% hier entweder \LiedSetup() oder wenn es im Kuratenverzeichnis auftauchen soll \GeistlichSetup{}
\LiedSetup{}

```

* Der Parameter `\Titel` wird als Überschrift des Liedes verwendet, taucht in den Verzeichnissen auf und wird in der Kopfzeile auf der Blattaußenseite verwendet.
* Der Parameter `\Interpret` wird in der Kopfzeile auf der Falzseite verwendet.
* Der Parameter `\Referenz` wird in der Fußzeile auf der Falzseite verwendet und soll auf das Vorkommen dieses Liedes in anderen populären Liederbüchern verweisen.
* Der Befehl `\LiedSetup()` verwendet die vorherigen Parameter und stellt das richtige Layout sicher.
* Alternativ kann der Befehl `\GeistlichSetup()` verwendet werden. Zusätzlich zu `\LiedSetup()` wird ein damit eingeleitetes Lied noch im sekundären Inhaltsverzeichnis gelistet.
* In der `abc` Umgebung können Noten (mit Liedtexten)  geschrieben werden.
* In der `guitarMagic` Umgebung können Liedtexte ohne Noten geschrieben werden.

### mit Noten (`abc`)

* Nach `\begin{abc}[...]` kann mit dem Notenschreiben begonnen werden.
```tex
\begin{abc}[name=DieInternationale,program={abcm2ps -O= --pagescale 1.1}]
```

* `abc` setzt mind. die Tags `X:` und `K: ` voraus, weitere Tags können angegeben werden.
* Titel, Artist u.ä. sollten hier nicht nochmal angegeben werden, da sie sonst doppelt erscheinen.

```tex
X: 1 % notwendig, start des Headers
M: C % Takt
K: G % Tonart
```

* Nun kann mit dem Notenschreiben begonnen werden. Dazu wird die "abc 2 music notation language" vewendet. Wie diese genau definiert ist kannst du im Internet nachlesen.

```tex
D2 | G3 F A G D B, | E4 C2 E2 | A3 G F E D C | B,4 z2 D |
w: Wacht auf, Ver- damm- te die- ser Er- de,
+: die stets man noch zum Hun- gern zwingt! Das
G3 F A G D B, | E4 C2 a G | F2 A2 c2 F2 | G4 z2 B A |
w: Recht wie Glut im Kra- ter- her- de
+: nun mit Macht zum Durch- bruch dringt.
...
```

* `\end{abc}` beendet die Noteneingabe. Danach können weitere Strophen ohne Noten oder Bilder eingefügt werden.

```tex
\end{abc}
```

* Wenn die Noten auf zwei oder mehrere Seiten verteilt werden sollen müssen
diese in zwei oder mehr `abc`-blocks aufgeteilt werden. Dazwischen wird mit dem
Befehl `\liedweiter` der Seitenumbruch eingefügt. 

```tex
...
C D E F G A B c |
\end{abc}

\liedweiter

\begin{abc}[[name=LiedVortsetzung,program={abcm2ps -O= --pagescale 1.1}]
X: 1
K: C 
c B A G F E D C |]
...

...
\end{abc}
```

### ohne Noten (`guitareMagic`)

* Liedtext ohne Noten begint mit `\begin{guitarMagic}`.

```tex
\begin{guitarMagic}

    \begin{enumerate}

        \item Die Ge[A]danken sind frei, wer [E7]kann sie er[A]raten?\\
        Sie fliehen vorbei wie [E7]nächtliche [A]Schatten.\\
        Kein [E]Mensch kann sie [A]wissen, kein [E]Jäger er[A]schießen
        mit [D]Pulver und [A]Blei.\\
        Die Ge[E]danken sind [A]frei!

        \item Ich [A]denke, was ich will und [E]was mich be[A]glücket,\\
        doch alles in der Still’
        und [E]wie es sich [A]schicket.\\
        Mein [E]Wunsch und Be[A]gehren
        kann [E]niemand ver[A]wehren,
        es [D]bleibet da[A]bei:\\
        Die Ge[E]danken sind [A]frei!
        % So wird ein Seitenumbruch mit dem "auf der nächsten Seite gehts weiter" eingefügt
        \liedweiter{}


    \end{enumerate}
```

* Im Regelfall wird das Lied mit `\begin{enumerate}` begonnen. Jedes `\item` beginnt dann automatisch eine neue Strophe die der Reihe nach durchnummeriert werden.
* Eine Zeile wird mit einem `\\` beendet.
* Der Befehl `\liedweiter{}` sorgt dafür, dass ein "Lied geht auf der nächsten Seite weiter"-Zeichen eingefügt wird und eine neue Seite angefangen wird.
* Refrains werden wie folgt eingefügt.

```tex
Diese Strophe geht hier zu Ende.

\textbf{Refrain 1:}
Ich bin der Text des Refrains\\
```

* Sollte ein Lied mit einem Intro oder Refrain anstelle einer Strophe beginnen, muss dieser Teil des Stücks vor dem `\begin{enumerate}`, wie folgt stehen

```tex
\textbf{Intro:}
Introtext, geklimper und andere musikalischen Dinge

\begin{enumerate}
    \item Ich bin die erste Strophe nach dem Intro

```

* Gitarrenakkorde werden mit dem `Guitar`-Package gesetzt. Wie das geht darfst du selber nachlesen.

```tex
\end{guitarMagic}
```

* Ein Lied endet mit dem `\end{guitarMagic}`-Befehl.

* Wenn die erste Strophe bereitsmit Noten geschrieben wurde, kann mit
`\setcounter` der Zähler von `enumerate` gesetzt werden:

```tex
\begin{enumerate}
\setcounter{enumi}{2} % begin bei 2. Strophe
    \item Hier die 2te und folgende Strophen.

\end{enumerate}
```

### Bilder einfügen

```tex
% Bilder können nicht in der guitarmagic oder abc Umgebung eingefügt werden. Das muss davor oder danach geschehen
\begin{picture}(0,0)
    \put(-5,-150){\hbox{\includegraphics[scale=0.25, angle=0]{bilder/Flaschenpost.png}}}
\end{picture}
```

* Optional kann noch ein Bild eingebunden werden. Hierbei ist zu beachten, dass Bilder nicht in der `guitarMagic`- oder `abc`-Umgebung verwendet werden können.

### Infoboxen eingügen

```tex
% Infoboxen können nicht in der guitarmagic oder abc Umgebung eingefügt werden. Das muss davor oder danahc geschehen.
\notebox{Beispieltext}
```

* Optional kann eine Infobox eingefügt werden mit Hintergrundwissen zu dem Lied o.ä.

## Compile

Zusätzlich zu LaTeX wird zum kompelieren das Packet `abcm2ps` benötigt, welches
für die Erzeugung der Musiknoten übernimmt.
Für Ubuntu kann es aus den offizielen Packetquellen instaliert werden.

