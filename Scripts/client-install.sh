# Configuración del cliente Inicio.
yum -y install epel-release     #instalar el repo epe-release
yum -y install openvpn # instalar el repo de openvpn

# Parte del servidor
# cd /etc/openvpn/server/pki/
# scp ca.crt root@ip_client:/etc/openvpn/client/.
# scp issued/clientA.crt root@ip_client:/etc/openvpn/client/.
# scp private/clientA.key root@ip_client:/etc/openvpn/client/.
