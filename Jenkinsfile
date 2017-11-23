pipeline {
  agent any

  parameters {
    string(name: 'BUILD_USER', defaultValue: 'labelnet@smartahc.com', description: 'e-mail')
  }

  stages {
    
    // build
    stage('build') {
      steps {
        echo 'build'
        // 直接执行脚本
        //sh 'chmod 777 ./shell/build.sh'
        //sh './shell/build.sh'
        // 直接执行命令行
        // sh 'javac ./src/Main.java'
        // sh 'cp ./src/Main.class ~/java'
        // sh 'rm ./src/Main.class'
        echo 'build finish'
      }

      post {
         always {
            echo '2017One way or another, I have finished'
        }
        success {
            echo '2017I succeeeded!'
        }
        unstable {
          script{
                mail  to: "${params.BUILD_USER}",
                 subject: "unstable pipeline: ${currentBuild.fullDisplayName}",
                    body: "构建不稳定: ${env.BUILD_URL}"
            }
            echo '2017I am unstable :/'
        }
        failure {
            echo '2017I failed :('
            script{
                mail  to: "${params.BUILD_USER}",
                 subject: "failed pipeline: ${currentBuild.fullDisplayName}",
                    body: "构建失败: ${env.BUILD_URL}"
            }
        }
        changed {
            echo '2017Things were different before...'
        }
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
  }// end stages

  post {
        always {
            echo 'One way or another, I have finished'
        }
        success {
            echo 'I succeeeded!'
            script{
                File file = new File('./shell/mail.html')
                def bodyText = file.text.toString()
                mail  to: "${params.BUILD_USER}",
                 subject: "pipeline success: ${currentBuild.fullDisplayName}",
                    body: bodyText
            }
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
    }
}