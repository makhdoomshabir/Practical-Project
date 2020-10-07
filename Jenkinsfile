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
            stage('Environment'){
                environment{
                        SECRET_KEY = credentials('SECRET_KEY')
                        DATABASE_URI = credentials('DATABASE_URI')
                        MYSQL_ROOT_PASSWORD = credentials('MYSQL_ROOT_PASSWORD')
                }
                steps{
                    sh "echo 'SECRET_KEY is $SECRET_KEY, database_uri is $DATABASE_URI, mysql password is $MYSQL_ROOT_PASSWORD' "
                }
            }
                
            stage('deploy'){
                steps{
                    sh '''
                     
                    sudo -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD docker-compose up -d
                    '''
                }
            }
        }    
}
