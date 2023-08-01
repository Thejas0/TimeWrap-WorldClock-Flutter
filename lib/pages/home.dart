import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    data=data.isEmpty?ModalRoute.of(context)?.settings.arguments as Map:data;
    print(data);
    String bgImage =data['isdaytime']?'day.png':'night.png';
    Color? bgColor=data['isdaytime']?Colors.blue:Colors.indigo[700];
    return  Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: ()async{
                       dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data={
                            'location':result['location'],
                            'time':result['time'],
                            'flag':result['flag'],
                            'isdaytime':result['isdaytime'],
                          };
                        });
                       },

                    icon:  Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                        size: 30.0,
                    ),
                    label:  Text(
                        'Edit location',
                          style: TextStyle(
                            color:  Colors.grey[300],
                            fontSize: 20.0,
                          ),
                    )
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        data['location'],
                        style:  TextStyle(
                          fontSize: 32.0,
                          letterSpacing: 2.0,
                          color: Colors.grey[200],
                        ),
                    ),
                  ],
                ),
                const SizedBox(height:20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 70.0,
                      color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
