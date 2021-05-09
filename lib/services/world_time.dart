import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the ui
  String time; //time in that lication
  String flag; // url of asset flag icon
  String url; // location url of api endpoint
  bool isDaytime; // true false is the daytime or not

  WorldTime({this.location , this.flag , this.url});

  Future<void> getTime() async {
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(DateTime);
    //print(offset);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
    time = DateFormat.jm().format(now); // setting the time property
  }

}
