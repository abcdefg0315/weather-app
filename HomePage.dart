import 'package:app3/model/music.dart';
import 'package:app3/search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:app3/model/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'setting.dart';
import 'package:app3/model/textmodel.dart';



class HomePage extends StatefulWidget {
  HomePage({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Model model = Model();
  TextModel textmodel = TextModel();
  MusicModel musicModel = MusicModel();
  MusicModel2 musicModel2 = MusicModel2();
  late String cityName;
  late int temp;
  late Widget icon;
  late Widget text;
  late String des;
  late String music;
  late String music2;

  _launchURL2(String query) async {
    String url = 'https://www.youtube.com/watch?v=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData){
    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();
    des = weatherData['weather'][0]['description'];
    cityName = weatherData['name'];
    int condition = weatherData['weather'][0]['id'];
    icon = model.getWeatherIcon(condition)!;
    text = textmodel.getWeatherText(condition)!;
    music = musicModel.getMusicText(condition)!;
    music2 = musicModel2.getMusicText(condition)!;
  }

  var date = DateTime.now();

  String getSystemTime(){
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        leading: const Icon(Icons.audiotrack),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return Search();
            }));
          }, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return setting();
            }));
          }, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/123.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                        SizedBox(
                          height: 10,
                        ),
                        Text('$cityName',
                          style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)
                        ),
                        Row(
                          children: [
                            TimerBuilder.periodic(
                                (Duration(minutes: 1)),
                                builder: (context){
                                  print('${getSystemTime()}');
                                  return Text(
                                    '${getSystemTime()}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white
                                    ),
                                  );
                                }
                            ),
                            Text(
                              DateFormat(' - EEEE, ').format(date),
                              style: TextStyle(
                                fontSize: 16, color: Colors.white
                              ),
                            ),
                            Text(
                              DateFormat('d MMM, yyy').format(date),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white
                              ),
                            )
                          ],
                        )
                        ]
                        ),
                        Column(
                          children: [
                            Text('$temp\u2103',
                                style: TextStyle(fontSize: 80,color: Colors.white,fontWeight: FontWeight.w300 ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                icon,
                                SizedBox(width: 20),
                                Text('$des',
                                  style: TextStyle(fontSize: 35,color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10)
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white38,
                      ),
                      SizedBox(height: 10),
                      text,
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Image.network('https://i.ytimg.com/vi/$music/hq720.jpg',width: 150),
                            onTap: (){_launchURL2(music);}
                          ),GestureDetector(
                            child: Image.network('https://i.ytimg.com/vi/$music2/hq720.jpg',width: 150),
                            onTap: (){_launchURL2(music2);}
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}