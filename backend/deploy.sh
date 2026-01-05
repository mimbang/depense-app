#!/bin/bash

# Script de déploiement pour Django + React Native
# À exécuter sur le serveur de production

set -e

echo "🚀 Démarrage du déploiement..."

# Activer l'environnement virtuel (si existant)
if [ -d "env" ]; then
    source env/bin/activate || . env/Scripts/activate
fi

# Installer les dépendances Python
echo "📦 Installation des dépendances Python..."
pip install -r requirements.txt

# Collecter les fichiers statiques
echo "📁 Collecte des fichiers statiques..."
python manage.py collectstatic --noinput

# Exécuter les migrations
echo "🗄️ Exécution des migrations de base de données..."
python manage.py migrate

# Créer un superuser (optionnel - décommentez si nécessaire)
# echo "👤 Création du superuser..."
# python manage.py createsuperuser

echo "✅ Déploiement complété avec succès!"
echo "🌐 Votre application est prête à être lancée avec gunicorn:"
echo "   gunicorn backend.wsgi:application --bind 0.0.0.0:8000"
