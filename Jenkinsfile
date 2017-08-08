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
        sh '''#archive
xcodebuild -project CoreDataSampleApp.xcodeproj -configuration Release build -archivePath CoreDataSampleApp.xcarchive' archive

#export ipa
xcodebuild -exportArchive -archivePath CoreDataSampleApp.xcarchive' '''
      }
    }
  }
}