import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/data/post_api_service.dart';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:qms/models/models.dart';
//import 'package:qms/queue_buttons_page.dart';
import 'package:qms/queues_page.dart';
//import 'package:qms/models/models.dart';


class BroadQueuesPage extends StatelessWidget {
   final String text;
  
 BroadQueuesPage({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text('BroadQueues', textAlign:TextAlign.center)),
        backgroundColor: Colors.red,
             ),
      body: Center(child: _buildBody(context)),
      
           );
       }
  FutureBuilder<Response> _buildBody(BuildContext context){

    List<Contents> list;
    List<Contents> localOrders = List();
    List<Contents> exportOrders= List();
    if (text == "Local") {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getOrders(),
      builder: (context, snapshot){
         if (snapshot.connectionState ==ConnectionState.done){

           var orders = json.decode(snapshot.data.bodyString);
            var conts = orders['content'] as List;
             
             list = conts.map<Contents>((json)=>Contents.fromJson(json)).toList();
                  
              for(var i in list){
                  if (i.order_type == "Local") {
                    localOrders.add(i);
                  }
              }

                
              return _buildorders(context, localOrders);

         
        
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
     if (text == "Export") {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getOrders(),
      builder: (context, snapshot){
         if (snapshot.connectionState ==ConnectionState.done){

           var orders = json.decode(snapshot.data.bodyString);
            var conts = orders['content'] as List;
             
             list = conts.map<Contents>((json)=>Contents.fromJson(json)).toList();
                  
              for(var i in list){
                  if (i.order_type == "Export") {
                    exportOrders.add(i);
                  }
              }

              return _buildorders(context, exportOrders);

         
        
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
  }

  ListView _buildorders(BuildContext context, List orders){
    return ListView.builder( 
      itemCount: orders.length,
      padding: EdgeInsets.all(8.0),
      itemBuilder: (contex, index){
        
        return Container(
          height: 105,
          child: Center(
            
            child: Card(
              color: Colors.white,
              elevation: 8,
              child: ListTile(
                
                leading: Icon(Icons.location_on, color: Colors.black,),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                title: Text(orders[index].products, 
                style: TextStyle(fontSize:30.0,fontWeight: FontWeight.w800, color: Colors.black),
                
                ),
                subtitle: Text(orders[index].criteria,
                style: TextStyle(fontSize:25.0,fontWeight: FontWeight.w800, color: Colors.red),),
                
                contentPadding: EdgeInsets.all(10),

                
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QueuesPage(text : orders[index].id.toString(),))
                );

                },
                
              ),
            ),
          ),
        );
      }
    );
  }
}


