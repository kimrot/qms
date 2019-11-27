
/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/data/post_api_service.dart';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:qms/models/models.dart';
//import 'package:qms/queue_buttons_page.dart';
import 'package:date_format/date_format.dart';


class MyHomePage extends StatefulWidget {
  final String text;
  MyHomePage({Key key, this.text}) : super(key: key);
  

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();
   String text;
    List<Queue> dummyListData = List();
   List<Queue> list =List();
  final duplicateItems =  List<Queue>();
  List<Queue>  items = List();



  FutureBuilder<Response> _buildBody(BuildContext context){
    List<Queue> list =List();
           return FutureBuilder<Response>(
            future: Provider.of<PostApiService>(context).getQueues(int.parse(widget.text)),
            builder: (context, snapshot){
         if (snapshot.connectionState ==ConnectionState.done){
         var queues = json.decode(snapshot.data.bodyString);

         
            var queu = queues['content'] as List;
          
             list = queu.map<Queue>((json)=>Queue.fromJson(json)).toList();
              items.addAll(list);
          

               return _createListView(context, items );
      }
      else{
        //
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      }
    );
      
  }

  void initState() {
    items.addAll(duplicateItems);
    super.initState();
    print("This@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@{$items}");
  }

  void filterSearchResults(String query) {
    duplicateItems.clear();
    if(query.isNotEmpty) {
    
      duplicateItems.forEach((item) {
        if(item.checkpoint.toLowerCase().contains(query.toLowerCase())) {
          items.add(item);
        }
      });
      setState(() {
        items.addAll(duplicateItems);
      });
      return;
    } else {
      setState(() {
        items.addAll(duplicateItems);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("queueue"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
             
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                   filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
              
            ),
            _buildBody(context),
           // _createListView(context, list),
          ],
        ),
      ),
    );
  }
  

  Widget _createListView(BuildContext context, List robber){
    return Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: robber.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(robber[index].checkpoint),
                  );
                },
              ),
            );

  }
} 

*/