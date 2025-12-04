#!/bin/bash

# --- 1. Configuration de l'identité Git du Robot Jenkins ---
git config --global user.email "jenkins-robot@exemple.com"
git config --global user.name "Jenkins Worker"

# --- 2. Création et Bascule sur la Branche de Test ---
# On checkout une nouvelle branche 'BrancheDeTest' (ou on la reset si elle existe)
git checkout -B BrancheDeTest

# --- 3. Modification du Code (Le fameux fond ROSE) ---
mkdir -p static
echo "body {background: pink;}" > static/style.css

# --- 4. Commit de la modification ---
git add static/style.css
git commit -m "Passage en Rose (Automatisé par Jenkins)" || echo "Rien à commiter"

# --- 5. Push de la branche de test vers GitHub ---
# C'est ici qu'on a besoin du Token pour avoir le droit d'écrire
# REMPLACE CI-DESSOUS PAR TON TOKEN ET TON URL !
MY_REPO_URL="https://<TON_TOKEN_ICI>@github.com/MathisP-afk/tp-jenkins-pipeline.git"

git remote set-url origin $MY_REPO_URL
git push -u origin BrancheDeTest --force

# --- 6. Construction et Lancement Docker (Port 5050) ---
echo "FROM python" > Dockerfile
echo "RUN pip install flask" >> Dockerfile
echo "COPY . /home/myapp/" >> Dockerfile
echo "EXPOSE 5050" >> Dockerfile
echo "CMD python3 /home/myapp/sample_app.py" >> Dockerfile

docker build -t sampleapp .

# Nettoyage propre
docker stop samplerunning || true
docker rm samplerunning || true

# Lancement
docker run -d -p 5050:5050 --name samplerunning sampleapp

# --- 7. Test et Fusion Automatique ---
echo "Attente du démarrage (10s)..."
sleep 10

# On teste si la page répond (Grep cherche le texte, peu importe l'IP)
if curl http://localhost:5050 | grep "You are calling me"; then
    echo "✅ TEST OK : L'application répond !"
    
    # FUSION (Merge) vers MAIN
    echo "Début de la fusion automatique..."
    git checkout main
    git pull origin main
    git merge BrancheDeTest
    
    # Envoi de la fusion sur GitHub
    git push origin main
    echo "🎉 SUCCÈS : Fusion terminée et code mis à jour sur GitHub !"
    exit 0
else
    echo "❌ ÉCHEC : L'application ne répond pas correctement."
    exit 1
fi
