/****************************************************************************
** Meta object code from reading C++ file 'CanControl.h'
**
** Created: Tue May 21 17:58:08 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "CanControl.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CanControl.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CanControl[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       2,   74, // constructors
       0,       // flags
       6,       // signalCount

 // signals: signature, parameters, type, tag, flags
      40,   12,   11,   11, 0x05,
      80,   71,   11,   11, 0x05,
     117,  107,   11,   11, 0x05,
     154,  145,   11,   11, 0x05,
     194,  181,   11,   11, 0x05,
     238,  225,   11,   11, 0x05,

 // slots: signature, parameters, type, tag, flags
     266,   12,   11,   11, 0x08,

 // methods: signature, parameters, type, tag, flags
     295,   11,   11,   11, 0x02,
     306,   12,   11,   11, 0x02,
     333,  225,  328,   11, 0x02,
     352,  225,   11,   11, 0x02,
     372,   11,   11,   11, 0x02,

 // constructors: signature, parameters, type, tag, flags
     389,  382,   11,   11, 0x0e,
     410,   11,   11,   11, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_CanControl[] = {
    "CanControl\0\0canMessageID,canMessageData\0"
    "message_recieved(QString,int*)\0veh_mode\0"
    "veh_mode_recieved(QString)\0bett_temp\0"
    "batt_temp_recieved(QString)\0batt_soc\0"
    "batt_soc_recieved(QString)\0batt_current\0"
    "batt_current_recieved(QString)\0"
    "canMessageID\0_can_recieve_start(QString)\0"
    "_message_ready(QString,int*)\0start_up()\0"
    "send(QString,QString)\0int*\0"
    "recieve_b(QString)\0recieve_nb(QString)\0"
    "testing()\0parent\0CanControl(QObject*)\0"
    "CanControl()\0"
};

void CanControl::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { CanControl *_r = new CanControl((*reinterpret_cast< QObject*(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { CanControl *_r = new CanControl();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    } else if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CanControl *_t = static_cast<CanControl *>(_o);
        switch (_id) {
        case 0: _t->message_recieved((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int*(*)>(_a[2]))); break;
        case 1: _t->veh_mode_recieved((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->batt_temp_recieved((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->batt_soc_recieved((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->batt_current_recieved((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->_can_recieve_start((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: _t->_message_ready((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int*(*)>(_a[2]))); break;
        case 7: _t->start_up(); break;
        case 8: _t->send((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 9: { int* _r = _t->recieve_b((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int**>(_a[0]) = _r; }  break;
        case 10: _t->recieve_nb((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 11: _t->testing(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CanControl::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CanControl::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_CanControl,
      qt_meta_data_CanControl, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CanControl::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CanControl::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CanControl::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CanControl))
        return static_cast<void*>(const_cast< CanControl*>(this));
    return QObject::qt_metacast(_clname);
}

int CanControl::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
    return _id;
}

// SIGNAL 0
void CanControl::message_recieved(QString _t1, int * _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void CanControl::veh_mode_recieved(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void CanControl::batt_temp_recieved(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void CanControl::batt_soc_recieved(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void CanControl::batt_current_recieved(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void CanControl::_can_recieve_start(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}
QT_END_MOC_NAMESPACE
