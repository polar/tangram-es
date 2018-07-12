ALK Build Tangram-es
===================

This directory makes the ALKMaps version of the Tangram-es C++/Java
Android AAR library. It must be installed into the local Maven Repository
which is usually ~/.m2/repository. However, for future purposes we may
want that to be in a build space so that clients can download it with 
Maven plugins.

Prerequisites:

You need to set the ANDROID_HOME environment variable to the location 
of the Android SDK.

export ANDROID_HOME=$HOME/Android/Sdk

To build perform the following commands:

cd tangram/platforms/android
./gradlew tangram:install

The gradle "maven" plugin used in the tangram/publishing.gradle adds
the "install" target to tangram's gradle scripts. That target 
installs the Aar and related POMS into the mavenLocal repository. 


