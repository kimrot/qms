// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PostApiService extends PostApiService {
  _$PostApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PostApiService;

  Future<Response> loginUser() {
    final $url = 'handheld/';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getDepots() {
    final $url = 'handheld/depots';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getOrders() {
    final $url = 'handheld/broadqueues/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getQueues(int id) {
    final $url = 'handheld/broadqueue/$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
