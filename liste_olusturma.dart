import 'package:burc_rehberi_proje1/home.dart';
import 'package:burc_rehberi_proje1/models/burc.dart';
import 'package:burc_rehberi_proje1/utils/strings.dart';
import 'package:flutter/material.dart';
import 'dart:math'as matematik;


class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;


  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynagiHazirla();

    return Scaffold(
      appBar: AppBar(

        title: Text("Burc rehberi"),
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add_location),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text("Contact"),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("FeedBack"),
              onTap: () {

              },
            ),
          ],
        ),
        elevation: 10,
      ),
      body: listeHazirla(),
    );
  }

  Widget listeHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirEklenenBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirEklenenBurc(BuildContext context, int index) {
    Burc oanListeyeEklenenBurc = tumBurclar[index];

    return  Card(
      elevation: 4,
      color: rastgeleRenkUret()    ,
      child: ListTile(
        onTap: ()=>Navigator.pushNamed(context, "/burcDetay/$index"),
        leading: Image.asset(
          "images/BurcImages/" + oanListeyeEklenenBurc.burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Text(
          oanListeyeEklenenBurc.burcAdi,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.pink.shade400),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            oanListeyeEklenenBurc.burcTarihi,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

List<Burc> veriKaynagiHazirla() {
  List<Burc> burclar = [];
  for (int i = 0; i < 12; i++) {
    String kucukResim =
        Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png"; // Koc-koc1.png
    String buyukResim = Strings.BURC_ADLARI[i].toLowerCase() +
        "_buyuk" +
        "${i + 1}.png"; // koc-koc-_buyuk1.png

    Burc eklencekBurc = Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i], kucukResim, buyukResim);
    burclar.add(eklencekBurc);
  }
  return burclar;
}

  Color rastgeleRenkUret() {
    return Color.fromARGB(
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255));
  }

