TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

### TS ###
# Run 'lupdate vision.pro -ts main.ts' to get a ts file.

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

ANDROID_ABIS = arm64-v8a x86 x86_64

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/drawable-hdpi/ic_launcher_vision.png \
    android/res/drawable-ldpi/ic_launcher_vision.png \
    android/res/drawable-mdpi/ic_launcher_vision.png \
    android/res/values/strings.xml \
    android/res/values/libs.xml
