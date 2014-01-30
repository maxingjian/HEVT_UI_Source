/****************************************************************************
** Meta object code from reading C++ file 'CanRecieve.h'
**
** Created: Sun May 5 09:53:35 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "CanRecieve.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CanRecieve.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CanRecieve[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      40,   12,   11,   11, 0x05,

 // slots: signature, parameters, type, tag, flags
      81,   68,   11,   11, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_CanRecieve[] = {
    "CanRecieve\0\0canMessageID,canMessageData\0"
    "message_ready(QString,int*)\0canMessageID\0"
    "can_recieve(QString)\0"
};

void CanRecieve::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CanRecieve *_t = static_cast<CanRecieve *>(_o);
        switch (_id) {
        case 0: _t->message_ready((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int*(*)>(_a[2]))); break;
        case 1: _t->can_recieve((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CanRecieve::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CanRecieve::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_CanRecieve,
      qt_meta_data_CanRecieve, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CanRecieve::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CanRecieve::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CanRecieve::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CanRecieve))
        return static_cast<void*>(const_cast< CanRecieve*>(this));
    return QObject::qt_metacast(_clname);
}

int CanRecieve::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void CanRecieve::message_ready(QString _t1, int * _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
