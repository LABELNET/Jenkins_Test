pipeline {
  agent any
  stages {
    
    // build
    stage('build') {
      steps {
        echo 'build'
      }
    }
    
    // end
    stage('end'){
      steps{
        echo 'end build'
      }
    }

    // test when

    stage('test when'){
      when{
        branch 'dev'
      }
      steps{
        echo 'test when build'
      }

    }
  
   
  }
}