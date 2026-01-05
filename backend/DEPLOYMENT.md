# 🚀 Guide de Déploiement

## Prérequis

- Python 3.8+
- PostgreSQL (recommandé pour la production)
- Serveur web (Heroku, PythonAnywhere, AWS, DigitalOcean, etc.)
- Git

## Configuration Locale

### 1. Cloner et configurer l'environnement

```bash
git clone <votre-repo>
cd backend
python -m venv env
source env/bin/activate  # ou env\Scripts\activate sur Windows
pip install -r requirements.txt
```

### 2. Configurer les variables d'environnement

Créez un fichier `.env` basé sur `.env.example`:

```bash
cp .env.example .env
```

Modifiez `.env` avec vos configurations:
- `SECRET_KEY`: Générez une clé secrète forte
- `DEBUG`: False en production
- `DATABASE_URL`: URL de votre base de données PostgreSQL
- `ALLOWED_HOSTS`: Domaines autorisés
- `CORS_ALLOWED_ORIGINS`: Origines CORS autorisées

### 3. Initialiser la base de données

```bash
python manage.py migrate
python manage.py createsuperuser
```

### 4. Collecter les fichiers statiques

```bash
python manage.py collectstatic --noinput
```

## Déploiement sur Heroku

### 1. Installation et configuration de Heroku CLI

```bash
# Installer Heroku CLI
# Puis se connecter
heroku login
```

### 2. Créer l'application Heroku

```bash
heroku create your-app-name
```

### 3. Configurer les variables d'environnement

```bash
heroku config:set SECRET_KEY="your-secret-key"
heroku config:set DEBUG=False
heroku config:set ALLOWED_HOSTS="your-app-name.herokuapp.com"
heroku config:set CORS_ALLOWED_ORIGINS="https://your-frontend-domain.com"
```

### 4. Ajouter PostgreSQL (si nécessaire)

```bash
heroku addons:create heroku-postgresql:hobby-dev
```

### 5. Déployer

```bash
git push heroku main  # ou votre branche par défaut
```

### 6. Exécuter les migrations

```bash
heroku run python manage.py migrate
heroku run python manage.py createsuperuser
```

## Déploiement sur PythonAnywhere

### 1. Créer un compte sur PythonAnywhere

Visitez https://www.pythonanywhere.com

### 2. Cloner le repository

```bash
git clone <votre-repo>
```

### 3. Créer un virtualenv

```bash
mkvirtualenv --python=/usr/bin/python3.10 myenv
pip install -r requirements.txt
```

### 4. Configurer les variables d'environnement

Créez `.env` avec vos configurations.

### 5. Configurer l'application web

- Web app > Add a new web app > Manual configuration > Python 3.10
- WSGI configuration file: `/home/username/backend/backend/wsgi.py`
- Virtualenv: `/home/username/.virtualenvs/myenv`

### 6. Exécuter les migrations

```bash
python manage.py migrate
```

## Déploiement sur DigitalOcean App Platform

### 1. Préparer le projet

Assurez-vous que tous les fichiers de configuration sont prêts:
- `Procfile` ✓
- `requirements.txt` ✓
- `.env` ou variables d'environnement définies

### 2. Créer une droplet et configurer

```bash
# SSH dans votre serveur
ssh root@your_server_ip

# Installer les dépendances
apt-get update
apt-get install python3-pip python3-venv postgresql

# Cloner le repo
git clone <votre-repo>
cd backend
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
```

### 3. Configurer PostgreSQL

```bash
sudo -u postgres psql
CREATE DATABASE your_db;
CREATE USER your_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE your_db TO your_user;
```

### 4. Variables d'environnement

Exportez les variables d'environnement:

```bash
export SECRET_KEY="your-secret-key"
export DEBUG=False
export DATABASE_URL="postgresql://user:password@localhost/dbname"
export ALLOWED_HOSTS="your-domain.com"
```

### 5. Déployer avec Gunicorn

```bash
gunicorn backend.wsgi:application --bind 0.0.0.0:8000
```

## Configuration du Frontend (React Native Expo)

### 1. Configurer les variables d'environnement frontend

Créez un fichier `app/.env`:

```
EXPO_PUBLIC_API_URL=https://your-api-domain.com/api
EXPO_PUBLIC_DEBUG=false
```

### 2. Build et déploiement

```bash
cd frontend/app
npm install
expo build:android  # ou ios
expo publish  # pour les mises à jour OTA
```

## Sécurité - Checklist

- [ ] `DEBUG = False` en production
- [ ] `SECRET_KEY` changée et sécurisée
- [ ] `ALLOWED_HOSTS` configurés correctement
- [ ] `CORS_ALLOWED_ORIGINS` limités à vos domaines
- [ ] `SECURE_SSL_REDIRECT = True`
- [ ] `SESSION_COOKIE_SECURE = True`
- [ ] `CSRF_COOKIE_SECURE = True`
- [ ] Base de données PostgreSQL utilisée (pas SQLite)
- [ ] Certificat SSL/TLS configuré
- [ ] Sauvegardes de base de données configurées
- [ ] Monitoring et logs configurés

## Monitoring et Logs

### Sur Heroku

```bash
heroku logs --tail
```

### Sur serveur Linux

```bash
# Vérifier les logs de l'application
tail -f /var/log/gunicorn.log

# Vérifier le statut du service
systemctl status gunicorn
```

## Mise à jour de l'application

### Sur Heroku

```bash
git push heroku main
```

### Sur serveur Linux

```bash
cd /path/to/app
git pull origin main
source env/bin/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py collectstatic --noinput
systemctl restart gunicorn
```

## Résolution des problèmes

### Erreur de connexion à la base de données

Vérifiez:
- `DATABASE_URL` est correctement définie
- Les credentials de la base de données sont corrects
- Le serveur de base de données est accessible

### Erreur 404 sur les fichiers statiques

Exécutez:
```bash
python manage.py collectstatic --noinput --clear
```

### Erreur CORS

Vérifiez que `CORS_ALLOWED_ORIGINS` inclut le domaine du frontend.

### Erreur 500

Vérifiez les logs et assurez-vous que:
- Toutes les migrations sont exécutées
- Toutes les variables d'environnement sont définies

## Support

Pour plus d'informations:
- [Documentation Django](https://docs.djangoproject.com/en/6.0/howto/deployment/)
- [Guide Heroku](https://devcenter.heroku.com/articles/deploying-python)
- [PythonAnywhere](https://www.pythonanywhere.com/help/PythonAnywhere/)
