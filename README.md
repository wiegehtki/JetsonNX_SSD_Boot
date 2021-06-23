# Inbetriebnahme der M.2 NVMe SSD des NVIDIA® Jetson™ Xavier NX

### Kopieren der Daten von SD auf SSD und Installation der notwendigen Dienste (Services)

#### Nach der Installation könnt Ihr: 
* Den Jetson™ direkt von der M.2 NVMe SSD booten.
* Mit hoher Wahrscheinlichkeit und abhängig von der gewählten SSD einen deutlichen Performancesprung im Vergleich zur SD generieren.

#### Wichtig: Eine entsprechende M.2 NVMe SSD muss bereits hardwareseitig installiert sein.
Außerdem sollte die SSD bereits erkannt und eine Partition bereits eingerichtet sein; hier nochmal die Schritte dazu: 
* Unter Ubuntu auf "Disks" gehen.
* SSD sollte gelistet sein und als `/dev/nvme0n1` angezeigt werden.
* SSD auswählen und im Menü `Format` auswählen und mit `GPT` (Standardvorgabe) formatieren.
* Prüfen, ob es die richtige SSD ist, authentifizieren und formatieren.
* Nach der Formatierung SSD auswählen und mit `+` eine Partition erstellen. Ggfs. Grösse anpassen, wenn gewünscht.
* Dann auf `Next`, Namen vergeben und kontrollieren, ob die Checkbox bei `EXT4` gesetzt ist (Standardvorgabe).
* Nun `Create` anwählen und danach kontrollieren, ob die SSD als `/dev/nvme0n1p1` erscheint.

#### Den Jetson™ von der installierten SD booten (sollte bereits so sein), Terminal öffnen und sicherstellen, dass man als root angemeldet ist:
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
  
