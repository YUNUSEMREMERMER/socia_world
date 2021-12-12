import 'package:flutter/material.dart';
import 'package:socia_world/gonderikarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String? isimSoyad;
  final String? kullaniciAdi;
  final String? kapakResimLinki;
  final String? profilResimLinki;

  const ProfilSayfasi(
      {Key? key,
      this.isimSoyad,
      this.kullaniciAdi,
      this.kapakResimLinki,
      this.profilResimLinki})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 230.0,
                  //color: Colors.yellow,
                ),
                Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: NetworkImage(kapakResimLinki.toString()),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    left: 20.0,
                    bottom: 0.0,
                    child: Hero(
                        tag: kullaniciAdi.toString(),
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(60.0),
                              border:
                                  Border.all(width: 2.0, color: Colors.white),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(profilResimLinki.toString()),
                                  fit: BoxFit.cover)),
                        ))),
                Positioned(
                    left: 145.0,
                    top: 190.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isimSoyad.toString(),
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          kullaniciAdi.toString(),
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )
                      ],
                    )),
                Positioned(
                    top: 130.0,
                    right: 15.0,
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[200],
                          border: Border.all(width: 2.0, color: Colors.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle,
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            "Takip Et",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 75.0,
              color: Colors.grey.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sayac("Takipçi", "20K"),
                  sayac("Takip", "500"),
                  sayac("Paylaşım", "75"),
                ],
              ),
            ),
            GonderiKarti(
              profilResimLinki: profilResimLinki.toString(),
              gonderiResimLinki: profilResimLinki.toString(),
              aciklama: "geçen seneden",
              gecenSure: "1 sene önce",
              isimSoyad: isimSoyad,
            )
          ],
        ));
  }

  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sayi,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 1,
        ),
        Text(
          baslik,
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        ),
      ],
    );
  }
}
