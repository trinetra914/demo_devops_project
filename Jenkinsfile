// ... (stages above are fine) ...

        stage('Deploy to Kubernetes') {
            steps {
                // DELETE THESE TWO LINES:
                // sh 'kubectl apply -f deployment.yaml'
                // sh 'kubectl apply -f service.yaml'
                echo "Deployment handled by ArgoCD based on updated image tag."
            }
        }
    }
}
