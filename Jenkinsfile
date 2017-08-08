pipeline {
  agent {
    node {
      label 'macos'
    }
    
  }
  stages {
    stage('Unit tests') {
      steps {
        sh 'echo "Hello world"'
      }
    }
    stage('Build project') {
      steps {
        sh 'xcodebuild build -project CoreDataSampleApp.xcodeproj -scheme CoreDataSampleApp -destination \'platform=iOS Simulator,name=iPhone 7,OS=10.3.1\''
      }
    }
  }
}