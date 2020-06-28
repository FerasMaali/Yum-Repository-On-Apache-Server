pipeline {
	agent {
		label 'master'
	}

	stages {
		stage('Initializing repo & server') {
			failFast true
			parallel {
				stage ('Initializing server') {
					steps {
						dir('server') {
							sh './start_server'
						}
					}
				}

				stage  ('Populating repo') {
					steps {
						sh './create_repo'
					}
				}
				
				stage('Creating client') {
					steps {
						dir('client') {
							sh './create_client'
						}
					}
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
