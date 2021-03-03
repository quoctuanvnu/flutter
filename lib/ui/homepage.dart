import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _bin = '';
  String dec = '';
  final binText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final hgt = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Binary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: binText,
                onChanged: (text){
                  this.setState((){
                    _bin = text;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(10)
                    ),
                  ),
                  labelText:'Enter your binary number',
                ),
              ),
            ),

            Text("Decimal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              width: 450,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Text("$dec"),
              ),


            FlatButton(
              onPressed: (){
                setState(() {
                  dec = int.parse(_bin, radix: 2).toRadixString(10);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.teal[800], width: 3.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )
                ),
                child: Text("Convert", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

