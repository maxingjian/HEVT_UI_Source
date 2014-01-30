/****************************************************************************
** Meta object code from reading C++ file 'CAN_Setup.h'
**
** Created: Sun May 5 09:53:33 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "CAN_Setup.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CAN_Setup.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CanSetup[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      17,   10,    9,    9, 0x05,
      38,   10,    9,    9, 0x05,

 // methods: signature, parameters, type, tag, flags
     111,   61,    9,    9, 0x02,
     182,  164,  160,    9, 0x02,
     203,    9,    9,    9, 0x02,
     217,    9,    9,    9, 0x02,
     230,    9,    9,    9, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_CanSetup[] = {
    "CanSetup\0\0number\0testChanged(QString)\0"
    "signalChanged(QString)\0"
    "canMessageID,canInterval,canMessageData,startStop\0"
    "canMessageValue(QString,QString,QString,QString)\0"
    "int\0canMessageID,mode\0canRead(QString,int)\0"
    "consoleTest()\0signalTest()\0signalTest2()\0"
};

void CanSetup::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CanSetup *_t = static_cast<CanSetup *>(_o);
        switch (_id) {
        case 0: _t->testChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->signalChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->canMessageValue((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4]))); break;
        case 3: { int _r = _t->canRead((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 4: _t->consoleTest(); break;
        case 5: _t->signalTest(); break;
        case 6: _t->signalTest2(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CanSetup::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CanSetup::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_CanSetup,
      qt_meta_data_CanSetup, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CanSetup::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CanSetup::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CanSetup::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CanSetup))
        return static_cast<void*>(const_cast< CanSetup*>(this));
    return QObject::qt_metacast(_clname);
}

int CanSetup::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void CanSetup::testChanged(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void CanSetup::signalChanged(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
