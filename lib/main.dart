import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main(){
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    )
  );
}
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  String data = "";
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString("textFile/text.txt");
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Fetch Text"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data, style: TextStyle(fontSize: 22,),),
        ),
      ),
    );
  }
}