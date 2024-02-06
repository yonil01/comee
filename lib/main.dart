import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'screen/auth/login.dart';
import 'package:app_come/screen/modules/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegúrate de que está inicializado
  //await Firebase.initializeApp(); // Inicializa Firebase
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    // this.initDynamicLinks();
  }

  void initDynamicLinks() async {
    // Obtener cualquier Dynamic Link inicial que haya lanzado la aplicación
    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = initialLink?.link;

    if (deepLink != null) {
      // Navega a la ruta deseada según el deepLink
      Navigator.pushNamed(context, deepLink.path);
    }

    // Escuchar los siguientes Dynamic Links
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      final Uri deepLink = dynamicLinkData.link;
      // Navega a la ruta deseada según el deepLink
      Navigator.pushNamed(context, deepLink.path);
    }).onError((error) {
      print('Dynamic Link Failed: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Processed execution');
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
