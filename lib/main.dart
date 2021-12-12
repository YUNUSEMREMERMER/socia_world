import 'package:flutter/material.dart';
import 'package:socia_world/profilsayfasi.dart';

import 'gonderikarti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
              size: 32,
            ),
            onPressed: () {}),
        title: Text(
          "Sociaworld",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          duyuru("Rabia seni takip etti", "3 dk önce"),
                          duyuru("Luna gönderine yorum yaptı", "13 dk önce"),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.notifications,
                color: Colors.purple[300],
                size: 32.0,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0)
            ]),
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profilKartiOlustur(
                    "Suude",
                    "https://cdn.pixabay.com/photo/2016/11/29/06/08/woman-1867715_960_720.jpg",
                    "Suude kocoglu",
                    "https://cdn.pixabay.com/photo/2021/12/01/14/10/cat-eyes-6838073_960_720.jpg"),
                profilKartiOlustur(
                    "Emre",
                    "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg",
                    "Emre Mermer",
                    "https://cdn.pixabay.com/photo/2021/11/28/16/26/bike-6830708_960_720.jpg"),
                profilKartiOlustur(
                    "Buket",
                    "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553_960_720.jpg",
                    "Buket kurtca",
                    "https://cdn.pixabay.com/photo/2021/11/28/16/26/bike-6830708_960_720.jpg"),
                profilKartiOlustur(
                    "Luna",
                    "https://cdn.pixabay.com/photo/2020/11/10/01/34/pet-5728249_960_720.jpg",
                    "Luna kurtca",
                    "https://cdn.pixabay.com/photo/2021/12/01/14/10/cat-eyes-6838073_960_720.jpg"),
                profilKartiOlustur(
                    "Ayşe",
                    "https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147_960_720.jpg",
                    "Ayşe Mermer",
                    "https://cdn.pixabay.com/photo/2021/11/27/12/16/mountain-6827881_960_720.jpg"),
                profilKartiOlustur(
                    "Rabia",
                    "https://cdn.pixabay.com/photo/2020/09/18/05/58/lights-5580916_960_720.jpg",
                    "Rabia Mermer",
                    "https://cdn.pixabay.com/photo/2021/12/01/14/10/cat-eyes-6838073_960_720.jpg"),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GonderiKarti(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2016/11/29/06/08/woman-1867715_960_720.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2016/11/29/06/08/woman-1867715_960_720.jpg",
            aciklama: "geçen seneden",
            gecenSure: "1 sene önce",
            isimSoyad: "Suude",
          ),
          GonderiKarti(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg",
            aciklama: "yeni foto",
            gecenSure: "2 ay önce",
            isimSoyad: "Emre",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.purple[300],
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mesaj,
            style: TextStyle(fontSize: 15.0),
          ),
          Text(gecenSure),
        ],
      ),
    );
  }

  Widget profilKartiOlustur(String kullaniciAdi, String resimLinki,
      String isimSoyad, String kapakResimLinki) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProfilSayfasi(
                        isimSoyad: isimSoyad,
                        profilResimLinki: resimLinki,
                        kapakResimLinki: kapakResimLinki,
                        kullaniciAdi: kullaniciAdi,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                      tag: kullaniciAdi,
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2.0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(35.0),
                            image: DecorationImage(
                                image: NetworkImage(resimLinki),
                                fit: BoxFit.cover)),
                      )),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              Text(
                kullaniciAdi,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
