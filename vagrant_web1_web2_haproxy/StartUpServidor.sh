#Initial provisioning of the virtual machines, the machines are updated, a 
#new user is created, the password is changed, the user is added to the sudoers 
#list, the sshd service is restartedd

echo "Iniciando aprovisionamiento inicial ----------------------------------------------------------------"

echo "Actualizando VM"
sudo apt-get update -y
sudo apt-get upgrade -y

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

