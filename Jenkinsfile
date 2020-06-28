pipeline {
	agent {
		label 'master'
	}

	trigger {
		cron('H/2 * * * *')
	}

	stages {
		stage('Creating and starting server') {
			steps {
				dir('server') {
					sh './start_server'
				}
			}
		}

		stage('Creating and starting client') {
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

		stage('Test webhook') {
			steps{ echo 'webhook worked' }
		}
	}
}
