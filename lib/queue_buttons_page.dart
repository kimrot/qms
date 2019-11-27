import 'package:flutter/material.dart';
import 'package:qms/broad_queue_page.dart';
//import 'package:qms/depots_page.dart';



class QueueButtonPage extends StatelessWidget {

 // final String text;
  
 // QueueButtonPage({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Select Your Order Type'),
      ),
    
      body: Container(
        
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              SizedBox(height: 20,),

              Card(

              child:ButtonTheme(
                height: 100,
                minWidth: double.infinity,

                                
              child: RaisedButton(
                  child: Text("Local",
                  style: TextStyle(
                    fontSize: 30
                  ),),
                
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.black,
                  onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BroadQueuesPage(text:'Local',))
              );
                  },
                  
                ),
              )
              ),
             SizedBox(
               height: 10,
               ),
             Card(
               
                            child: ButtonTheme(
                              height: 100,
                  minWidth: double.maxFinite,             
                child: RaisedButton(
                    child: Text("Export",
                    style: TextStyle(
                      fontSize: 30
                    ),),
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.black,
                    onPressed:(){
                         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BroadQueuesPage(text:'Export',))
                     );
                    },
                    
                  ),
                ),
             ),
            ],
          ),
        ),
      ),
    
    );
  }
}