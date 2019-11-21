


class Depot {
  final int id;
  final String code;
  final String location;
  
  Depot({this.id, this.code, this.location});

  factory Depot.fromJson(Map<String, dynamic> json) {
    return Depot(
      id: json['id'],
      code: json['code'],
      location: json['location'],
     );
  }
}
 

 class BroadQueues{
final int status;
final String messages;
final List<Contents> content;

BroadQueues({this.status, this. messages, this.content});

factory BroadQueues.fromJson(Map<String, dynamic>fromJson){
  return BroadQueues(
    status:fromJson['status'],
    messages: fromJson['messages']
  );
}


 }
class Contents{
  final int id;
  final String products;
  final String criteria;
  final String order_type;


  Contents({ this.id, this.products, this.criteria, this.order_type});

  factory Contents.fromJson(Map<String, dynamic>fromJson){
    return Contents(
      products:fromJson['products'],
      criteria:fromJson['criteria'],
      order_type: fromJson['order_type'],
      id: fromJson['id']
    );
  }

}

class Queues {
  final int status;
  final String message;
  final List<Queue> content;


  Queues({this.status,this.message, this.content});
  factory Queues.fromJson(Map<String, dynamic>fromJson){
    return Queues(
      status:fromJson['status'],
      message:fromJson['message'],
      content:fromJson['content'],
    );
  }
  
}

class Queue{
  final String queueNumber;
  final String orderNumber;
  final String checkpoint;
  final String color;
  final String driverName;
  final String omc;
  final String vehicleNumber;
  final String time;

  Queue({this.queueNumber, this.orderNumber, this.color, this.checkpoint, this.driverName, this.omc, this.time, this.vehicleNumber});
  
  factory Queue.fromJson(Map<String, dynamic>fromJson){
    print(fromJson);
    // time = new DateTime.now();
    return Queue(
      queueNumber:fromJson['queueNumber'],
      orderNumber: fromJson['orderNumber'],
      checkpoint: fromJson['checkpoint'],
      color: fromJson['color'],
      driverName: fromJson['driverName'],
      omc: fromJson['omc'],
      vehicleNumber: fromJson['vehicleNumber'],
      time: fromJson['time']['date']

    );
  }
}

class Time{
  final String time;
  

  Time({this.time});
  factory Time.fromJson(Map<String, dynamic>fromJson){
    // print(dynamic);
    return Time(
      time:fromJson['time']
    );
  }
}
