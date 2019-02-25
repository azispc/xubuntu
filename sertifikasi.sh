#konfigurasi ip_manual
ip address add address=192.168.1.6/24 interface=ether1
ip address add address=10.10.10.1/24 interface=ether2
ip address add address=192.168.100.1/24 interface=ether3
ip address add address=1.1.1.1/24 interface=ether4
ip address add address=192.168.200.1/24 interface=wlan1

#konfigurasi_DNS_manual
ip dns set servers=8.8.8.8,8.8.4.4 allow-remote-requests=yes

#konfigurasi_IP_route
ip route add dst-address=0.0.0.0/0 gateway=192.168.1.1

#konfigurasi_NTP(Network Time Protokol)
system ntp client set enabled=yes primary-ntp=203.160.128.3

#set_waktu_router
system clock set time=20:18:01 date=Feb/25/2019 time-zone-autodetect=yes time-zone-name=Asia/Jakarta

# create pool
ip pool
add name=ip-pool range=10.10.10.2-10.10.10.100

#DHCP-servcer ether3

#konfigurasi_NAT
ip firewall nat add chain=srcnat src-address=192.168.100.0/24 out-interfaces=ether1 action=masquerade

#DNS_statis
ip dns static add name="mikrotik.com" address="127.0.0.1"
ip dns static add name="www.mikrotik.com" address="127.0.0.1"

#blokir icmp (range ip 192.168.100.2-50)
ip firewall filter
add chain=input src-address=192.168.100.2-192.168.100.50 dst-address=192.168.1.6 protocol=icmp action=drop
add chain=input src-address=192.168.100.2-192.168.100.50 dst-address=192.168.100.1 protocol=icmp action=drop
add chain=input src-address=192.168.100.2-192.168.100.50 dst-address=192.168.200.1 protocol=icmp action=drop

#logging
ip firewall filter add chain=input log=yes log-prefix=Akses

#firewall HTTP&HTTPS
add chain=forward protocl=tcp dst-port=80,443 interface=ether4 out-interfaces=ether1

#kon.Wlan
interface wireless enabled
interface wireless set mode=ap-bridge ssid=coomstore@proxy

#set proxy server
ip proxy set enabled=yes port=8080 cache administrator=coomstore@sekolah.sch.id cache-on-disk=yes

#blokir website
ip proxy access add dst-host=www.linux.or.id action=deny
ip proxy access add dst-host=www.linux.or.id action=deny

#optimasi proxy
ip firewall nat add chain=dstnat protocol=tcp dst-port=80 interfaces=wlan1 action=redirect to-port=8080

#blokir konten
ip firewall filter add chain=forward content=mikrotik action=drop

#testing
#konfigurasi LAN
#cek koneksi
#cek site yg di blokir www.linux.or.id

