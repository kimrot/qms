import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/data/post_api_service.dart';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:qms/models/models.dart';
//import 'package:qms/queue_buttons_page.dart';
import 'package:date_format/date_format.dart';


class QueuesPage extends StatefulWidget {
  final String text;
  QueuesPage({Key key, this.text}) : super(key: key);
  

  @override
  _QueuesPageState createState() =>  _QueuesPageState();
}

class _QueuesPageState extends State<QueuesPage> {
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
    
  }

  void filterSearchResults(String query) {
    duplicateItems.clear();
    if(query.isNotEmpty) {
    
      duplicateItems.forEach((item) {
        if(item.checkpoint.toLowerCase().contains(query.toLowerCase())||item.driverName.toLowerCase().contains(query.toLowerCase())
        ||item.orderNumber.toLowerCase().contains(query.toLowerCase())||item.vehicleNumber.toLowerCase().contains(query.toLowerCase())
        ||item.omc.toLowerCase().contains(query.toLowerCase())||item.queueNumber.toLowerCase().contains(query.toLowerCase())){
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
    return  Scaffold(
      appBar:  AppBar(
        title:  Text("Queues"),
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
  

  Widget _createListView(BuildContext context, List item){
    return Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Center(
                      child: Card(
                        color: HexColor(item[index].color),
                        elevation: 5,
                       child: ListTile(
                isThreeLine: true,
                
                leading: Icon(Icons.queue, color: Colors.black,),               
                title: Text("Queue Number: ${item[index].queueNumber}", 
                          style: TextStyle(
                          
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),

                    Text(item[index].checkpoint,
                          
                          style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black)),
                    Text(item[index].vehicleNumber,
                          
                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold,color: Colors.black),),
                 Text(item[index].omc,
                          
                          style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,),),
                 Text(item[index].driverName,
                          
                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                 Text(formatDate(DateTime.parse(item[index].time), [d, '-', M, '-', yyyy, ', ', HH, ':', nn]),
                          
                          style: TextStyle(fontSize:14.0, fontWeight: FontWeight.bold,),)
                  ],
                ),
                
                contentPadding: EdgeInsets.all(10),  ),
                      ),
                    ),
                  );
                },
              ),
            );

  }
} 