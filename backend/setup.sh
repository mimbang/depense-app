#!/bin/bash

# Script de configuration initiale du projet
# À exécuter une seule fois après le clonage

set -e

echo "🛠️ Configuration du projet Django + React Native..."

# Vérifier si Python est installé
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 n'est pas installé"
    exit 1
fi

# Créer un environnement virtuel
echo "📦 Création de l'environnement virtuel..."
python3 -m venv env

# Activer l'environnement virtuel
echo "✨ Activation de l'environnement virtuel..."
source env/bin/activate || . env/Scripts/activate

# Installer les dépendances
echo "📚 Installation des dépendances Python..."
pip install --upgrade pip
pip install -r requirements.txt

# Créer le fichier .env s'il n'existe pas
if [ ! -f .env ]; then
    echo "🔧 Création du fichier .env..."
    cp .env.example .env
    echo "⚠️  Veuillez configurer le fichier .env avec vos paramètres"
fi

# Appliquer les migrations
echo "🗄️ Application des migrations..."
python manage.py migrate

# Créer un superuser
echo "👤 Création du superuser (optionnel)"
read -p "Créer un superuser ? (o/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Oo]$ ]]; then
    python manage.py createsuperuser
fi

# Collecter les fichiers statiques
echo "📁 Collecte des fichiers statiques..."
python manage.py collectstatic --noinput

echo ""
echo "✅ Configuration terminée !"
echo ""
echo "Pour démarrer le développement :"
echo "  source env/bin/activate  # ou env\\Scripts\\activate sur Windows"
echo "  python manage.py runserver"
echo ""
echo "L'API sera disponible sur: http://localhost:8000/api/"
echo "L'admin Django est disponible sur: http://localhost:8000/admin/"
