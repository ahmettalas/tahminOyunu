import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tahmin_uygulamasi/sonucEkrani.dart';

class tahminEkrani extends StatefulWidget {
  @override
  State<tahminEkrani> createState() => _tahminEkraniState();
}

class _tahminEkraniState extends State<tahminEkrani> {
  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rastgeleSayi = Random().nextInt(101); // 0 - 100
    print("Rastgele sayı : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Tahmin Ekranı",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak : $kalanHak",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Yardım : $yonlendirme",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: "Tahmin",
                ),
              ),
            ),
            SizedBox(
              width: 230,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Tahmin Et",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  /*  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => sonucEkrani()));
                  */
                  setState(() {
                    kalanHak--;
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if (tahmin == rastgeleSayi) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => sonucEkrani(
                                  sonuc: true,
                                )));
                    return;
                  }

                  if (tahmin > rastgeleSayi) {
                    setState(() {
                      yonlendirme = "tahmini azalt";
                    });
                  }
                  if (tahmin < rastgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini arttır";
                    });
                  }
                  if (kalanHak == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => sonucEkrani(
                                  sonuc: false,
                                )));
                  }
                  tfTahmin.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
