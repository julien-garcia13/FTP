echo "ATTENTION : Tous les utilisateurs, ProFTPd ainsi que les groupes seront supprimés. Voulez vous vraiment continuer ? (O/N)" # Demande à l'utilisateur s'il veut continuer
read -r reponse
if [ "$reponse" != "${reponse#[Oo]}" ] ;then # Si la réponse est O ou o
    echo "Suppression des utilisateurs Merry & Pippin ..." 
    sudo userdel Merry && sudo userdel Pippin # Suppression des utilisateurs Merry & Pippin
    echo "Suppression de ProFTPd..."
    sudo apt-get autoremove --purge proftpd-* && sudo apt-get autoremove --purge openssl # Suppression de ProFTPd
    echo "Suppression des groupes..."
    sudo groupdel ftp # Suppression des groupes
    echo "Suppression des clefs..."
    sudo rm -rf /etc/proftpd/ssl # Suppression des clefs
    echo "Suppression du fichier de configuration..."
    sudo rm -rf /etc/proftpd/proftpd.conf # Suppression du fichier de configuration
    echo "Suppression terminée" # Message que la purge est terminée et que le script s'arrête.
else
    echo "Suppression annulée." # Message que la purge est annulée et que le script s'arrête.
fi