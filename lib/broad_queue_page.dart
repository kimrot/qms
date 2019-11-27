import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/data/post_api_service.dart';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:qms/models/models.dart';
import 'package:qms/queues_page.dart';



class BroadQueuesPage extends StatelessWidget {
   final String text;
 BroadQueuesPage({Key key, @required this.text}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text('Products Type', textAlign:TextAlign.center)),
        backgroundColor: Colors.red,
        
             ),
      body: Center(child: _buildBody(context)),
      
           );
       }
  FutureBuilder<Response> _buildBody(BuildContext context){
 print(text);
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
             print(text);
             list = conts.map<Contents>((json)=>Contents.fromJson(json)).toList();
                  localOrders.clear();
              for(var i in list){
                  if (i.orderType == "Local") {
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
             print(text);
             list = conts.map<Contents>((json)=>Contents.fromJson(json)).toList();
                  exportOrders.clear();
              for(var i in list){
                  if (i.orderType == "Export") {
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
    return _buildBody(context);
  }

  ListView _buildorders(BuildContext context, List orders){
    return ListView.builder( 
      itemCount: orders.length,
      padding: EdgeInsets.all(8.0),
      itemBuilder: (contex, index){
        
        return Container(
          
          child: Center(
            
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: ListTile(
                isThreeLine: true,
                
                leading: Icon(Icons.queue, color: Colors.black,),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                title: Text(orders[index].products, 
                style: TextStyle(fontSize:20.0,fontWeight: FontWeight.w800, color: Colors.black),
                
                ),
                subtitle: Column(
                  children: <Widget>[
                    Text(orders[index].criteria,
                style: TextStyle(fontSize:16.0,fontWeight: FontWeight.w800, color: Colors.red)),
                    Text(orders[index].loading,
                style: TextStyle(fontSize:16.0,fontWeight: FontWeight.w800, color: Colors.blue))
                  ],
                ),
                
                // subtitle: Text(orders[index].criteria,
                // style: TextStyle(fontSize:25.0,fontWeight: FontWeight.w800, color: Colors.red),),
                  
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


