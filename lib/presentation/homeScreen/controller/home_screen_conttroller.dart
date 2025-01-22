import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await weatherApiCalling();
  }

  //function for api call

  var weatherModel = WeatherModel().obs;
  var loading = false.obs;
  Future<dynamic> weatherApiCalling() async {
    try {
      loading.value = true;
      var endpoint =
          'http://api.weatherstack.com/current?access_key=3dd4a07db26d9cb6fe197543a4194843&query=New York';
      var response = await http.get(Uri.parse(endpoint));
      log('the response is ${response.statusCode}');
      if (response.statusCode == 200) {
        log('the response is ${response.body}');
        var jsonData = jsonDecode(response.body);
        weatherModel.value = WeatherModel.fromJson(jsonData['request']);

      }
    } catch (e) {
      log('the catch error is ${e.toString()}');
    } finally {
      loading.value = false;
      update();
    }
  }
}
