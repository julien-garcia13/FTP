#! /bin/bash
echo " Bienvenue dans le script d'installation automatique."
echo " IMPORTANT : Si des problèmes sont rencontrés lors de l'éxecution de ce script, il est vivement recommandé de le lancer en tant que SU."
echo " Téléchargement des mises à jour de Linux..."
apt update
echo " Installation des mises à jour de Linux..."
apt upgrade
echo " Mise à jour des dépôts..."
apt update -y
echo " Installation de ProFTPd..."
apt install proftpd
echo " Création des 2 utilisateurs Merry & Pippin par défaut..."
useradd Merry
passwd Merry
kalimac
kalimac
useradd Pippin
passwd Pippin
secondbreakfast
secondbreakfast
echo " Mise en place du fichier proftpd.conf modifié avec mise en place de l'original"
