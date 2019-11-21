import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/data/post_api_service.dart';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:qms/queue_buttons_page.dart';


class DepotsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text('Select Your Depot', textAlign:TextAlign.center)),
        backgroundColor: Colors.red,
             ),
      body: Center(child: _buildBody(context)),
      
           );
       }
  FutureBuilder<Response> _buildBody(BuildContext context){

    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getDepots(),
      builder: (context, snapshot){
         if (snapshot.connectionState ==ConnectionState.done){
         final List depots = json.decode(snapshot.data.bodyString);
         
         return _builddepots(context, depots);
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
  
  ListView _builddepots(BuildContext context, List depots){
    return ListView.builder( 
      itemCount: depots.length,
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
                title: Text(depots[index]['location'], 
                style: TextStyle(fontSize:30.0,fontWeight: FontWeight.w800, color: Colors.black),
                
                ),
                subtitle: Text(depots[index]['code'],
                style: TextStyle(fontSize:25.0,fontWeight: FontWeight.w800, color: Colors.red),),
                
                contentPadding: EdgeInsets.all(10),

                
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QueueButtonPage())
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