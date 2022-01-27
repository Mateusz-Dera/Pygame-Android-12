. .venv/bin/activate
NAME=$(echo -e $(cat ./buildozer.spec| grep "package.name" | cut -d'=' -f 2) | sed 's/^[ \t]*//;s/[ \t]*$//')
PLATFORM=$(echo -e $(cat ./buildozer.spec| grep "android.arch" | cut -d'=' -f 2) | sed 's/^[ \t]*//;s/[ \t]*$//')
DIR=".buildozer/android/platform/build-${PLATFORM}/dists/${NAME}__${PLATFORM}"
#First build
[ ! -d $DIR/templates ] && echo "Project name has been changed. Generating new files..." && buildozer android debug

#Remove files
rm -R $DIR/src/main/res/drawable-*
rm -R $DIR/src/main/res/mipmap/icon.png
#Copy modifed filed
cp AndroidManifest.tmpl.xml $DIR/templates
cp build.tmpl.gradle $DIR/templates
cp -r ./icon/* $DIR/src/main/res

#Final build
buildozer android debug deploy run