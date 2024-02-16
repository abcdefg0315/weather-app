import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';
import 'loading.dart';
const apikey = '717425e252e87eb9399681806b5e5a07';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp2(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class logInPage extends StatelessWidget {
  const logInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Scaffold(
              body: SignInScreen(
                providerConfigs: [
                  EmailProviderConfiguration()
                ],
              ),
            );
          }
          return MyHomePage2();
        }
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange
          )
      ),
      home: logInPage(),
    );
  }
}