#instalacion de paquetes iniciales
dnf install -y epel-release
dnf install -y openvpn easy-rsa

#configuracion inicial
cd /usr/share/easy-rsa/3.0.8
cp -r * /etc/openvpn/server/.
cd /etc/openvpn/server/
./easyrsa init-pki
./easyrsa build-ca nopass

#creacion y firma de los certificados para el servidor
./easyrsa gen-req serverA nopass
./easyrsa sign-req server serverA nopass

#creacion y firma de los certificados para el cliente
./easyrsa gen-req clientA nopass
./easyrsa sign-req client clientA nopass

./easyrsa gen-dh

cd /etc/openvpn/server/
#una vez llegado a este punto se copia el archivo 'server.conf' proporcionado dentro del repositorio 
#una vez copiado se ejecuta el archivo 'server2.sh'



