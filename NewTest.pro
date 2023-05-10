QT += core quick sql widgets
QT_DEBUG_PLUGINS=1
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
CONFIG += c++17
HEADERS += \
    include/abstract_notification.h \
    include/history_model.h \
    include/notification_entity.h \
    include/notification_logger.h \
    include/notify_model.h \
    include/type_manager.h
SOURCES += \
        include/abstract_notification.cpp \
        include/history_model.cpp \
        include/notification_entity.cpp \
        include/notification_logger.cpp \
        include/notify_model.cpp \
        include/type_manager.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=
