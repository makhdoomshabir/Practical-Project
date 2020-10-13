pipeline{
        agent any
        stages{  
            stage('deploys'){
                steps{
                    script{
                        withCredentials([
                                file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY'),
                                string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'),
                                string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
                                string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY')
                        ]){
                            sh '''
                            ssh -tt -o "StrictHostKeyChecking=no" -i $PEM_KEY ubuntu@ec2-54-75-81-173.eu-west-1.compute.amazonaws.com << EOF 
                            rm -rf Practical-Project/
                            git clone https://github.com/makhdoomshabir/Practical-Project.git
                            cd Practical-Project
                            export SECRET_KEY=$SECRET_KEY TEST_DATABASE_URI=$TEST_DATABASE_URI DATABASE_URI=$DATABASE_URI
                            sudo -E SECRET_KEY=$SECRET_KEY TEST_DATABASE_URI=$TEST_DATABASE_URI DATABASE_URI=$DATABASE_URI docker-compose up -d
                            docker exec backend pytest --cov application >> Pytest-coverage-report.txt
                            exit
                            EOF
                            '''
                        }

                    }
                }
            }

                
        }    
}
