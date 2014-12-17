#!/bin/bash

# luodaan käyttäjä- ja ryhmätiedot
MKPASSWD="$( mkpasswd -c )"
MKGROUP="$( mkgroup -c )"
echo "vhs:unused:1001:${MKPASSWD#*:unused:*:}" > /etc/passwd
echo "$MKGROUP" > /etc/group

mkdir /home/vhs/Movies &>/dev/null

# luodaan linkki työpöydälle nauhoitukset-hakemistoon
rm "/home/vhs/Movies/vhs" &>/dev/null
echo "Etsitään työpöytää..."
desktop="$( cygpath "${USERPROFILE}\\Desktop" )"
[ -d "$desktop" ] || ( echo "Työpöytää ei löytynyt, ei voida jatkaa!" && read line && exit 1 )
if mkdir "${desktop}/nauhoitukset" &>/dev/null
 then touch "${desktop}/nauhoitukset/Tallennettavan ohjelman tai sarjan nimi.txt"
fi
ln -s "${desktop}/nauhoitukset" "/home/vhs/Movies/vhs"
echo "Tallennukset asetetaan Työpöydälle luodussa nauhoitukset-hakemistossa"
echo
cygstart "${desktop}/nauhoitukset"

# luodaan linkki iTunesin automaattilisäyshakemistoon
rm "/home/vhs/Movies/tunes" &>/dev/null
echo "Etsitään iTunes-kirjastoa..."
iTunesLibrary="$( find "$USERPROFILE" -name iTunes\ Library.itl | head -n 1 )"
iTunes="$( dirname "$( cygpath "$iTunesLibrary" )" )/iTunes Media/Lisää automaattisesti iTunesiin"
if [ -d "$iTunes" ]
 then
	ln -s "$iTunes" "/home/vhs/Movies/tunes"
	# siirretään vanhat tallennukset iTunes-kirjastoon
	find /home/vhs/Movies/vhs -type d -not -name .vhs.\* -exec mv '{}/*' /home/vhs/Movies/tunes/ \;
	echo "Löytyi: $iTunesLibrary"
 else
	echo "Ei löytynyt; tiedostot sijoitetaan nauhoitukset-hakemistoon"
fi
echo

# ladataan uusin versio vhs.sh-skriptistä
echo "Ladataan vhs.sh..."
cd "/home/vhs"
if [ -d vhs/ ]
 then cd vhs/; git pull
 else git clone https://github.com/an7oine/vhs.git
fi
if [ $? -eq 0 ]
 then echo; echo "Asennus onnistui."
 else echo; echo "Skriptiä ei voitu ladata, ei internet-yhteyttä?"
fi

read line
