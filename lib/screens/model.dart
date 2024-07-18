import 'package:state_manage/screens/database.dart';

class StModel{
  String title;
  String desc;
  String createAt;
  int id;

  StModel({required this.title,required this.desc,required this.createAt,this.id=0});

  factory StModel.fromMap(Map<String,dynamic>map){
    return StModel(
        id: map[AppData.COLUMN_KEY_ID],
        title: map[AppData.COLUMN_KEY_TITLE],
        desc: map[AppData.COLUMN_KEY_DESC],
        createAt: map[AppData.COLUMN_KEY_TIME]);
  }

  Map<String,dynamic>toMap(){
    return{
      AppData.COLUMN_KEY_TITLE:title,
      AppData.COLUMN_KEY_DESC:desc,
      AppData.COLUMN_KEY_TIME:createAt,
    };
  }

}