pipeline {
    agent { label 'linux' } 

    stages {
        stage('Nettoyage Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Récupération Code') {
            steps {
                checkout scm
            }
        }
        stage('Lancement Script TP') {
            steps {
                // On rend le script exécutable et on le lance
                sh 'chmod +x sample-app.sh'
                sh 'bash ./sample-app.sh'
            }
        }
        stage('Vérification (Test)') {
            steps {
                sleep 5
                script {
                    // Test de l'application sur le port 5050
                    sh 'curl -v http://localhost:5050'
                }
            }
        }
    }
}
