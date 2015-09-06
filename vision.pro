TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += \
    android/AndroidManifest.xml \
    android/res/values/strings.xml \
    android/res/drawable-hdpi/ic_launcher_vision.png \
    android/res/drawable-ldpi/ic_launcher_vision.png \
    android/res/drawable-mdpi/ic_launcher_vision.png

### TS ###

# Run 'lupdate vision.pro -ts main.ts' to get a ts file.

# You can use an lupdate_only{...} conditional statement so the lupdate tool
# sees the .qml files but the C++ compiler ignores them.

lupdate_only{
SOURCES = main.qml \
          SquareButton.qml
}

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
