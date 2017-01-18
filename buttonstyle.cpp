#include "buttonstyle.h"

ButtonStyle::ButtonStyle(QObject *parent) :
    QObject(parent),
    m_elevation(0)
{}

ButtonStyle *ButtonStyle::qmlAttachedProperties(QObject *object)
{
    return new ButtonStyle(object);
}

int ButtonStyle::elevation() const
{
    return m_elevation;
}

void ButtonStyle::setElevation(int elevation)
{
    if (elevation == m_elevation)
        return;

    m_elevation = elevation;
    emit elevationChanged();
}
