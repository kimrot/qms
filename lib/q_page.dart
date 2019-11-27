/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/data/post_api_service.dart';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:qms/models/models.dart';
//import 'package:qms/queue_buttons_page.dart';
import 'package:date_format/date_format.dart';

class QuePage extends StatelessWidget {


  final String text;
  QueuesPage({Key key, @required this.text}) : super(key: key);
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text('Queues', textAlign:TextAlign.center)),
        backgroundColor: Colors.red,
        
             ),
      body: Center(child: _buildBody(context)),
      

           );
       }

  

   FutureBuilder<Response> _buildBody(BuildContext context){
    List<Queue> list;
           return FutureBuilder<Response>(
            future: Provider.of<PostApiService>(context).getQueues(int.parse(text)),
            builder: (context, snapshot){
         if (snapshot.connectionState ==ConnectionState.done){
         var queues = json.decode(snapshot.data.bodyString);
            var queu = queues['content'] as List;
             
             list = queu.map<Queue>((json)=>Queue.fromJson(json)).toList();

             
         
         return _buildqueues(context, list);
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

  ListView _buildqueues(BuildContext context, List queues){
    // print("this ${queues}");
    return ListView.builder( 
      itemCount: queues.length,
      padding: EdgeInsets.all(8.0),
      itemBuilder: (contex, index){


  return Container(
          
          child: Center(
            
            child: Card(
              color: HexColor(queues[index].color),
              elevation: 10,
              child: ListTile(
                isThreeLine: true,
                
                leading: Icon(Icons.queue, color: Colors.black,),               
                title: Text("Queue Number: ${queues[index].queueNumber}", 
                          style: TextStyle(
                          
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),

                    Text(queues[index].checkpoint,
                          
                          style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,)),
                    Text(queues[index].vehicleNumber,
                          
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                 Text(queues[index].omc,
                          
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                 Text(queues[index].driverName,
                          
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                 Text(formatDate(DateTime.parse(queues[index].time), [d, '-', M, '-', yyyy, ', ', HH, ':', nn]),
                          
                          style: TextStyle(fontSize:14.0, fontWeight: FontWeight.bold,),)
                  ],
                ),
                
                contentPadding: EdgeInsets.all(10),               
              ),
            ),
          ),
        );
  }
 );
  }
}





*/