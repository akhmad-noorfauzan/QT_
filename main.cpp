#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <backend.h>
#include <QQmlContext>
#include <curdmodel.h>
#include <QQuickStyle>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Backend *myprojek = new Backend;
    myprojek-> connectDB();

    curdModel *modelIKN = new curdModel;
    modelIKN->setQuery("SELECT * FROM ikan");

    curdModel *modelPNGL = new curdModel;
    modelPNGL->setQuery("SELECT * FROM pengelola");

    curdModel *modelPNJL = new curdModel;
    modelPNJL->setQuery("SELECT * FROM penjualan");

    QQmlContext*dataContext = engine.rootContext();
    dataContext->setContextProperty("FTI",myprojek);

    dataContext->setContextProperty("modelikan",modelIKN);

    dataContext->setContextProperty("modelpengelola",modelPNGL);

    dataContext->setContextProperty("modelpenjualan",modelPNJL);







    QQuickStyle::setStyle("Material");




    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
