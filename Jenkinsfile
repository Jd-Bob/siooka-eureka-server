node {
    checkout scm

    stage("Clone") {
        git branch: 'master', url: 'https://github.com/Jd-Bob/siooka-eureka-server.git'
    }

    stage("Build") {
        stage("java package") {
            sh "./mvnw clean install"
        }
        stage("java package") {
            sh "docker stop eureka-server"
            sh "docker rmi eureka-server"
        }
        stage("docker image") {
            def customImage = docker.build("eureka-server", ".")
        }
    }

    stage("Continue Integration") {
        stage("Runing unit tests") {
            sh "./mvnw test -Punit"
        }
    }

    stage("Continue Deployment") {
        options {
            timeout(time: 10, unit: "SECONDS")
        }

        stage("Deployment") {
            sh "docker run -p 8761:8761 eureka-server"
        }
    }
}
