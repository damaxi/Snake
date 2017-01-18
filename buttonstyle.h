#ifndef BUTTONSTYLE_H
#define BUTTONSTYLE_H

#include <QObject>
#include <QtQml>

class ButtonStyle : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int elevation READ elevation WRITE setElevation NOTIFY elevationChanged)

public:
    explicit ButtonStyle(QObject *parent = 0);

    static ButtonStyle *qmlAttachedProperties(QObject *object);

    int elevation() const;
    void setElevation(int elevation);

signals:
    void elevationChanged();

private:
    int m_elevation;
};

QML_DECLARE_TYPEINFO(ButtonStyle, QML_HAS_ATTACHED_PROPERTIES)

#endif // BUTTONSTYLE_H
