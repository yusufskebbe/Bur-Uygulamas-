import 'package:burc_rehberi_proje1/burc_detay.dart';
import 'package:burc_rehberi_proje1/liste_olusturma.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Burc rehberi",
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListesi",

      routes: {
       // "/ ": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == "burcDetay") {
          return
          MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(primarySwatch: Colors.pink),
      home: BurcListesi(),


    );
  }
}
