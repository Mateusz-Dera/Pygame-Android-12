. .venv/bin/activate
NAME=$(echo -e $(cat ./buildozer.spec| grep "package.name" | cut -d'=' -f 2) | sed 's/^[ \t]*//;s/[ \t]*$//')
PLATFORM=$(echo -e $(cat ./buildozer.spec| grep "android.arch" | cut -d'=' -f 2) | sed 's/^[ \t]*//;s/[ \t]*$//')
DIR=".buildozer/android/platform/build-${PLATFORM}/dists/${NAME}__${PLATFORM}/templates"
[ ! -d $DIR ] && echo "Project name has been changed. Generating new files..." && buildozer android debug
cp AndroidManifest.tmpl.xml $DIR
buildozer android debug deploy run