import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
   String location;
  late String time;
  String url;
  String flag;
  late bool isDayTime;
  WorldTime({required this.location,required this.url,required this.flag});

  Future <void> getData()async{

    try {
      var uri = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(datetime);
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour>6 && now.hour<18 ?true:false;
      time = DateFormat.jm().format(now);
      print(now);
    }
    catch(e){
      print('caught error $e');
      time='could not get data';

    }
  }
}

