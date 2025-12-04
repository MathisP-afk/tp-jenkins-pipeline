pipeline {
    // On cible ton worker Linux
    agent { label 'linux' } 

    stages {
        stage('Build & Install') {
            steps {
                echo '--- Récupération du code depuis GitHub ---'
                sh 'echo "Je suis le Worker : $(hostname)"'
                sh 'echo "Démarrage du build..."'
            }
        }
        stage('Tests Unitaires') {
            steps {
                echo '--- Exécution des tests ---'
                script {
                    def date = sh(returnStdout: true, script: 'date').trim()
                    echo "Test lancé le : ${date}"
                    if (date.contains('2025')) {
                        echo "Succès : Année 2025 validée."
                    } else {
                        error "Erreur : Mauvaise année."
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo '--- Déploiement ---'
                sh 'echo "Déploiement fictif terminé avec succès !"'
            }
        }
    }
}
