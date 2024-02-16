import 'dart:io';
import 'package:app3/setting/appversion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

List<String> profileImages = ["assets/p1.png","assets/p2.png","assets/p3.png"];

class _settingState extends State<setting> {
  File? _image; // 선택한 이미지를 저장할 변수
  final picker = ImagePicker();
  ImageProvider? _imageProvider; // 이미지 프로바이더 변수
  String name = "Flutter";
  int age = 20;

  void _showNicknameDialog() {
    TextEditingController nicknameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("닉네임 및 나이 설정"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nicknameController,
                decoration: InputDecoration(labelText: '닉네임'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: '나이'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("저장"),
              onPressed: () {
                setState(() {
                  name = nicknameController.text;
                  age = int.tryParse(ageController.text) ?? 0;
                });
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("취소"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _updateProfileImage(int index) async {
    final imageProvider = AssetImage(profileImages[index]);
    await precacheImage(imageProvider, context);
    setState(() {
      _imageProvider = imageProvider;
      print('setState is called');
    });
  }
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      setState(() {
        _image = file;
        _imageProvider = FileImage(file);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          centerTitle: true,
          title: Text('Setting'),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 15.0),
                      child: CircleAvatar(
                        backgroundImage: _imageProvider ?? AssetImage('assets/p1.png'),
                        radius: 65.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(55.0, 0.0, 0.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Name: $name\n"),
                          Text("Age: $age"),
                        ],
                      ),
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                  leading: Icon(Icons.account_circle),
                  title: Text("프로필 사진 변경"),
                  onTap: () async {
                    int selectedIndex = await showDialog (
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("프로필 사진 변경"),
                          content: Wrap(
                            spacing: 10.0,
                            alignment: WrapAlignment.center,
                            children: List.generate(
                              profileImages.length,
                                  (index) {
                                return GestureDetector(
                                  onTap: () {
                                    _updateProfileImage(index);
                                    Navigator.of(context).pop(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(profileImages[index]),
                                    radius: 40.0, // 이미지 크기 조절
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                    if (selectedIndex != null) {
                      _updateProfileImage(selectedIndex);
                    }
                  },
                ),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                  leading: Icon(Icons.edit),
                  title: Text("닉네임 설정"),
                  onTap: () {
                    _showNicknameDialog();
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                  leading: Icon(Icons.info),
                  title: Text("앱 버전"),
                  onTap: () {
                    print('앱 버전 is clicked');
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return appVersion();
                    }));
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                  leading: Icon(Icons.logout),
                  title: Text("로그아웃"),
                  onTap: () {

                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
