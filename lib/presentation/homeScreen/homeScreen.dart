import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/presentation/homeScreen/controller/home_screen_conttroller.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text('weather App'),
            centerTitle: true,

          ),
          body:

          controller.loading.value==true? Center(
            child: CircularProgressIndicator(),
          ):
          ListView.builder(
            itemCount: 5,
            itemBuilder:(context, index) {
            return Card(
              elevation: 2,
              child: ListTile(
                title:Text('${controller.weatherModel.value.location?.name}') ,
                subtitle: Text('${controller.weatherModel.value.current?.temperature}'),
              ),
            );
          },)
        );
      }
    );
  }
}
