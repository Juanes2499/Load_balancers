
#Aprovisionamiento inicial para ansible

echo "Iniciando aprovisionamiento inicial ----------------------------------------------------------------"

echo "Creando usuario local remotoServer"
sudo adduser remoto --gecos "First Last,RoomNumber,WorkPhone,HomePhone,Other" --disabled-password
echo "remoto:1234" | sudo chpasswd

sleep 5

echo "Agregando usuario remoto a la lista de sudoers"
echo 'remoto  ALL=(ALL:ALL) ALL' >> /etc/sudoers

sleep 5

echo "Modificando archivo sshd_config"
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

sleep 5

echo "Reiniciando servicio SSH"
sudo systemctl restart sshd

echo "Finalizando aprovisionamiento inicial ---------------------------------------------------------------"

