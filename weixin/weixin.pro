TEMPLATE = app
TARGET = weixin

load(ubuntu-click)

QT += qml quick

SOURCES += main.cpp textballoon.cpp
HEADERS += textballoon.h

RESOURCES += weixin.qrc

OTHER_FILES += weixin.apparmor \
               weixin.desktop \
               weixin.png

#specify where the config files are installed to
config_files.path = /weixin
config_files.files += $${OTHER_FILES}
message($$config_files.files)
INSTALLS+=config_files

# Default rules for deployment.
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target

