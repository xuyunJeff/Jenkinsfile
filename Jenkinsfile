pipeline {
    agent any
    parameters {
        // string(name:'multi_project_names', defaultValue: 'sinhic-common-pom,sinhic-common-lib', description: '多个项目之间用逗号隔开')
//             string(name:'group_id', defaultValue: 'enter your group_id', description: '项目groupId')
//             string(name:'maven_name', defaultValue: 'maven3.5.4', description: '全局工具配置maven的名称')
//     		string(name:'registry_url', defaultValue: '10.101.43.196:5000', description: '镜像仓库地址')
//     		string(name:'port', defaultValue: '8761', description: '部署镜像端口')
        string(name: 'branch', defaultValue: 'main', description: '请输入要打包的分支')
    }
    // 注册工具
    tools {
        maven "maven3.8.4"
    }
    stages {
        stage("maven check") {
            steps {
                echo "commend: mvn -v"
                sh 'mvn -v'
            }
        }
        stage("checkout branches") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: "$branch"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'xuyunJeff', url: 'https://github.com/xuyunJeff/Jenkinsfile.git']]])
            }
        }

        stage("maven package") {
            steps {
                echo "commend: mvn clean package"
                sh 'mvn clean package -DskipTests'
            }
        }

        stage("maven deploy") {
            steps {
                timeout(time: 48, unit: 'HOURS') {
                    input 'Do you want to proceed to the Deployment?'
                }
                echo "commend: mvn clean deploy"
                sh 'mvn clean deploy -DskipTests'
            }
        }

    }
}