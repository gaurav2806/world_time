import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';
  void setupworldTime() async{
    WorldTime instance = WorldTime(location: 'London' , flag: 'germany.png' , url: 'Europe/london');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home' , arguments: {
      'location': instance.location , 'flag': instance.flag , 'time': instance.time , 'isDaytime': instance.isDaytime,
    });
  }
  @override
  void initState() {
    super.initState();
    setupworldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
