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
    /**
     * when 为 false 的时候，其后面的 steps 不执行
     **/

    stage('test when'){
      when{
        branch 'master'
      }
      steps{
        echo 'test when build'
      }
    }
  
    stage('after when'){
      steps{
        echp 'after when build'
      }
    }
   
  }
}