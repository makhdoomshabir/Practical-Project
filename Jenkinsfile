pipeline{
        agent any
        stages{            
            stage ('test ssh') {
                steps{
                   sshagent(credentials : ['$PEM_KEY']) {
                       sh 'ssh -o StrictHostKeyChecking=no -i $PEM_KEY ec2-54-75-81-173.eu-west-1.compute.amazonaws.com uptime'
                   }
                }
        }    
                
            stage('deploy'){
                steps{
                    script{
                        withCredentials([
                                file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY'),
                               // string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'),
                                string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'),
                                string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
                                string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY')
                        ]){
                            echo "DATABASE IS $DATABASE_URI, SECRET KEY IS $SECRET_KEY'" 
                            sh '''
                            chmod 400 $PEM_KEY
                            ssh -tt -o "StrictHostKeyChecking=no" -i $PEM_KEY ec2-54-75-81-173.eu-west-1.compute.amazonaws.com << EOF 
                            rm -rf Practical-Project/
                            git clone -b development https://github.com/makhdoomshabir/Practical-Project.git
                            cd Practical-Project
                            export SECRET_KEY=$SECRET_KEY TEST_DATABASE_URI=$TEST_DATABASE_URI DATABASE_URI=$DATABASE_URI
                            sudo -E SECRET_KEY=$SECRET_KEY TEST_DATABASE_URI=$TEST_DATABASE_URI DATABASE_URI=$DATABASE_URI docker-compose up -d
                            '''
                        }

                    }
                }
            }
            stage('pytest coverage report'){
                steps{
                    sh '''
                    docker exec -it backend bash
                    pytest --cov application >> Pytest-coverage-report
                    exit
                    EOF
                    '''
                }
            }
                
        }    
}
