# 📂 Structure du Projet - Détails

## Overview de la structure

```
projet_power/
│
├── 📁 backend/                          # API REST Django
│   ├── 📁 api/                          # Application Django principale
│   │   ├── __init__.py
│   │   ├── admin.py                     # Configuration du panel admin
│   │   ├── apps.py                      # Configuration de l'app
│   │   ├── models.py                    # ⭐ Modèles de données
│   │   ├── serializers.py               # ⭐ Sérialiseurs DRF
│   │   ├── views.py                     # ⭐ Vues/ViewSets API
│   │   ├── url.py                       # Routes de l'app API
│   │   ├── test.rest                    # Tests REST (VS Code)
│   │   ├── tests.py                     # Tests unitaires
│   │   └── migrations/                  # Migrations de base de données
│   │       ├── __init__.py
│   │       └── 0001_initial.py
│   │
│   ├── 📁 backend/                      # Configuration Django
│   │   ├── __init__.py
│   │   ├── settings.py                  # ⭐ Configuration Django (MODIFIÉ)
│   │   ├── urls.py                      # Routes racine
│   │   ├── wsgi.py                      # WSGI pour production
│   │   ├── asgi.py                      # ASGI pour async
│   │   └── __pycache__/                 # Cache Python
│   │
│   ├── 📁 env/                          # Environnement virtuel
│   │   ├── pyvenv.cfg
│   │   ├── Include/
│   │   ├── Lib/
│   │   │   └── site-packages/           # Paquets installés
│   │   └── Scripts/ (ou bin/)            # Exécutables
│   │
│   ├── 📄 manage.py                     # Script de gestion Django
│   ├── 📄 db.sqlite3                    # Base de données (dev)
│   │
│   ├── 📄 requirements.txt               # ✅ Dépendances (MODIFIÉ)
│   ├── 📄 .env.example                  # ✅ Template de config (NOUVEAU)
│   │
│   ├── 🐳 Dockerfile                    # ✅ Configuration Docker (MODIFIÉ)
│   ├── 📄 docker-compose.yml            # ✅ Docker Compose (MODIFIÉ)
│   ├── 📄 Procfile                      # Configuration Heroku
│   │
│   ├── 🌐 nginx.conf                    # ✅ Config Nginx (MODIFIÉ)
│   ├── 📄 gunicorn.service              # ✅ Service Systemd (MODIFIÉ)
│   │
│   ├── 🚀 setup.sh                      # ✅ Setup script (NOUVEAU)
│   ├── 🚀 setup.bat                     # ✅ Setup script Windows (NOUVEAU)
│   ├── 🚀 deploy.sh                     # ✅ Deploy script (NOUVEAU)
│   ├── 🚀 deploy.bat                    # ✅ Deploy script Windows (NOUVEAU)
│   │
│   ├── 📖 DEPLOYMENT.md                 # ✅ Guide déploiement (NOUVEAU)
│   └── 📖 QUICK_DEPLOY.md               # ✅ Guide rapide (NOUVEAU)
│
├── 📁 frontend/                         # Applications mobiles
│   │
│   ├── 📁 app/                          # App principale (Expo)
│   │   ├── 📁 app/                      # Screens et routing
│   │   │   ├── _layout.tsx              # Navigation principale
│   │   │   ├── modal.tsx                # Modal screens
│   │   │   └── (tabs)/                  # Grouped routes
│   │   │       ├── index.tsx
│   │   │       ├── explore.tsx
│   │   │       └── ...
│   │   │
│   │   ├── 📁 assets/
│   │   │   └── images/                  # Images statiques
│   │   │
│   │   ├── 📁 components/
│   │   │   ├── Transaction.tsx          # Composants réutilisables
│   │   │   ├── ProgressionBar/
│   │   │   ├── ui/                      # Composants UI
│   │   │   └── ...
│   │   │
│   │   ├── 📁 constants/
│   │   │   ├── style.tsx                # Styles constants
│   │   │   └── theme.ts                 # Thème et couleurs
│   │   │
│   │   ├── 📁 hooks/                    # Custom hooks
│   │   │   ├── use-color-scheme.ts
│   │   │   ├── use-color-scheme.web.ts
│   │   │   └── use-theme-color.ts
│   │   │
│   │   ├── 📁 scripts/
│   │   │   └── reset-project.js         # Script utilitaire
│   │   │
│   │   ├── 📄 api.js                    # ⭐ Configuration Axios (IMPORTANT)
│   │   ├── 📄 app.json                  # Config Expo
│   │   ├── 📄 tsconfig.json             # Config TypeScript
│   │   ├── 📄 eslint.config.js          # Config ESLint
│   │   ├── 📄 package.json              # Dépendances npm
│   │   ├── 📄 expo-env.d.ts             # Types Expo
│   │   ├── 📄 fake.js                   # Données fake (mock)
│   │   └── 📖 README.md                 # Doc de l'app
│   │
│   └── 📁 DepensiesApp/                 # App secondaire (optionel)
│       └── (même structure que app/)
│
├── 📖 README.md                         # ✅ Doc générale (MODIFIÉ)
├── 📖 CONFIGURATION_SUMMARY.md          # ✅ Résumé des changements (NOUVEAU)
├── 📖 DEPLOYMENT_CHECKLIST.md           # ✅ Checklist déploiement (NOUVEAU)
└── 📖 USEFUL_COMMANDS.md                # ✅ Commandes utiles (NOUVEAU)
```

