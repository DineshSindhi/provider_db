import 'package:flutter/material.dart';
import 'package:state_manage/screens/database.dart';
import 'model.dart';
class MyProvider extends ChangeNotifier{
  AppData db;
  MyProvider({required this.db});
  List<StModel> _mData=[];
  void addNotes(StModel newNote)async{
    db.addNote( noteModel: newNote);
    _mData=await db.fecNote();
    notifyListeners();
  }
  List<StModel> fecNote(){
    return _mData;
  }
  void upDate(StModel UpdateNote,)async {
    db.updateNote(UpdateNote);
    _mData=await db.fecNote();
    notifyListeners();
  }
  void delete(int id)async{
    db.deleteNote(id);
    _mData=await db.fecNote();
    notifyListeners();
  }
    void getNotes() async {
    _mData=await db.fecNote();
    notifyListeners();
  }

  }
