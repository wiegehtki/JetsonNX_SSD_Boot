# Inbetriebnahme der M.2 NVMe SSD des NVIDIA® Jetson™ Xavier NX

### Kopieren der Daten von SD auf SSD und Installation der notwendigen Dienste (Services)

#### Nach der Installation könnt Ihr: 
* Den Jetson™ direkt von der M.2 NVMe SSD booten.
* Mit hoher Wahrscheinlichkeit und abhängig von der gewählten SSD einen deutlichen Performancesprung im Vergleich zur SD generieren.

#### Wichtig: Eine entsprechende M.2 NVMe SSD muss bereits hardwareseitig installiert sein.
Außerdem sollte die SSD bereits erkannt und eine Partition bereits eingerichtet sein. 

#### Den Jetson™ von der installierten SD booten, Terminal öffnen und sicher stellen, dass man als root angemeldet ist:
```
sudo su
cd ~
```

#### Zur Installation könnt ihr dann wie folgt vorgehen, dazu alle Befehle im Terminal ausführen:
```
       git clone https://github.com/wiegehtki/JetsonNX_SSD_Boot.git
       cd JetsonNX_SSD_Boot
       sudo chmod +x *sh
```

Danach die Installation starten:

```
       ./install_ssd.sh      
```

Nach der Installation einen `reboot` ausführen.
  
