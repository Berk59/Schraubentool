import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:schraubentool/data_protection_page.dart';
import 'package:schraubentool/impressum_page.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import 'dart:html' as html;

class SchraubentoolPage extends StatefulWidget {
  const SchraubentoolPage({Key? key}) : super(key: key);

  @override
  _SchraubentoolPageState createState() => _SchraubentoolPageState();
}

class _SchraubentoolPageState extends State<SchraubentoolPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController faN = TextEditingController();
  TextEditingController lkmm = TextEditingController();
  TextEditingController EsNm2 = TextEditingController();
  TextEditingController EpNm2 = TextEditingController();
  TextEditingController dmm = TextEditingController();
  TextEditingController p = TextEditingController();
  TextEditingController l1mm = TextEditingController();
  TextEditingController lUGmm = TextEditingController();
  TextEditingController dWmm = TextEditingController();
  TextEditingController damm = TextEditingController();
  TextEditingController dhmm = TextEditingController();
  TextEditingController fZum = TextEditingController();

  TextEditingController anmm2 = TextEditingController();
  TextEditingController a3mm2 = TextEditingController();
  TextEditingController lSKmm = TextEditingController();
  TextEditingController lGmm = TextEditingController();
  TextEditingController lMmm = TextEditingController();
  TextEditingController deltaS = TextEditingController();

  TextEditingController aersmm = TextEditingController();

  TextEditingController pmmN = TextEditingController();

  TextEditingController n = TextEditingController();
  TextEditingController o = TextEditingController();
  TextEditingController aA = TextEditingController();
  TextEditingController fzN = TextEditingController();
  TextEditingController fvminN = TextEditingController();
  TextEditingController fvMax = TextEditingController();

  TextEditingController d2mm = TextEditingController();
  TextEditingController d3mm = TextEditingController();
  TextEditingController dSmm = TextEditingController();
  TextEditingController a5mm2 = TextEditingController();

  TextEditingController fasn = TextEditingController();
  TextEditingController fsmin = TextEditingController();
  TextEditingController fsmax = TextEditingController();

  TextEditingController umin = TextEditingController();
  TextEditingController umax = TextEditingController();
  TextEditingController omin = TextEditingController();
  TextEditingController omax = TextEditingController();

  List<String> verbindungsarten = ["DSV", "ESV"];
  String verbindungsart = "DSV";

  List<String> anziehkraefte = [
    "Schraubenschlüssel",
    "Schlagschrauber",
    "Drehschrauber",
    "Drehmomentschlüssel",
    "Hydraulisches Anziehen",
    "Drehwinkelgesteuertes Anziehen",
    "Streckgrenzengesteuertes Anziehen"
  ];
  String anziehkraft = "Schraubenschlüssel";

  List<String> faelle = [
    "Querbeanspruchte, reibschlüssige Schraubenverbindung",
    "Ungünstige Deckelverschraubung, Kraftangriff weit vor Trennfuge",
    "Typischer Normalfall",
    "Günstiger Fall mit Kraftangriff nahe Trennfuge"
  ];
  String fall = "Querbeanspruchte, reibschlüssige Schraubenverbindung";

  List<String> festigkeitsklassen = ["8.8", "10.9", "12.9"];
  String festigkeitsklasse = "8.8";






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildConnectionTypeDropdown(),
                    InputFieldWithLabel(r'F_{A} [N]', faN),
                    InputFieldWithLabel(r'l_{k} [mm]', lkmm),
                    InputFieldWithLabel("E_{S} [\\frac{N}{mm^2}]", EsNm2),
                    InputFieldWithLabel("E_{p}[\\frac{N}{mm^2}]", EpNm2),
                    InputFieldWithLabel("d  [mm]", dmm),
                    InputFieldWithLabel("P", p),
                    InputFieldWithLabel("l_{1} [mm]", l1mm),
                    InputFieldWithLabel("l_{UG} [mm]", lUGmm),
                    InputFieldWithLabel("d_{W} [mm]", dWmm),
                    InputFieldWithLabel("D_{A} [mm]", damm),
                    InputFieldWithLabel("d_{h} [mm]", dhmm),
                    InputFieldWithLabel("f_{Z} [\\mu m]", fZum),



                  ],
                ),
                  Column(
                    children: [
                      // Anziehverfahren DropdownMenu
                      buildTighteningProcedure(),

                      // Fall DropdownMenu
                      buildCaseDropdown(),

                      // Festigkeitsklasse DropdownMenu
                      buildStrengthClassDropdown(),
                      SizedBox(height: 20,),
                      buildCalcButton(),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 69,),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildBoltCompliance(),
                        SizedBox(
                          height: 80,
                        ),
                        buildReplacementCrosssectionSection(),
                        SizedBox(
                          height: 80,
                        ),
                        buildPlateComplianceSection(),
                        SizedBox(
                          height: 80,
                        ),
                        buildPreloadForceSection(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTensionProfileSection(),
                  SizedBox(
                    height: 80,
                  ),
                 buildTractionSection(),
                  SizedBox(
                    height: 80,
                  ),
                  buildSpannungSection(),
                  SizedBox(height: 30,)
                ],
              ),

              buildFooter()
            ],
          ),
        ),
      ),
    );

  }

  Widget InputFieldWithLabel(String text, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Container(
            width: 250,
            height: 4.3.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 14),
                controller: controller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(width: 6,),
          Math.tex(text, mathStyle: MathStyle.display) ,// Default

        ],
      ),
    );
  }

  Widget buildHeader() {
    bool isHover = false;
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Schraubentool", style: TextStyle(color: Colors.white, fontSize: 30),),
                Math.tex("_{für Luft- und Raumfahrtingenieure} ", textStyle: TextStyle(color: Colors.white, fontSize: 30),),

              ],
            ),

            Material(
              color: Colors.blueGrey,
              child: InkWell(
                  onTap: () {
                    html.window.open('https://github.com/Berk59/Schraubentool#readme',"_blank");
                  },
                  onHover: (val) {
                    setState(() {
                      isHover=val;
                    });
                  },

                  child: Text("View the Doc!", style: TextStyle(color: Colors.white, fontSize: 20),)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildConnectionTypeDropdown() {
    return  Container(
      margin: EdgeInsets.only(left: 1, top: 20),
      child: Row(
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
              width: 90,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: verbindungsart,
                  icon: Icon(Icons.arrow_downward_rounded),
                  elevation: 16,
                  onSaved: (String? newValue) {
                    setState(() {
                      print(verbindungsart);
                      verbindungsart = newValue!;
                      print(newValue);
                    });
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      print(verbindungsart);
                      verbindungsart = newValue!;
                      print(newValue);
                    });
                  },
                  items: verbindungsarten
                      .map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
          Text("Verbindungsart"),
        ],
      ),
    );
  }

  Widget buildTighteningProcedure() {
    return Container(
      margin: EdgeInsets.only(left: 1, top: 20),
      child: Row(
        children: [
          Text("Anziehverfahren"),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
              width: 600,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: anziehkraft,
                  icon: Icon(Icons.arrow_downward_rounded),
                  elevation: 16,
                  onSaved: (String? newValue) {
                    setState(() {
                      anziehkraft = newValue!;
                    });
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      print(verbindungsart);
                      anziehkraft = newValue!;
                    });
                  },
                  items: anziehkraefte
                      .map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCaseDropdown() {
    return Container(
      margin: EdgeInsets.only(left: 1, top: 20),
      child: Row(
        children: [
          Text("Fall"),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
              width: 600,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: fall,
                  icon: Icon(Icons.arrow_downward_rounded),
                  elevation: 16,
                  onSaved: (String? newValue) {
                    setState(() {
                      fall = newValue!;
                      print(newValue);
                    });
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      fall = newValue!;
                      print(newValue);
                    });
                  },
                  items: faelle.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildStrengthClassDropdown() {
    return Container(
      margin: EdgeInsets.only(left: 1, top: 20),
      child: Row(
        children: [
          Text("Festigkeitsklasse"),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
              width: 600,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: festigkeitsklasse,
                  icon: Icon(Icons.arrow_downward_rounded),
                  elevation: 16,
                  onSaved: (String? newValue) {
                    setState(() {
                      festigkeitsklasse = newValue!;
                      print(newValue);
                    });
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      festigkeitsklasse = newValue!;
                      print(newValue);
                    });
                  },
                  items: festigkeitsklassen
                      .map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildCalcButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(

        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),

        ),

        onPressed: () {
          /*faN.text = "261.904761";
                          lkmm.text = "83";
                          EsNm2.text = "199000";
                          EpNm2.text = "27000";
                          dmm.text = "14";
                          p.text = "1.5";
                          l1mm.text = "84";
                          lUGmm.text = "1";
                          dWmm.text = "26";
                          damm.text = "45";
                          dhmm.text = "15";
                          fZum.text = "8";*/
          calc();
        },
        child: const Text('Berechnen!'),
      ),
    );
  }

  Widget buildBoltCompliance() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              "Schraubennachgiebigkeit ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Math.tex("\\delta_{S}", textStyle: TextStyle(fontWeight: FontWeight.bold)),
          ]),
          Row(
            children: [
              InputFieldWithLabel("A_{N} [mm^2]", anmm2),
              InputFieldWithLabel("A_{3} [mm^2]", a3mm2),
            ],
          ),
          Row(
            children: [
              InputFieldWithLabel("l_{SK} [mm]", lSKmm),
              InputFieldWithLabel("l_{G} [mm]", lGmm),
              InputFieldWithLabel("l_{M} [mm]", lMmm),
              InputFieldWithLabel("\\delta_{S} [\\frac{mm}{N}]", deltaS),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildReplacementCrosssectionSection() {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Text(
              "Ersatzquerschnitt ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Math.tex("A_{ers}", textStyle: TextStyle(fontWeight: FontWeight.bold)),
          ]),
          Row(
            children: [
              InputFieldWithLabel("A_{ers} [mm^2]", aersmm),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPlateComplianceSection() {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Text(
              "Plattennachgiebigkeit ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Math.tex("\\delta_{P}", textStyle: TextStyle(fontWeight: FontWeight.bold)),
          ]),
          Row(
            children: [
              InputFieldWithLabel("\\delta_{P} [\\frac{mm}{N}]", pmmN),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPreloadForceSection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vorspannkraft ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Math.tex("F_{V}", textStyle: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  InputFieldWithLabel("n", n),
                  InputFieldWithLabel("\\Phi", o),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputFieldWithLabel("\\alpha_{A}", aA),
                  InputFieldWithLabel("F_{Z} [N]", fzN),
                  InputFieldWithLabel("F_{V_{min}} [N]", fvminN),
                  InputFieldWithLabel("F_{V_{max}} [N]", fvMax),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTensionProfileSection() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              "Spannungsquerschnitt ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Math.tex("A_{S}", textStyle: TextStyle(fontWeight: FontWeight.bold)),
          ]),
          Row(
            children: [
              InputFieldWithLabel("d_{2} [mm]", d2mm),
              InputFieldWithLabel("d_{3} [mm]", d3mm),
            ],
          ),
          Row(
            children: [
              InputFieldWithLabel("d_{S} [mm]", dSmm),
              InputFieldWithLabel("A_{S} [mm^2]", a5mm2),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTractionSection() {
    return  Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              "Zugkraft an der Schraube ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Math.tex("F_{s}", textStyle: TextStyle(fontWeight: FontWeight.bold)),
          ]),
          Row(
            children: [
              InputFieldWithLabel("F_{AS} [N]", fasn),
              InputFieldWithLabel("F_{Smin} [N]", fsmin),
              InputFieldWithLabel("F_{Smax} [N]", fsmax),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSpannungSection() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              "Spannung ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Math.tex("\\sigma", textStyle: TextStyle(fontWeight: FontWeight.bold)),
          ]),
          Row(
            children: [
              InputFieldWithLabel("\\sigma_{min}", omin),
              InputFieldWithLabel("\\sigma_{max}", omax),
            ],
          ),
          Row(
            children: [
              InputFieldWithLabel("\\mu_{min}", umin),
              InputFieldWithLabel("\\mu_{max}", umax),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFooter() {
    bool isHover = false;
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Material(
              color: Colors.blueGrey,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImpressumPage()));
                  },
                  child: Text("Impressum", style: TextStyle(color: Colors.white, fontSize: 20),)),
            ),
            SizedBox(height: 10,),
            Material(
              color: Colors.blueGrey,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataProtectionPage()));
                  },
                  child: Text("Datenschutzerklärung", style: TextStyle(color: Colors.white, fontSize: 20),)),
            ),
          ],
        ),
      ),
    );
  }


  double getAlphaA(String anziehverfahren) {
    double alphaA = 0.0;

    switch (anziehverfahren) {
      case "Schraubenschlüssel":
        alphaA = 4.0;
        break;
      case "Schlagschrauber":
        alphaA = 4.0;
        break;
      case "Drehschrauber":
        alphaA = 2.5;
        break;
      case "Drehmomentschlüssel":
      case "Hydraulisches Anziehen":
        alphaA = 1.6;
        break;
      case "Drehwinkelgesteuertes Anziehen":
      case "Streckgrenzengesteuertes Anziehen":
        alphaA = 1.0;
        break;
    }
    print("alpha_A: ");
    print(alphaA);
    print("");
    return alphaA;
  }

  double getNFall(String fall) {
    double n = 0.0;
    switch (fall) {
      case "Querbeanspruchte, reibschlüssige Schraubenverbindung":
        n = 1.0;
        break;
      case "Ungünstige Deckelverschraubung, Kraftangriff weit vor Trennfuge":
        n = 0.7;
        break;
      case "Typischer Normalfall":
        n = 0.5;
        break;
      case "Günstiger Fall mit Kraftangriff nahe Trennfuge":
        n = 0.3;
        break;

    }
    print("n: ");
    print(n);
    print("");
    return n;
  }

  double getFestigkeit(String festigkeitsklasse) {
    double rp02 = 0.0;
    switch (festigkeitsklasse) {
      case "8.8":
        rp02 = 640.0;
        break;
      case "10.9":
        rp02 = 900.0;
        break;
      case "12.9":
        rp02 = 1000.0;
        break;
    }
    print("rp02: ");
    print(rp02);
    print("");
    return rp02;
  }

  double getL_Mcheck(String verbindungsart, double D) {
    double lM = 0.0;

    switch (verbindungsart) {
      case "DSV":
        lM = 0.4 * D;
        break;
      case "ESV":
        lM = 0.33 * D;
        break;
    }
    print("lM: ");
    print(lM);
    print("");
    return lM;

  }

  double erstazquerschnitt(double d_w, double d_a,double  l_k,double  d_h, String verbindungsart) {
    String bedingung_out = "";
    double A_ers = 0;
    String x_Eq = "";
    num x = 0;
    if (d_w >= d_a) {
      bedingung_out = "\$d_W \\geq D_A\$";
      A_ers = (math.pi/4.0)*(math.pow(d_a, 2.0)-math.pow(d_h, 2.0));
      x_Eq = "\$x=0\$";
    } else if (d_a<=(d_w+l_k)) {
      bedingung_out = "\$D_A \\leq d_W+l_k\$";
      if (verbindungsart == "DSV") {
        x_Eq = "\$x=\\sqrt[3]{\\frac{l_k \\cdot d_w}{D_A^2}}\$";
        x = math.pow(((l_k*d_w)/math.pow(d_a, 2.0)), 1.0/3.0);
      } else if (verbindungsart == "ESV") {
        x_Eq = "\$x=\\left(\\frac{l_k}{D_A}\\right)^{0,2}\$";
        x = math.pow((l_k/d_a), 0.2);
      } else {
        x_Eq = "ERROR";
      }
      A_ers =  (math.pi/4.0)*(math.pow(d_w, 2)-math.pow(d_h, 2.0))+(math.pi/8.0)*d_w*(d_a-d_w)*((math.pow(x+1, 2.0))-1.0);
    } else if (d_a>= d_w+l_k) {
      bedingung_out = "\$D_A \\geq d_W+l_k\$";

      if (verbindungsart == "DSV") {
        x_Eq = "\$x=\\sqrt[3]{\\frac{l_k \\cdot d_w}{(d_w+l_k)^2}}\$";
        x = math.pow(((l_k*d_w)/(math.pow(d_w+l_k, 2.0))), (1.0/3.0));
      } else if (verbindungsart == "ESV") {
        x_Eq = "\$x=\\left(\\frac{l_k}{d_w+l_k}\\right)^{0,2}\$";
        x = math.pow((l_k/(d_w+l_k)), 0.2);
      } else {
        x_Eq = "ERROR";
      }
      A_ers = (math.pi/4.0)*(math.pow(d_w, 2)-math.pow(d_h, 2))+(math.pi/8.0)*d_w*l_k*((math.pow(x+1.0, 2.0))-1.0);

    } else {
      bedingung_out = "ERROR";
    }

    print("A_ers: ");
    print(A_ers);
    print("");
    return A_ers;
  }

  void calc() {
    double d = double.parse(dmm.text.trim());
    double alpha_A = getAlphaA(anziehkraft);
    double n = getNFall(fall);
    double rp02 = getFestigkeit(festigkeitsklasse);
    double l_M = getL_Mcheck(verbindungsart, d);

    aA.text = alpha_A.toString();
    this.n.text = n.toString();
    lMmm.text = l_M.toString();



    //Berechnungen
    double l_Sk = 0.5*d;
    double l_G = 0.5*d;
    double d_2 = d-0.64952*double.parse(p.text.trim());
    double d_3 = d-1.22687*double.parse(p.text.trim());
    double d_S = 0.5*(d_2+d_3);
    double a_N = (math.pi * math.pow(d, 2.0)) / 4.0;
    double a_2 = (math.pi * math.pow(d_2, 2.0)) / 4.0;
    double a_3 = (math.pi * math.pow(d_3, 2.0)) / 4.0;

    d2mm.text = d_2.toString();
    d3mm.text = d_3.toString();
    dSmm.text = d_S.toString();
    anmm2.text = a_N.toString();
    a3mm2.text = a_3.toString();
    lSKmm.text = l_Sk.toString();
    lGmm.text = l_G.toString();



    print("d_S");



    //Schraubennachgiebigkeit
    double delta_S = (1/double.parse(EsNm2.text.trim())) * ((l_Sk/a_N) + (double.parse(l1mm.text.trim())/a_N) + (l_G/a_3)  + (double.parse(lUGmm.text.trim())/a_3) + (l_M/a_N));
    deltaS.text = delta_S.toString();

    //Ersatzquerschnitt
    double A_ers = erstazquerschnitt(double.parse(dWmm.text.trim()), double.parse(damm.text.trim()), double.parse(lkmm.text.trim()), double.parse(dhmm.text.trim()), verbindungsart);
    aersmm.text = A_ers.toString();

    //Plattennachgiebigkeit
    double delta_P = double.parse(lkmm.text.trim()) / (double.parse(EpNm2.text.trim()) * A_ers);
    this.pmmN.text = delta_P.toString();

    //Vorspannkraft
    double phi = n*delta_P/(delta_P+delta_S);
    double f_z = (double.parse(fZum.text.trim())*(math.pow(10.0, (-3.0)))) / (delta_S+delta_P);
    double F_Vmin = 0 + f_z + (1.0-phi) * double.parse(faN.text.trim()); // Die Null ist F_KLERF... Ka was das ist, muss nachfragen
    double F_Vmax = alpha_A * F_Vmin;

    this.o.text = phi.toString();
    fzN.text = f_z.toString();
    fvminN.text = F_Vmin.toString();
    fvMax.text = F_Vmax.toString();

    //Spannungsquerschnitt
    double a_S = (math.pi*math.pow((d_S), 2.0) / 4.0);
    a5mm2.text = a_S.toString();

    //Zugkraft an der Schraube
    double F_as = 0.1* rp02*a_S;
    double F_Smin = F_Vmin + F_as;
    double F_Smax = F_Vmax+F_as;

    fasn.text = F_as.toString();
    fsmin.text = F_Smin.toString();
    fsmax.text = F_Smax.toString();

    //Spannung
    double sigma_min = F_Smin/a_S;
    double sigma_max = F_Smax/a_S;

    omin.text = sigma_min.toString();
    omax.text = sigma_max.toString();

    //Sicherheit
    double mu_min = rp02 / (sigma_min*1.5);
    double mu_max = rp02 / (sigma_max*1.5);

    umin.text = mu_min.toString();
    umax.text = mu_max.toString();

    print("""$verbindungsart
    ${faN.text}
    ${lkmm.text}
    ${EsNm2.text}
    ${EpNm2.text}
    ${dmm.text}
    ${p.text}
    ${l1mm.text}
    ${lUGmm.text}
    ${dWmm.text}
    ${damm.text}
    ${dhmm.text}
    ${fZum.text}
    $anziehkraft
    $fall
    $festigkeitsklasse
    """);


    print("mu_min = $mu_min");
    print("mu_max = $mu_max");
  }


}