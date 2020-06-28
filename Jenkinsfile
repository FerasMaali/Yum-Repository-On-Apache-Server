pipeline {
	agent {
		label 'master'
	}

	stages {
		stage ('Initializing server') {
			steps {
				dir('server') {
					sh './start_server'
				}
			}
		}

		stage('Creating client') {
			steps {
				dir('client') {
					sh './create_client'
				}
			}
		}

		stage('Testing client') {
			steps {
				dir('client') {
					sh './test_client'
				}
			}
		}

		stage('Pushing server') {
			steps {
				withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'HUB_USER', passwordVariable: 'HUB_TOKEN')]) {                      
					sh '''
						docker login -u $HUB_USER -p $HUB_TOKEN 
						docker push ferasmaali/apache_yum_repo
					'''
				}
			}
		}
	}
}
