#Escirtura del archivo client.conf
echo "client" >> /etc/openvpn/client/clientA.conf
echo "dev tun" >> /etc/openvpn/client/clientA.conf
echo "proto udp" >> /etc/openvpn/client/clientA.conf
echo "remote **ip_server** 1194" >> /etc/openvpn/client/clientA.conf #cambiar ip_server por el ip privado del servidor.
echo "ca ca.crt" >> /etc/openvpn/client/clientA.conf
echo "cert clientA.crt" >> /etc/openvpn/client/clientA.conf
echo "key clientA.crt" >> /etc/openvpn/client/clientA.conf
echo "verb 5" >> /etc/openvpn/client/clientA.conf
echo "remote-cert-tls server" >> /etc/openvpn/client/clientA.conf
echo "auth-nocache" >> /etc/openvpn/client/clientA.conf
echo "cipher AES-256-CBC" >> /etc/openvpn/client/clientA.conf



cd /etc/openvpn/client/ #colocarse en la carpeta client de openvpn

openvpn --config clientA.conf # verificar si hay algún error.

systemctl enable openvpn-client@clientA --now # habilitar servicio
