# 📚 Commandes utiles - Projet Power

## Backend Django

### Configuration initiale

```bash
# Créer un environnement virtuel
python -m venv env

# Activer l'environnement (Linux/macOS)
source env/bin/activate

# Activer l'environnement (Windows)
env\Scripts\activate

# Installer les dépendances
pip install -r requirements.txt

# Copier le fichier .env
cp .env.example .env
```

### Développement

```bash
# Démarrer le serveur de développement
python manage.py runserver

# Démarrer sur un port spécifique
python manage.py runserver 0.0.0.0:8001

# Shell Django interactif
python manage.py shell

# Ouvrir une base de données
python manage.py dbshell
```

### Migrations

```bash
# Créer les migrations
python manage.py makemigrations

# Afficher les migrations à faire
python manage.py showmigrations

# Appliquer les migrations
python manage.py migrate

# Migrer une app spécifique
python manage.py migrate api

# Voir le SQL généré
python manage.py sqlmigrate api 0001

# Rollback une migration
python manage.py migrate api 0001
```

### Utilisateurs et admin

```bash
# Créer un superuser
python manage.py createsuperuser

# Changer le mot de passe d'un user
python manage.py changepassword username

# Créer un user sans interaction
python manage.py createsuperuser --username admin --email admin@example.com --noinput
```

### Fichiers statiques

```bash
# Collecter tous les fichiers statiques
python manage.py collectstatic

# Collecter sans confirmation
python manage.py collectstatic --noinput

# Effacer les anciens fichiers avant de collecter
python manage.py collectstatic --clear --noinput

# Afficher les fichiers qui seraient collectés
python manage.py collectstatic --dry-run
```

### Tests

```bash
# Exécuter tous les tests
python manage.py test

# Exécuter les tests d'une app spécifique
python manage.py test api

# Exécuter un test spécifique
python manage.py test api.tests.TestModel

# Exécuter avec verbose
python manage.py test --verbosity=2

# Exécuter avec coverage
coverage run --source='.' manage.py test
coverage report
coverage html
```

### Maintenance

```bash
# Vérifier la configuration pour la production
python manage.py check --deploy

# Faire une copie de sauvegarde
python manage.py dumpdata > backup.json

# Restaurer une sauvegarde
python manage.py loaddata backup.json

# Créer une sauvegarde d'une app spécifique
python manage.py dumpdata api > api_backup.json

# Exporter en format JSON avec indentation
python manage.py dumpdata --indent 2 > backup.json

# Nettoyer les données (sessions, fichiers temporaires)
python manage.py clearsessions
python manage.py flush --no-input  # ⚠️ Supprime TOUT!

# Afficher les statistiques de la base
python manage.py dbshell
```

### Déploiement

```bash
# Préparer pour le déploiement
python manage.py check --deploy

# Générer une SECRET_KEY (Python)
python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'

# Collecter les statiques pour production
python manage.py collectstatic --noinput

# Exécuter les migrations
python manage.py migrate

# Démarrer avec Gunicorn
gunicorn backend.wsgi:application --bind 0.0.0.0:8000

# Avec workers multiples
gunicorn backend.wsgi:application --bind 0.0.0.0:8000 --workers 4

# Avec timeout
gunicorn backend.wsgi:application --bind 0.0.0.0:8000 --workers 4 --timeout 120

# Avec logging
gunicorn backend.wsgi:application --bind 0.0.0.0:8000 --access-logfile /var/log/gunicorn/access.log --error-logfile /var/log/gunicorn/error.log
```

---

## Frontend React Native / Expo

### Installation et configuration

```bash
# Installer les dépendances
npm install

# Ou avec yarn
yarn install

# Installer une dépendance spécifique
npm install <package-name>
```

### Développement

```bash
# Démarrer le serveur Expo
npm start

# Démarrer sur Android
npm run android

# Démarrer sur iOS
npm run ios

# Démarrer sur Web
npm run web

# Écouter les changes avec tunnel
expo start --tunnel

# Mode production
expo start --no-dev
```

### Linting et formatage

```bash
# Linter le code
npm run lint

# Fixer les erreurs de linting
npx eslint --fix

# Formatter le code avec Prettier (si installé)
npx prettier --write .
```

### Build et déploiement

```bash
# Build pour Android (APK)
eas build --platform android

# Build pour iOS (IPA)
eas build --platform ios

# Build localement avec Expo
expo build:android
expo build:ios

# Publier une mise à jour OTA
expo publish

# Afficher les logs en temps réel
expo logs
```

### Gestion des certificats

```bash
# Créer un certificat
eas credentials

# Réinitialiser les certificats
eas credentials --clear
```

---

## Docker et Docker Compose

### Docker

