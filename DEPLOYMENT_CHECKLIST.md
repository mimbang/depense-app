# ✅ Checklist de Déploiement en Production

## Configuration du Backend Django

### Sécurité
- [ ] `DEBUG = False` configuré
- [ ] `SECRET_KEY` défini dans les variables d'environnement
- [ ] `ALLOWED_HOSTS` configurés correctement
- [ ] `CORS_ALLOWED_ORIGINS` limités aux domaines autorisés uniquement
- [ ] HTTPS/SSL activé en production
- [ ] `SECURE_SSL_REDIRECT = True` (si HTTPS disponible)
- [ ] `SESSION_COOKIE_SECURE = True`
- [ ] `CSRF_COOKIE_SECURE = True`

### Base de données
- [ ] PostgreSQL (ou autre base de données appropriée) en place
- [ ] `DATABASE_URL` correctement configurée
- [ ] Sauvegardes de base de données configurées
- [ ] Migrations exécutées: `python manage.py migrate`

### Fichiers statiques
- [ ] WhiteNoise installé et configuré
- [ ] Fichiers statiques collectés: `python manage.py collectstatic`
- [ ] `STATIC_ROOT` et `STATIC_URL` correctement configurés
- [ ] Serveur web (nginx/Apache) configure pour servir les statiques

### Dépendances
- [ ] `requirements.txt` à jour
- [ ] Toutes les dépendances production listées
- [ ] Pas de dépendances de développement en production

### Journalisation et Monitoring
- [ ] Logging configuré
- [ ] Email configuré pour les notifications d'erreur
- [ ] Monitoring mis en place (Sentry, DataDog, etc.)
- [ ] Alertes configurées

## Frontend (React Native Expo)

### Configuration
- [ ] Variables d'environnement correctes (`EXPO_PUBLIC_API_URL`, etc.)
- [ ] API_URL pointe vers le bon domaine en production
- [ ] Certificat SSL valide si nécessaire

### Build
- [ ] Build testé localement: `expo build:ios` / `expo build:android`
- [ ] Version bump appliquée (dans `app.json`)
- [ ] APK/IPA générés et testés
- [ ] Google Play Store / Apple App Store configurés

### Déploiement
- [ ] Expo token configuré
- [ ] Publication OTA possible: `expo publish`
- [ ] Rollback plan défini

## Serveur/Infrastructure

### Préparation
- [ ] Serveur provisionné (Heroku, DigitalOcean, AWS, etc.)
- [ ] Domaine configuré et DNS pointe vers le serveur
- [ ] Certificat SSL/TLS installé (Let's Encrypt recommandé)
- [ ] Firewall configuré (ports 80, 443 ouverts)

### Déploiement
- [ ] Code poussé vers le serveur (via Git, Docker, etc.)
- [ ] Environnement virtuel créé/activé
- [ ] Dépendances installées
- [ ] Base de données initialisée
- [ ] Migrations exécutées
- [ ] Fichiers statiques collectés
- [ ] Application peut être démarrée sans erreurs

### Serveur Web
- [ ] Nginx/Apache configuré
- [ ] SSL/TLS configuré
- [ ] Proxies configures pour gunicorn
- [ ] CORS headers configurés si nécessaire
- [ ] Compression gzip activée

### Performance
- [ ] Caching configuré (Redis, Memcached)
- [ ] CDN configuré pour les assets statiques (CloudFront, Cloudflare)
- [ ] Compression des réponses activée
- [ ] Minification des assets frontend effectuée

## Monitoring et Maintenance

### Logs
- [ ] Logs d'application accessibles
- [ ] Logs d'erreur concentrés (Sentry, LogRocket, etc.)
- [ ] Rotation des logs configurée

### Backups
- [ ] Sauvegardes de base de données automatiques
- [ ] Sauvegardes d'uploads/media automatiques
- [ ] Historique de backups conservé
- [ ] Procédure de restauration testée

### Monitoring
- [ ] Uptime monitoring configuré (Ping, New Relic, etc.)
- [ ] Performance monitoring en place
- [ ] Alertes configurées pour les problèmes critiques
- [ ] Dashboard de monitoring accessible

### Maintenance
- [ ] Plan de mise à jour défini
- [ ] Procédure de mise à jour documentée
- [ ] Rollback procedure définie
- [ ] Maintenance scheduled (jour/heure)

## Communication

- [ ] Status page disponible
- [ ] Email de support configuré
- [ ] Plan d'escalade défini
- [ ] Utilisateurs notifiés des maintenances planifiées

## Test Final

- [ ] Application accessible via le domaine production
- [ ] Tous les endpoints API testés
- [ ] Authentification fonctionne
- [ ] Fichiers statiques servis correctement
- [ ] Images/uploads fonctionnent
- [ ] Redirects HTTP vers HTTPS fonctionnent
- [ ] CORS headers présents et corrects
- [ ] Pas d'erreurs 500 en logs
- [ ] Performance acceptable (< 1s pour les requêtes simples)
- [ ] Application mobile se connecte correctement à l'API

## Post-Déploiement

- [ ] Documentation mise à jour
- [ ] Équipe informée du déploiement
- [ ] Monitoring actif pendant les premières heures
- [ ] Réserve de correction rapide disponible
- [ ] Retours collectés auprès des utilisateurs

---

**Date de déploiement:** _______________
**Version déployée:** _______________
**Responsable:** _______________
**Notes:** 
