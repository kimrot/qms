//import 'package:qms/models/models.dart';
import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl:'' )
abstract class PostApiService extends ChopperService {
@Post()
Future<Response> loginUser();
 @Body() Map<String, dynamic> body;

@Get(path:'depots')
Future<Response> getDepots();



@Get(path: '/broadqueues/') 
Future<Response> getOrders();

@Get(path: '/broadqueue/{id}')
Future<Response > getQueues(@Path() int id);

static PostApiService create (){
  final client= ChopperClient(baseUrl:'https://qmsnakuru.kpc.co.ke' ,
  services: [
    _$PostApiService()],
  converter: JsonConverter(),
  interceptors:[
    HeadersInterceptor({'cache-control': 'no-control'}),
    HttpLoggingInterceptor()
  ]
  );
  
 return _$PostApiService(client);
}
}