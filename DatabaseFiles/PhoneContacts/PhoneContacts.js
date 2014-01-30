var db;
var resultSet;

function loadDB(){

    db = openDatabaseSync("Contacts", "1.0", "Contacts SQL", 1000000);
    db.transaction(function(tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS ContactsData(id INT, name STRING)');
        //tx.executeSql('DELETE FROM ContactsData');
        resultSet = tx.executeSql('SELECT * FROM ContactsData ORDER BY id DESC');
    });

    if(resultSet.rows.length == 0) {
        populateDB();
    } else {
        populateModel();
    }

    return listModel;
}

/*
function populateModel(){
   for(var i = 0; i<=resultSet.rows.length-1; i++){
      var nameTxt = resultSet.rows.item(i).name;
      var indexNum = resultSet.rows.item(i).id;
      listModel.append({id:indexNum, name: nameTxt });
   }
}
*/

function populateDB(){
    for(var i = 0; i<= listModelExample.count-1; i++){
        var nameTxt = listModelExample.get(i).name
        insertRecord(i, nameTxt);
        listModel.append({id:i, name: nameTxt });
    }
}

function populateModel(){
    for(var i = 0; i<=resultSet.rows.length-1; i++){
        var nameTxt = resultSet.rows.item(i).name
        var indexNum = resultSet.rows.item(i).id
        listModel.append({id:indexNum, name: nameTxt });
    }
}

function insertRecord(index, name)
{
    db.transaction(function(tx) {
        tx.executeSql('INSERT INTO ContactsData VALUES(?, ?)', [index, index+name]);
        resultSet = tx.executeSql('SELECT * FROM ContactsData ORDER BY id DESC');
    });
}

function removeRecord(nameTxt)
{
    db.transaction(function(tx) {
        tx.executeSql('DELETE FROM ContactsData WHERE name = ?', [nameTxt]);
        resultSet = tx.executeSql('SELECT * FROM ContactsData ORDER BY id DESC');
    });
}
