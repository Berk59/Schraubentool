import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImpressumPage extends StatefulWidget {
  const ImpressumPage({Key? key}) : super(key: key);

  @override
  _ImpressumPageState createState() => _ImpressumPageState();
}

class _ImpressumPageState extends State<ImpressumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("IMPRESSUM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            Text("Angaben gemäß § 5 TMG", style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Ole Meiford\nWeilimdorfer Str.\n70469 Stuttgart"),
            SizedBox(height: 10,),
            Text("Vertreten durch:", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Ole Meiford"),

            SizedBox(height: 10,),
            Text("Kontakt:", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Telefon: +49 1511 5515576"),
            Text("E-Mail: omeif@outlook.com"),

            SizedBox(height: 10,),
            Text("Haftung für Links:", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Unser Angebot enthält Links zu externen Webseiten Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden\nInhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich.\nDie verlinkten Seiten wurden zum Zeitpunkt der\n Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer\nRechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen."),

            SizedBox(height: 20,),
            Text("Website Impressum erstellt durch impressum-generator.de von der Kanzlei Hasselbach"),
          ],
        ),
      ),

    );
  }
}
