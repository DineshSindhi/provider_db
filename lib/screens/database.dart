import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:state_manage/screens/model.dart';

class AppData{

  AppData._();

  static final AppData db=AppData._();

  static const String COLUMN_KEY_NOTE='note';
  static const String COLUMN_KEY_ID='note_id';
  static const String COLUMN_KEY_TITLE='title';
  static const String COLUMN_KEY_DESC='desc';
  static const String COLUMN_KEY_TIME='createAt';

  Database? myDb;
  Future<Database> getDb()async{
    if(myDb!=null){
      return myDb!;
    }else{
      myDb=await initDb();
      return myDb!;
    }
  }
  Future<Database> initDb()async{
    var root=await getApplicationDocumentsDirectory();
    var mainPath=join(root.path,'noteDb');
    return openDatabase(mainPath,version: 1,onCreate: (db,version){
      db.execute("create table $COLUMN_KEY_NOTE ( $COLUMN_KEY_ID integer primary key autoincrement ,$COLUMN_KEY_TITLE text,$COLUMN_KEY_DESC text,$COLUMN_KEY_TIME text)");
    });
  }

   addNote({ required StModel noteModel })async{
    var db=await getDb();
    db.insert('$COLUMN_KEY_NOTE', noteModel.toMap());
  }
  Future<List<StModel>>fecNote()async{
    var db=await getDb();
    var data= await db.query('$COLUMN_KEY_NOTE');
    List<StModel>mData=[];
    for(Map<String,dynamic> eachData in data){
    var each=StModel.fromMap(eachData);
    mData.add(each);}
    return mData;
  }
  updateNote(upNote)async{
    var db=await getDb();
    db.update('$COLUMN_KEY_NOTE', upNote.toMap(),
    where: '$COLUMN_KEY_ID= ?',whereArgs: ['${upNote.id}']);
  }
  deleteNote(int id)async{
    var db=await getDb();
    db.delete('$COLUMN_KEY_NOTE',where: '$COLUMN_KEY_ID= ?',whereArgs: ['$id']);

  }

}

