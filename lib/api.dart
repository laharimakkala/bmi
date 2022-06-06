import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Hello") ,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed:() {
              apicall();
            },child: Text("Call Api")),
            FutureBuilder(future : apicall(),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data);
                  }
                  else{
                    return CircularProgressIndicator();
                  }

                })
          ],
        ),
      ),
    );
  }
}

Future<String> apicall() async{
  final url = Uri.parse("");
  final response = await http.get(url);
  print(jsonDecode(response.body)["Weather"][0]["description"]);
  String output= jsonDecode(response.body)["Weather"][0]["description"];
  return output;
}
