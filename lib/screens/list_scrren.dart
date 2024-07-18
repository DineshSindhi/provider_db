
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/screens/controller.dart';
import 'package:state_manage/screens/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<MyProvider>().getNotes();
  }
  var dtFor=DateFormat.Hm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('State'),
      ),
      body: Consumer<MyProvider>(builder: (_,value,__){
        var mData=value.fecNote();
        return mData.isNotEmpty?ListView.builder(
            itemCount:mData.length,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2(isUpdate: true,myModel: mData[i]),));
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mData[i].title,style: TextStyle(fontSize: 20),),
                    Text(dtFor.format(DateTime.fromMillisecondsSinceEpoch(int.parse(mData[i].createAt))))
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mData[i].desc,style: TextStyle(fontSize: 20)),

                    InkWell(
                        onTap: (){
                          context.read<MyProvider>().delete(mData[i].id);
                        },
                        child: Icon(Icons.delete,color: Colors.orange,)),
                  ],
                ),


              );}):
            Center(child: Lottie.asset('assets/lottie/no data.json',height: 350,width: 350));
        /*Container(child: Center(
          child: Text('No Notes Yet...'),
        ),);*/
    },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2(),));
            },child: Icon(Icons.add),
        ),
    );
  }
}
