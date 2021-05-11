#se habilita ip_forward
sysctl -w net.ipv4.ip_forward=1
echo net.ipv4.ip_forward=1 >> /etc/sysctl.d/sysctl-additionals.conf

#se configura el firewall para aceptar openvpn
firewall-cmd --zone=trusted --add-masquerade --permanent
firewall-cmd --set-default-zone=trusted
firewall-cmd --add-service=openvpn --permanent
firewall-cmd --reload
firewall-cmd --list-all

#se desactiva SElinux
setenforce 0

#se comprueba el funcionamiento del server
cd /etc/openvpn/server/
openvpn --config server.conf

#Se habilita el servidor
systemctl enable openvpn-server@server  --now
systemctl status openvpn-server@server

#Se envian las certificaciones de acceso al cliente a conectar, tener en cuenta
#que el cliente ya debe tener instalado openvpn y epel-release
#modificar 'root' por su usuario
#modificar 'ip_client' por la ip del cliente
cd /etc/openvpn/server/pki/
scp ca.crt root@ip_client:/etc/openvpn/client/.
scp issued/clientA.crt root@ip_client:/etc/openvpn/client/.
scp private/clientA.key root@ip_client:/etc/openvpn/client/.
