import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('유튜브 검색'),
        ),
        body: Container(
          child: Stack(
            children: [
              Image.asset('assets/123.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              SearchWidget(),
            ],
          )
          ,
        ),
      );
  }
}

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: '유튜브 검색어 입력',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _launchURL(controller.text);
            },
            child: Text('검색'),
          ),
        ],
      ),
    );
  }

  void _launchURL(String query) async {
    String url = 'https://www.youtube.com/results?search_query=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}