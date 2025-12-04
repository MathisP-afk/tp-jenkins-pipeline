pipeline {
    agent { label 'linux' } 

    stages {
        stage('Nettoyage Workspace') {
            steps {
                // On s'assure de travailler proprement
                cleanWs()
            }
        }
        stage('Récupération Code') {
            steps {
                // Jenkins le fait auto avec "Pipeline from SCM", 
                // mais on s'assure d'avoir la dernière version
                checkout scm
            }
        }
        stage('Lancement Script TP') {
            steps {
                // C'est ICI que la magie du TP opère
                // Le script va construire l'image et lancer le conteneur
                sh 'chmod +x sample-app.sh'
                sh 'bash ./sample-app.sh'
            }
        }
        stage('Vérification (Test)') {
            steps {
                // On attend que le conteneur démarre
                sleep 5
                script {
                    // On teste si l'app répond sur le port 5050
                    sh 'curl -v http://localhost:5050'
                }
            }
        }
    }
}pipeline {
    agent { label 'linux' } 

    stages {
        stage('Nettoyage Workspace') {
            steps {
                // On s'assure de travailler proprement
                cleanWs()
            }
        }
        stage('Récupération Code') {
            steps {
                // Jenkins le fait auto avec "Pipeline from SCM", 
                // mais on s'assure d'avoir la dernière version
                checkout scm
            }
        }
        stage('Lancement Script TP') {
            steps {
                // C'est ICI que la magie du TP opère
                // Le script va construire l'image et lancer le conteneur
                sh 'chmod +x sample-app.sh'
                sh 'bash ./sample-app.sh'
            }
        }
        stage('Vérification (Test)') {
            steps {
                // On attend que le conteneur démarre
                sleep 5
                script {
                    // On teste si l'app répond sur le port 5050
                    sh 'curl -v http://localhost:5050'
                }
            }
        }
    }
}
