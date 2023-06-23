#!/bin/bash

### Löschen und erstellen der venv sollte manuell getätigt werden bevor dieses Skript gestartet wird ###


### löschen der alten venv
#cd ..
#rm -r venv/ 2> /dev/null
###

### Erstellung der venv
#python3.8 -m venv venv 
#source venv/bin/activate
###


### Fehlermeldung beim Versuch die venv über die Kommandozeile zu erstellen:
#Error: Command '['/home/iwan/stuff/dev/FlectraDevF2_test/venv/bin/python3.8', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1.
###

### Installation der erforderlichen Pakete
sudo apt-get update
sudo apt-get install python3-distutils python3.8-distutils python3.8-dev libsass-dev libldap2-dev libsasl2-dev libssl-dev postgresql build-essential
###

## weitere apt installationen
sudo apt install python3-psycopg2
sudo apt install libpq-dev

sudo apt update
sudo apt upgrade
sudo apt autoremove


### Aktualisierung von pip, setuptools und wheel
pip install --upgrade pip
pip install setuptools wheel
###

### Installation der Module aus den requirements.txt-Dateien
pip install -r requirements.txt 2>/dev/null
pip install -r requirements_intern.txt 2>/dev/null
###

### Weitere Module installieren
pip install pyPDF2 babel passlib werkzeug lxml decorator polib Pillow psycopg2-binary idna psutil requests jinja2

## weitere Module separat installiern
pip3 install python-dateutil
pip3 install reportlab
pip3 install psycopg2-binary

pip install Werkzeug==0.16.1 libsass
###

### Installation der Module aus den requirements.txt-Dateien
pip install -r requirements.txt
pip install -r requirements_intern.txt
###

### PostgreSQL beireitmachen
sudo -u postgres createuser --superuser $(whoami)
createdb flectra-test
###

### Flectra starten
echo "Folgender Befehl um Flectra zu starten:"
echo "python3 flectra-bin -d flectra-test -i base --addons-path=addons --db-filter=flectra-test"
echo "Flectra ist erreichbar unter: http://127.0.0.1:7073/"
###


