#!/bin/bash

# Script de création d'utilisateurs

if [ $# -eq 0 ] # Si nombre d'arguments au lancement est égal à 0, le script s arrête grâce à exit 1.
then
echo "Il manque les noms d'utilisateurs en argument - Fin du script"
exit 1
fi

for user in $@
do
  # On vérifie si le user existe déjà en parcourant le fichier /etc/passwd grâce à grep.
  # Si le test renvoie 0, la condition est vraie et le user existe, on sort du programme.
  if cat /etc/passwd | grep -q "$user"
  then
  echo "L'utilisateur $user existe déjà"
  exit 1

  # Si le user n'existe pas, on le crée avec la commande useradd
  else
  useradd $user

    # On vérifie que le user a bien été créé grâce à la dernière commande $?
    # Si elle renvoie 0, ça veut dire que useradd a fonctionné
    if [ $? -eq 0 ]
      echo "L"utilisateur $user a été créé"
      
      # Si la commande précédente renvoie autre chose que 0,
      # ça veut dire que la création du dossier n'a pas marché
      else
        echo "Erreur à la création de l'utilisateur $user"
      fi
    fi
done
