#!/bin/bash
cd ~/java/
mkdir jenkins
cd jenkins
git clone https://github.com/LABELNET/Jenkins_Test.git
cd ./Jenkins_Test/src
javac Main.java
cp Main.class ~/java/jenkins/
cd ~/java/jenkins
rm -rf Jenkins_Test