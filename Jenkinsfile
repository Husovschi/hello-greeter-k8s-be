pipeline {
    agent {
        label 'kubernetes-docker-agent'
    }

    stages {
        stage('Create kube config file') {
            steps {
                withCredentials([vaultString(credentialsId: 'vault-kube-base64-config', variable: 'KUBECONFIG')]) {
                    writeFile file: 'config', text: "$KUBECONFIG"
                }
                sh 'base64 -d -i config -o config && chmod 400 config'
            }
        }

        stage('Run command') {
            steps {
                sh 'helm install --kubeconfig config hello-greeter-k8s-be-release hello-greeter-k8s-be/'
            }
        }
    }
}
