pipeline {
    agent {
        label 'kubernetes-docker-agent'
    }

    stages {
        stage('Create kube config file') {
            steps {
                script {
                    withCredentials([vaultString(credentialsId: 'vault-kube-base64-config', variable: 'KUBECONFIGBASE64')]) {
                        sh "echo "$KUBECONFIGBASE64" | base64 -d -o config"
                    }
                    sh 'chmod 400 config'
                }
            }
        }

        stage('Run command') {
            steps {
                sh 'helm install --kubeconfig config hello-greeter-k8s-be-release hello-greeter-k8s-be/'
            }
        }
    }
}
