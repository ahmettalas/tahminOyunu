import 'package:flutter/material.dart';

class sonucEkrani extends StatefulWidget {
  late bool sonuc;
  sonucEkrani({required this.sonuc});

  @override
  State<sonucEkrani> createState() => _sonucEkraniState();
}

class _sonucEkraniState extends State<sonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Sonuç Ekranı",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              widget.sonuc ? "Kazandınız!" : "Kaybettiniz!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 250,
                child: widget.sonuc
                    ? Image.asset("resimler/partyface.webp")
                    : Image.asset("resimler/sadface.png")),
            SizedBox(
              width: 230,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text("Tekrar Oyna."),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
