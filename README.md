# 🚀 Projet Power - Django + React Native Expo

Application complète avec backend Django REST Framework et frontend React Native avec Expo.

## 📋 Table des matières

- [Installation](#installation)
- [Démarrage du développement](#démarrage-du-développement)
- [Déploiement en production](#déploiement-en-production)
- [Structure du projet](#structure-du-projet)
- [Technologies utilisées](#technologies-utilisées)

## 💻 Installation

### Prérequis

- Python 3.8+
- Node.js 16+
- Git
- PostgreSQL (optionnel, pour la production)

### Backend (Django)

```bash
cd backend
```

**Sur Linux/macOS:**
```bash
chmod +x setup.sh
./setup.sh
```

**Sur Windows:**
```bash
setup.bat
```

Ou manuellement:
```bash
python -m venv env
source env/bin/activate  # ou env\Scripts\activate sur Windows
pip install -r requirements.txt
cp .env.example .env
python manage.py migrate
python manage.py createsuperuser
python manage.py collectstatic
```

### Frontend (React Native Expo)

```bash
cd frontend/app
npm install
```

## 🚀 Démarrage du développement

### Backend

```bash
cd backend
source env/bin/activate  # ou env\Scripts\activate sur Windows
python manage.py runserver
```

L'API sera disponible sur: **http://localhost:8000/api/**
Admin Django: **http://localhost:8000/admin/**

### Frontend

```bash
cd frontend/app
npm start
```

Scannez le code QR avec Expo Go app sur votre téléphone.

#### Options:
- **Android:** `npm run android`
- **iOS:** `npm run ios`
- **Web:** `npm run web`

## 🌐 Déploiement en Production

Consultez [DEPLOYMENT.md](backend/DEPLOYMENT.md) pour des instructions détaillées.

### Checklist rapide:

1. Vérifier [DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md)
2. Configurer les variables d'environnement
3. Exécuter les migrations: `python manage.py migrate`
4. Collecter les statiques: `python manage.py collectstatic`
5. Déployer sur Heroku/DigitalOcean/AWS/etc.

## 📁 Structure du projet

```
projet/
├── backend/                      # API Django REST
│   ├── api/                      # Application principale
│   │   ├── models.py            # Modèles de données
│   │   ├── views.py             # Vues/ViewSets
│   │   ├── serializers.py       # Sérialiseurs DRF
│   │   └── url.py               # URLs de l'API
│   ├── backend/
│   │   ├── settings.py          # Configuration Django
│   │   ├── urls.py              # URLs racine
│   │   └── wsgi.py              # Application WSGI
│   ├── manage.py
│   ├── requirements.txt
│   ├── .env.example
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── DEPLOYMENT.md
│
├── frontend/                     # Applications React Native
│   ├── app/                      # Application principale Expo
│   │   ├── app/                  # Screens et navigation
│   │   ├── components/           # Composants réutilisables
│   │   ├── constants/            # Thèmes et styles
│   │   ├── hooks/                # Custom hooks
│   │   ├── api.js                # Configuration API/axios
│   │   └── package.json
│   │
│   └── DepensiesApp/             # Application secondaire
│
├── DEPLOYMENT_CHECKLIST.md
└── README.md
```

## 🛠️ Technologies utilisées

### Backend
- **Django 6.0** - Framework web Python
- **Django REST Framework** - API REST
- **PostgreSQL** - Base de données (production)
- **Gunicorn** - Serveur WSGI
- **WhiteNoise** - Serving fichiers statiques
- **Django CORS Headers** - CORS support

### Frontend
- **React Native** - Framework mobile
- **Expo** - Platform React Native
- **Expo Router** - Navigation
- **Axios** - HTTP client
- **TypeScript** - Type safety
- **React Navigation** - Navigation entre screens

## 📦 Scripts utiles

### Backend

```bash
# Appliquer les migrations
python manage.py migrate

# Créer un superuser
python manage.py createsuperuser

# Collecter les fichiers statiques
python manage.py collectstatic

# Créer les migrations
python manage.py makemigrations

# Démarrer le serveur de développement
python manage.py runserver

# Shell interactive Django
python manage.py shell

# Tests
python manage.py test
```

### Frontend

```bash
# Démarrer l'application
npm start

# Démarrer sur Android
npm run android

# Démarrer sur iOS
npm run ios

# Démarrer sur Web
npm run web

# Lint le code
npm run lint

# Réinitialiser le projet
npm run reset-project
```

## 🔐 Sécurité

- Ne commitez jamais le fichier `.env` avec les vraies clés
- Utilisez `python-decouple` pour gérer les variables d'environnement
- En production: `DEBUG=False`, certificat SSL/TLS, HTTPS activé
- CORS limité aux domaines autorisés uniquement
- Utilisez une base de données sécurisée (PostgreSQL)

## 🐛 Dépannage

### "ModuleNotFoundError: No module named 'django'"
- Activez l'environnement virtuel: `source env/bin/activate`
- Installez les dépendances: `pip install -r requirements.txt`

### "Connection refused" erreur API
- Vérifiez que le backend Django est en cours d'exécution
- Vérifiez `ALLOWED_HOSTS` et `CORS_ALLOWED_ORIGINS` dans settings.py
- Vérifiez l'URL de l'API dans le frontend (api.js)

### Port déjà utilisé
- Utilisez un autre port: `python manage.py runserver 0.0.0.0:8001`
- Ou tuez le processus: `lsof -ti:8000 | xargs kill -9` (Linux/Mac)

## 📞 Support

Pour plus d'informations:
- [Documentation Django](https://docs.djangoproject.com/)
- [Documentation Django REST Framework](https://www.django-rest-framework.org/)
- [Documentation Expo](https://docs.expo.dev/)
- [Documentation React Native](https://reactnative.dev/)

## 📄 License

Ce projet est sous license MIT.
