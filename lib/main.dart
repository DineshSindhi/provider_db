import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/screens/controller.dart';
import 'package:state_manage/screens/database.dart';
import 'package:state_manage/screens/list_scrren.dart';
import 'package:state_manage/screens/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) {
    return MyProvider(db:AppData.db );
  },child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
