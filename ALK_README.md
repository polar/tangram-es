ALK Build Tangram-es
===================

This directory contains the makings for the ALKMaps version of the 
Tangram-es C++/Java Android AAR library. It must be installed into the 
local Maven Repository which is usually ~/.m2/repository. However, for 
future purposes we may want that to be in a build space so that clients 
can download it with Maven plugins.

Prerequisites:

If running by scripts, you need to set the ANDROID_HOME environment 
variable to the location of the Android SDK.

export ANDROID_HOME=$HOME/Android/Sdk

Or you need to set "local.properties" to:

ndk.dir=/path/to/Android/Sdk/ndk-bundle
sdk.dir=/path/to/Android/Sdk

Note: Do not check "local.properties" into SCM.

To build the library and install it into the Maven Local repository, 
perform the following commands:

cd tangram/platforms/android
./gradlew tangram:install

The gradle "maven" plugin used in the tangram/publishing.gradle adds
the "install" target to tangram's gradle scripts. That target 
installs the Aar and related POMS into the mavenLocal repository. 

At some point, we may descide to publish to a Remote Maven Repository.
You may need to set up your own Maven Local Repository. The default
depends on the $USER, You mileage may vary, but the repository usually
points to $HOME/.m2/repository.

Commits
=======

In order to maintain parity with https://github.com/tangrams/tangram-es we
must maintain the .git directory in subversion. To do this please issue
git commits for changes.

     git commit -am "reason for commit"

This commit has a "post-commit" hook associated with it, that will add the
.git/objects/* to the subversion commit. Look at .git/hooks/post-commit.

It will most likely, as subversion likes to do, complain about things that
are already commited, an you can safely ignore the svn ERRORS.

$ git commit -am "Updated ALK Readme"
svn: E200009: Could not add all targets because some targets are already versioned
svn: E200009: Illegal target for the requested operation
[alkmaps 4f58c6d] Updated ALK Readme
 Date: Thu Jul 12 16:24:02 2018 -0400
 1 file changed, 20 insertions(+), 8 deletions(-)

and then you may proceed with your "svn commit".


