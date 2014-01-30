/****************************************************************************
** Meta object code from reading C++ file 'Radio_HeadUnit.h'
**
** Created: Sun May 5 16:03:53 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "Radio_HeadUnit.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Radio_HeadUnit.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Radio_Unit[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      33,   12,   11,   11, 0x02,
      80,   59,   11,   11, 0x02,
     111,  106,   11,   11, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Radio_Unit[] = {
    "Radio_Unit\0\0busMessage,selection\0"
    "radioBus(QString,QString)\0"
    "radioMsg,radioStatus\0radioPwr(QString,QString)\0"
    "bugs\0testing(QString)\0"
};

void Radio_Unit::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Radio_Unit *_t = static_cast<Radio_Unit *>(_o);
        switch (_id) {
        case 0: _t->radioBus((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 1: _t->radioPwr((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 2: _t->testing((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData Radio_Unit::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Radio_Unit::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Radio_Unit,
      qt_meta_data_Radio_Unit, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Radio_Unit::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Radio_Unit::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Radio_Unit::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Radio_Unit))
        return static_cast<void*>(const_cast< Radio_Unit*>(this));
    return QObject::qt_metacast(_clname);
}

int Radio_Unit::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
