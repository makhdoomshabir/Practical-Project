pipeline{
        agent any
        stages{
            stage('Setup') {
                steps {
                   dir ('Practical-Project') {
                       deleteDir()
                }
            }
       }         
            stage('Git clone'){
                steps{
                    sh "git clone https://github.com/makhdoomshabir/Practical-Project.git "
                }
            }
            stage('Docker and docker-compose installation'){
                steps{
                    sh '''
                    curl https://get.docker.com | sudo bash
                    sudo usermod -aG docker $(whoami)
                    sudo apt install -y curl jq
                    version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                    sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    sudo chmod +x /usr/local/bin/docker-compose
                    '''
                }
            } 
            
            stage('deploy'){
                steps{
                    script{
                        withCredentials([
                                file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY'),
                                string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'),
                                string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'),
                                string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
                                string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY')
                        ]){
                            echo "sql_password is '$MYSQL_ROOT_PASSWORD, DATABASE IS $DATABASE_URI, SECRET KEY IS $SECRET_KEY'" 
                            sh '''
                            ssh -tt -o "StrictHostKeyChecking=no" -i $PEM_KEY DNS << EOF 
                            git clone -b development https://github.com/makhdoomshabir/Practical-Project.git
                            cd Practical-Project
                            export MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD SECRET_KEY=$SECRET_KEY TEST_DATABASE_URI=$DATABASE_URI 
                            sudo -E MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD SECRET_KEY=$SECRET_KEY TEST_DATABASE_URI=$DATABASE_URI docker-compose up -d
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
