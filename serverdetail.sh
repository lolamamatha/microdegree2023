pipeline{
    agent any

        stages{
             stage( 'build-system details'){
               steps{
                   sh '''
                    echo '"ip adress"'
                    hostname -I
                      '''
                 }
             } 
             stage('build-memory details'){
                 steps{
                     sh '''
		     echo "MEMORY DETAILS"
                     du -sch *
                     '''                
                }
            }
            stage('build-cpu details'){
                steps{
                    sh '''
                    echo "cpu deatils"
                    lscpu
                    '''                  
                }
            }
            stage('build-disk details'){
                steps{
                   sh '''
                   echo "today date"
                   date
                   '''
                        
                }
            }
            stage('build-process command'){
                 steps{
                    sh '''
                    echo "process command"
                    ps -ef | head
                    '''
            
                }
            }     

         
        }  
}
