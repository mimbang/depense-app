@echo off
REM Script de déploiement pour Django + React Native (Windows)
REM À exécuter sur le serveur de production

setlocal enabledelayedexpansion

echo 🚀 Démarrage du déploiement...

REM Activer l'environnement virtuel
if exist env\Scripts\activate.bat (
    call env\Scripts\activate.bat
)

REM Installer les dépendances Python
echo 📦 Installation des dépendances Python...
pip install -r requirements.txt

REM Collecter les fichiers statiques
echo 📁 Collecte des fichiers statiques...
python manage.py collectstatic --noinput

REM Exécuter les migrations
echo 🗄️ Exécution des migrations de base de données...
python manage.py migrate

REM Créer un superuser (optionnel)
REM echo 👤 Création du superuser...
REM python manage.py createsuperuser

echo ✅ Déploiement complété avec succès!
echo 🌐 Votre application est prête à être lancée avec gunicorn:
echo    gunicorn backend.wsgi:application --bind 0.0.0.0:8000

pause
