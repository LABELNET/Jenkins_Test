pipeline {
  agent any
  stages {
    
    // build
    stage('build') {
      steps {
        echo 'build'
        sh 'cd ~/java'
        sh 'mkdir testJenkins'
        sh 'cd testJenkins'
        sh 'git clone https://github.com/LABELNET/Jenkins_Test.git'
        sh 'cd Jenkins_Test/src'
        sh 'javac Main.java'
        sh 'cp Main.class ~/java/testJenkins/'
        sh 'rm Main.class'
      }
    }
    
    // end
    stage('end'){
      steps{
        echo 'end build'
      }
    }

    // test when
    /**
     * when 为 false 的时候，其后面的 steps 不执行
     **/

    stage('test when'){
      when{
        branch 'dev'
      }
      steps{
        echo 'test when build'
      }
    }
  
    stage('after when'){
      steps{
        echo 'after when build'

        script{
          def name = 'test script'
          echo 'this is step name :${name}'
          if(env.BRANCH_NAME=='master'){
            echo 'brance name master'
          }else{
            echo 'brance name not master'
          }
        }//end script
      }//end step
    }//end stage
   
  }
}