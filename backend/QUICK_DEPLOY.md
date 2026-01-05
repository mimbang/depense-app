# 🚀 Guide Rapide de Déploiement

## Configuration rapide pour la production

### 1. Préparer votre serveur

```bash
# Cloner le repository
git clone <votre-repo> && cd projet
cd backend

# Créer un environnement virtuel
python3 -m venv env
source env/bin/activate  # ou env\Scripts\activate sur Windows

# Installer les dépendances
pip install -r requirements.txt
```

### 2. Configurer les variables d'environnement

Créez un fichier `.env` dans le répertoire `backend`:

```bash
# SECURITY - Générez une clé forte!
SECRET_KEY=your-very-long-random-secret-key-here
DEBUG=False

# DATABASE
DATABASE_URL=postgresql://user:password@localhost:5432/your_db_name

# ALLOWED HOSTS
ALLOWED_HOSTS=yourdomain.com,www.yourdomain.com

# CORS
CORS_ALLOWED_ORIGINS=https://yourdomain.com,https://www.yourdomain.com

# SECURITY
SECURE_SSL_REDIRECT=True
```

### 3. Initialiser la base de données

```bash
python manage.py migrate
python manage.py createsuperuser
python manage.py collectstatic --noinput
```

### 4. Lancer l'application avec Gunicorn

```bash
# Développement rapide
gunicorn backend.wsgi:application --bind 0.0.0.0:8000

# Production avec multiple workers
gunicorn backend.wsgi:application --bind 0.0.0.0:8000 --workers 4 --worker-class sync
```

### 5. Configurer Nginx (optional mais recommandé)

```bash
# Créer un lien symbolique
sudo ln -s /path/to/backend/nginx.conf /etc/nginx/sites-available/your-app
sudo ln -s /etc/nginx/sites-available/your-app /etc/nginx/sites-enabled/your-app

# Tester la config
sudo nginx -t

# Redémarrer nginx
sudo systemctl restart nginx
```

---

## Déployer sur Heroku (Easiest)

### 1. Installer Heroku CLI

```bash
curl https://cli.heroku.com/install.sh | sh
heroku login
```

### 2. Créer l'app Heroku

```bash
cd backend
heroku create your-app-name
heroku addons:create heroku-postgresql:hobby-dev
```

### 3. Configurer les variables d'environnement

```bash
heroku config:set SECRET_KEY="$(python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')"
heroku config:set DEBUG=False
heroku config:set ALLOWED_HOSTS="your-app-name.herokuapp.com"
heroku config:set CORS_ALLOWED_ORIGINS="https://yourdomain.com"
```

### 4. Déployer

```bash
git push heroku main
heroku run python manage.py migrate
heroku run python manage.py createsuperuser
```

### 5. Ouvrir l'application

```bash
heroku open
```

---

## Déployer sur DigitalOcean

### 1. Créer une Droplet

- Choisir Ubuntu 22.04 LTS
- Choisir la taille (commencer par $5/mois)
- Créer la droplet

### 2. SSH et configuration

```bash
ssh root@your_droplet_ip

# Mise à jour du système
apt update && apt upgrade -y

# Installer les dépendances
apt install -y python3-pip python3-venv postgresql postgresql-contrib nginx git

# Cloner le repo
git clone <votre-repo>
cd projet/backend

# Créer l'env virtuel
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
```

### 3. Configurer PostgreSQL

```bash
sudo -u postgres psql

CREATE DATABASE your_db_name;
CREATE USER your_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE your_db_name TO your_user;
ALTER ROLE your_user SET client_encoding TO 'utf8';
ALTER ROLE your_user SET default_transaction_isolation TO 'read committed';
ALTER ROLE your_user SET default_transaction_deferrable TO on;
ALTER ROLE your_user SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO your_user;
\q
```

### 4. Configurer les variables d'environnement

```bash
cd /root/projet/backend
nano .env
```

Ajouter:
```
DEBUG=False
SECRET_KEY=your-generated-key
DATABASE_URL=postgresql://your_user:your_password@127.0.0.1:5432/your_db_name
ALLOWED_HOSTS=your-domain.com
CORS_ALLOWED_ORIGINS=https://your-domain.com
```

### 5. Migrations et static files

```bash
source env/bin/activate
python manage.py migrate
python manage.py collectstatic --noinput
```

### 6. Configurer Systemd pour Gunicorn

```bash
sudo nano /etc/systemd/system/gunicorn.service
```

Copier le contenu de `backend/gunicorn.service` depuis le projet.

```bash
sudo systemctl daemon-reload
sudo systemctl enable gunicorn
sudo systemctl start gunicorn
sudo systemctl status gunicorn
```

### 7. Configurer Nginx

```bash
sudo cp /root/projet/backend/nginx.conf /etc/nginx/sites-available/your-app
sudo ln -s /etc/nginx/sites-available/your-app /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

---

## Déployer avec Docker

### 1. Vérifier Docker est installé

```bash
docker --version
docker-compose --version
```

### 2. Lancer avec Docker Compose

```bash
cd backend
docker-compose up -d
```

### 3. Exécuter les migrations

```bash
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py createsuperuser
```

### 4. Arrêter

```bash
docker-compose down
```

---

## Dépannage rapide

### Erreur: "ModuleNotFoundError: No module named 'decouple'"

```bash
pip install python-decouple
```

### Erreur: "psycopg2" not found

```bash
pip install psycopg2-binary
```

### Erreur 500

```bash
# Vérifier les logs
heroku logs --tail
# ou
tail -f /var/log/nginx/error.log
```

### Application lente

- Ajouter plus de workers: `--workers 8`
- Utiliser un CDN pour les statiques
- Mettre en cache la base de données (Redis)

---

## Commandes utiles

```bash
# Vérifier la version Django
python manage.py --version

# Shell Django
python manage.py shell

# Créer un superuser
python manage.py createsuperuser

# Changer le mot de passe d'un user
python manage.py changepassword username

# Exécuter les tests
python manage.py test

# Vider le cache
python manage.py clear_cache

# Backup de la base de données
pg_dump database_name > backup.sql

# Restaurer une base de données
psql database_name < backup.sql
```

---

**Besoin d'aide ?** Consultez [DEPLOYMENT.md](DEPLOYMENT.md) pour plus de détails.