## 🔑 Fichiers clés et leur rôle

### Backend

| Fichier | Role | Notes |
|---------|------|-------|
| `settings.py` | Configuration Django | ⭐ CONFIGURÉ POUR PRODUCTION |
| `requirements.txt` | Dépendances Python | ✅ Whitenoise et decouple ajoutés |
| `.env.example` | Template de config | ⭐ NOUVEAU - Copier en `.env` |
| `Dockerfile` | Image Docker | Pour containerisation |
| `docker-compose.yml` | Orchestration services | DB + Web + Nginx |
| `manage.py` | CLI Django | Migrations, runserver, etc. |

### Frontend

| Fichier | Role | Notes |
|---------|------|-------|
| `app.json` | Config Expo | Nom, version, icon, etc. |
| `api.js` | API Client | ⭐ IMPORTANT - Définir l'URL API |
| `package.json` | Dépendances npm | React Native, Expo |
| `_layout.tsx` | Navigation racine | Structure de navigation |
| `(tabs)/` | Bottom tab navigation | Screens principaux |

### Documentation

| Fichier | Contenu | Consulter si... |
|---------|---------|-----------------|
| `README.md` | Vue d'ensemble | Premier démarrage |
| `DEPLOYMENT.md` | Guide complet | Déployer en production |
| `QUICK_DEPLOY.md` | Guide rapide | Besoin de déployer vite |
| `DEPLOYMENT_CHECKLIST.md` | Checklist | Avant de déployer |
| `USEFUL_COMMANDS.md` | Commandes utiles | Besoin de référence |
| `CONFIGURATION_SUMMARY.md` | Modifications appliquées | Voir les changements |

## 📊 Hiérarchie des configurations

```
.env (production values)
    ↓
settings.py (uses decouple to read)
    ↓
Django app (uses settings)
```

## 🔄 Flux de données

```
Frontend (React Native)
    ↓ (API calls via axios)
Backend API (Django REST)
    ↓ (queries/updates)
Database (PostgreSQL/SQLite)
```

## 🎯 Chemins importants à retenir

### Backend
- `backend/backend/settings.py` - Configuration principale
- `backend/api/models.py` - Modèles de données
- `backend/api/views.py` - Endpoints API
- `backend/api/serializers.py` - Transformations données

### Frontend
- `frontend/app/api.js` - Configuration API/axios
- `frontend/app/app/_layout.tsx` - Navigation
- `frontend/app/app/(tabs)/` - Screens principaux
- `frontend/app/components/` - Composants réutilisables

## 📦 Installations apportées

### Backend
```
whitenoise==6.7.0         # Static files in production
python-decouple==3.8      # Environment variables
```

### Frontend
```
# Déjà installé - voir package.json
# Aucun changement nécessaire
```

## 🚀 Fichiers de déploiement créés

```
backend/
├── .env.example              # Variables template
├── setup.sh                  # Setup Linux/macOS
├── setup.bat                 # Setup Windows
├── deploy.sh                 # Deploy Linux/macOS
├── deploy.bat                # Deploy Windows
├── Dockerfile                # Docker image
├── docker-compose.yml        # Docker services
├── gunicorn.service          # Systemd service
├── nginx.conf                # Reverse proxy
├── DEPLOYMENT.md             # Full guide
└── QUICK_DEPLOY.md           # Quick guide
```

## 🔐 Variables d'environnement à définir

```bash
# Dans backend/.env
SECRET_KEY=your-secret-key-here
DEBUG=False
DATABASE_URL=postgresql://user:password@host:5432/dbname
ALLOWED_HOSTS=yourdomain.com,www.yourdomain.com
CORS_ALLOWED_ORIGINS=https://yourdomain.com
SECURE_SSL_REDIRECT=True
```

## 🎓 Structure de développement recommandée

```
Dossier de travail
│
├── Terminal 1: Backend
│   $ cd backend
│   $ source env/bin/activate
│   $ python manage.py runserver
│
├── Terminal 2: Frontend
│   $ cd frontend/app
│   $ npm start
│
└── Terminal 3: Git/Commits
    $ git status
    $ git add ...
    $ git commit ...
```

## ✨ Bonnes pratiques

✅ Toujours utiliser `.env` pour les variables sensibles
✅ Ne pas commiter `.env` (utiliser `.env.example`)
✅ Exécuter les migrations avant de déployer
✅ Tester localement avant de déployer
✅ Utiliser Docker pour la parité dev/prod
✅ Garder les secrets secrets!

## 🐛 Troubleshooting paths

```
Si l'app ne démarre pas:
  → Vérifier backend/backend/settings.py
  → Vérifier .env file
  → Vérifier migrations: python manage.py migrate

Si les API calls échouent:
  → Vérifier backend is running: http://localhost:8000/api/
  → Vérifier frontend/app/api.js pour l'URL
  → Vérifier CORS_ALLOWED_ORIGINS dans settings.py
  → Vérifier les logs du backend

Si les fichiers statiques manquent:
  → Exécuter: python manage.py collectstatic
  → Vérifier STATIC_ROOT dans settings.py
  → Vérifier nginx.conf pour le chemin static
```

---

**Toute la configuration est prête pour la production! 🚀**
