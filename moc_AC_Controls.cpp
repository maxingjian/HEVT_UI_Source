/****************************************************************************
** Meta object code from reading C++ file 'AC_Controls.h'
**
** Created: Sun May 5 09:53:34 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "AC_Controls.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'AC_Controls.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AcControls[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      19,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      27,   12,   11,   11, 0x02,
      58,   42,   11,   11, 0x02,
      89,   74,   11,   11, 0x02,
     119,  104,   11,   11, 0x02,
     151,  134,   11,   11, 0x02,
     181,  172,   11,   11, 0x02,
     195,   11,   11,   11, 0x02,
     208,   11,   11,   11, 0x02,
     220,   11,   11,   11, 0x02,
     235,   11,   11,   11, 0x02,
     272,  249,   11,   11, 0x02,
     288,   11,   11,   11, 0x02,
     304,   11,   11,   11, 0x02,
     319,   11,   11,   11, 0x02,
     337,   11,   11,   11, 0x02,
     354,   11,   11,   11, 0x02,
     371,   11,   11,   11, 0x02,
     387,   11,   11,   11, 0x02,
     406,   11,   11,   11, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_AcControls[] = {
    "AcControls\0\0acButtonStatus\0acButton(bool)\0"
    "circulateStatus\0circulate(bool)\0"
    "DefrostStatusR\0defrostR(bool)\0"
    "DefrostStatusF\0defrostF(bool)\0"
    "ventButtonStatus\0ventButtons(QString)\0"
    "fanSpeed\0fanLevel(int)\0fanUpStart()\0"
    "fanUpStop()\0fanDownStart()\0fanDownStop()\0"
    "acTempLeft,acTempRight\0acTemp(int,int)\0"
    "acUpLeftStart()\0acUpLeftStop()\0"
    "acDownLeftStart()\0acDownLeftStop()\0"
    "acUpRightStart()\0acUpRightStop()\0"
    "acDownRightStart()\0acDownRightStop()\0"
};

void AcControls::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        AcControls *_t = static_cast<AcControls *>(_o);
        switch (_id) {
        case 0: _t->acButton((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->circulate((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->defrostR((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->defrostF((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->ventButtons((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->fanLevel((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->fanUpStart(); break;
        case 7: _t->fanUpStop(); break;
        case 8: _t->fanDownStart(); break;
        case 9: _t->fanDownStop(); break;
        case 10: _t->acTemp((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 11: _t->acUpLeftStart(); break;
        case 12: _t->acUpLeftStop(); break;
        case 13: _t->acDownLeftStart(); break;
        case 14: _t->acDownLeftStop(); break;
        case 15: _t->acUpRightStart(); break;
        case 16: _t->acUpRightStop(); break;
        case 17: _t->acDownRightStart(); break;
        case 18: _t->acDownRightStop(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData AcControls::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject AcControls::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AcControls,
      qt_meta_data_AcControls, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AcControls::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AcControls::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AcControls::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AcControls))
        return static_cast<void*>(const_cast< AcControls*>(this));
    return QObject::qt_metacast(_clname);
}

int AcControls::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 19)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 19;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
