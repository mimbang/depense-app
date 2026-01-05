@echo off
REM Script de configuration initiale du projet (Windows)
REM À exécuter une seule fois après le clonage

setlocal enabledelayedexpansion

echo 🛠️ Configuration du projet Django + React Native...

REM Vérifier si Python est installé
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python n'est pas installé
    exit /b 1
)

REM Créer un environnement virtuel
echo 📦 Création de l'environnement virtuel...
python -m venv env

REM Activer l'environnement virtuel
echo ✨ Activation de l'environnement virtuel...
call env\Scripts\activate.bat

REM Installer les dépendances
echo 📚 Installation des dépendances Python...
python -m pip install --upgrade pip
pip install -r requirements.txt

REM Créer le fichier .env s'il n'existe pas
if not exist .env (
    echo 🔧 Création du fichier .env...
    copy .env.example .env
    echo ⚠️ Veuillez configurer le fichier .env avec vos paramètres
)

REM Appliquer les migrations
echo 🗄️ Application des migrations...
python manage.py migrate

REM Créer un superuser
echo 👤 Création du superuser (optionnel)
set /p createsuper="Créer un superuser ? (o/n): "
if /i "!createsuper!"=="o" (
    python manage.py createsuperuser
)

REM Collecter les fichiers statiques
echo 📁 Collecte des fichiers statiques...
python manage.py collectstatic --noinput

echo.
echo ✅ Configuration terminée !
echo.
echo Pour démarrer le développement :
echo   env\Scripts\activate
echo   python manage.py runserver
echo.
echo L'API sera disponible sur: http://localhost:8000/api/
echo L'admin Django est disponible sur: http://localhost:8000/admin/
echo.
pause
