echo " Bienvenue dans le script d'installation automatique."
echo " IMPORTANT : Si des problèmes sont rencontrés lors de l'éxecution de ce script, il est vivement recommandé de le lancer en tant que SU."
echo " Téléchargement des mises à jour de Linux..."
apt update # Met à jour les paquets
echo " Installation des mises à jour de Linux..."
apt upgrade # Installe les mises à jour
echo " Mise à jour des dépôts..."
apt update -y # Met à jour les dépôts
echo " Installation de ProFTPd..."
sudo apt-get install proftpd-* openssl -y # Installe ProFTPd
echo " Création des 2 utilisateurs Merry & Pippin par défaut..."
sudo useradd -m Merry && sudo adduser Merry ftp # Crée l'utilisateur Merry
sudo echo "Merry:kalimac" | sudo chpasswd # Définit le mot de passe de Merry
sudo useradd -m Pippin && sudo adduser Pippin ftp # Crée l'utilisateur Pippin
sudo echo "Pippin:secondbreakfast" | sudo chpasswd # Définit le mot de passe de Pippin
echo "Création des clefs de chiffrement"
sudo mkdir /etc/proftpd/ssl # Crée le dossier de stockage des clefs
sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem # Crée les clefs
echo "Backup..."
sudo cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.bak # Backup du fichier de configuration
echo "Remplacement du fichier proftpd.conf"
sudo cp proftpd.conf /etc/proftpd/proftpd.conf # Remplace le fichier de configuration
sudo chmod 600 /etc/proftpd/ssl/proftpd.* # Change les permissions des clefs
echo "Reboot..."
reboot -reboot # Redémarre le serveur
echo "Installation terminée" # Fin du script