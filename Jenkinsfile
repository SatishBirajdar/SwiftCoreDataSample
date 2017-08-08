pipeline {
  agent any
  stages {
    stage('Unit tests') {
      steps {
        sh 'echo "Hello world"'
      }
    }
    stage('Build project') {
      steps {
        sh '''#archive
xcodebuild -sdk iphoneos10.0 -project CoreDataSampleApp.xcodeproj -scheme CoreDataSampleApp -configuration Release build -archivePath CoreDataSampleApp.xcarchive' archive

#export ipa
xcodebuild -exportArchive -archivePath CoreDataSampleApp.xcarchive' -exportPath '.' '''
      }
    }
  }
}