```bash
# Builder une image
docker build -t project-backend .

# Lancer un conteneur
docker run -p 8000:8000 project-backend

# Avec variables d'environnement
docker run -e DEBUG=False -e SECRET_KEY=your_key -p 8000:8000 project-backend

# Voir les conteneurs en cours
docker ps

# Voir tous les conteneurs
docker ps -a

# Voir les logs
docker logs container_id

# Exécuter une commande dans un conteneur
docker exec -it container_id bash

# Arrêter un conteneur
docker stop container_id

# Supprimer une image
docker rmi image_id
```

### Docker Compose

```bash
# Démarrer les services
docker-compose up

# En mode détaché (background)
docker-compose up -d

# Voir les logs
docker-compose logs

# Logs en temps réel
docker-compose logs -f

# Exécuter une commande
docker-compose exec web python manage.py migrate

# Arrêter les services
docker-compose down

# Arrêter et supprimer les volumes
docker-compose down -v

# Rebuilder les images
docker-compose build

# Redémarrer les services
docker-compose restart
```

---

## Heroku

### Avec Heroku CLI

```bash
# Se connecter
heroku login

# Créer une application
heroku create app-name

# Déployer
git push heroku main

# Voir les logs
heroku logs --tail

# Exécuter une commande
heroku run python manage.py migrate

# Créer un superuser
heroku run python manage.py createsuperuser

# Ouvrir l'application
heroku open

# Voir les variables d'env
heroku config

# Définir une variable
heroku config:set SECRET_KEY="your_key"

# Supprimer une variable
heroku config:unset SECRET_KEY

# Redémarrer l'app
heroku restart

# Afficher les infos
heroku info

# Supprimer l'app
heroku apps:destroy --app app-name
```

---

## Serveur Linux / DigitalOcean

### Système

```bash
# Mettre à jour le système
sudo apt update && sudo apt upgrade -y

# Installer Python
sudo apt install -y python3 python3-pip python3-venv

# Installer PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# Installer Nginx
sudo apt install -y nginx

# Installer Git
sudo apt install -y git
```

### Systemd (Gunicorn service)

```bash
# Vérifier le statut du service
sudo systemctl status gunicorn

# Démarrer le service
sudo systemctl start gunicorn

# Arrêter le service
sudo systemctl stop gunicorn

# Redémarrer le service
sudo systemctl restart gunicorn

# Activer au démarrage
sudo systemctl enable gunicorn

# Voir les logs
sudo journalctl -u gunicorn -n 50

# Logs en temps réel
sudo journalctl -u gunicorn -f
```

### Nginx

```bash
# Tester la configuration
sudo nginx -t

# Redémarrer Nginx
sudo systemctl restart nginx

# Voir les logs d'erreur
sudo tail -f /var/log/nginx/error.log

# Voir les logs d'accès
sudo tail -f /var/log/nginx/access.log

# Vérifier le statut
sudo systemctl status nginx
```

### PostgreSQL

```bash
# Accéder à PostgreSQL
sudo -u postgres psql

# Créer une base de données
CREATE DATABASE dbname;

# Créer un utilisateur
CREATE USER username WITH PASSWORD 'password';

# Donner les permissions
GRANT ALL PRIVILEGES ON DATABASE dbname TO username;

# Voir les bases
\l

# Connecter à une base
\c dbname

# Voir les tables
\dt

# Quitter
\q
```

---

## Git et GitHub

```bash
# Initialiser un repo
git init

# Ajouter les fichiers
git add .

# Committer
git commit -m "message"

# Voir l'historique
git log

# Voir les changes
git diff

# Créer une branche
git checkout -b branch-name

# Changer de branche
git checkout branch-name

# Merger une branche
git merge branch-name

# Pousser vers GitHub
git push origin main

# Tirer depuis GitHub
git pull origin main

# Voir l'état
git status

# Annuler les changes
git checkout -- filename

# Annuler le dernier commit (local)
git reset --soft HEAD~1
```

---

## Utilitaires

### Générer une SECRET_KEY

**Python:**
```bash
python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
```

**Bash:**
```bash
openssl rand -base64 32
```

### Vérifier si un port est utilisé

```bash
# Sur Linux/macOS
lsof -i :8000

# Sur Windows (PowerShell)
netstat -ano | findstr :8000

# Tuer le processus (Linux/macOS)
lsof -ti:8000 | xargs kill -9

# Tuer le processus (Windows PowerShell)
Stop-Process -Id (Get-NetTCPConnection -LocalPort 8000).OwningProcess -Force
```

### Compresser et zipper

```bash
# Zipper un dossier
zip -r backup.zip folder/

# Créer une tarball
tar -czf backup.tar.gz folder/

# Extraire
tar -xzf backup.tar.gz
```

---

**Pro tip:** Créez un alias dans votre `.bashrc` ou `.zshrc`:

```bash
alias djrun="python manage.py runserver"
alias djmg="python manage.py makemigrations"
alias djm="python manage.py migrate"
alias djcreate="python manage.py createsuperuser"
```

Puis vous pouvez faire:
```bash
djrun          # python manage.py runserver
djmg           # python manage.py makemigrations
djm            # python manage.py migrate
djcreate       # python manage.py createsuperuser
```
