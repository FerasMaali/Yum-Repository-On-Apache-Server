pipeline {
	agent {
		label 'master'
	}

	triggers {
		cron('H/3 * * * *')
	}

	stages {
		stage('Initializing repo & server') {
			failFast true
			steps {
				parallel {
					stage ('Initializing server') {
						dir('server') {
							sh './start_server'
						}
					}
					
					stage  ('Populating repo') {
						sh './create_repo'
					}
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
	}
}
