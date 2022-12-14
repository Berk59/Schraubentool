import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

class SchraubentoolPageOld extends StatefulWidget {
  const SchraubentoolPageOld({Key? key}) : super(key: key);

  @override
  _SchraubentoolPageOldState createState() => _SchraubentoolPageOldState();
}

class _SchraubentoolPageOldState extends State<SchraubentoolPageOld> {
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
    "Schraubenschl??ssel",
    "Schlagschrauber",
    "Drehschrauber",
    "Drehmomentschl??ssel",
    "Hydraulisches Anziehen",
    "Drehwinkelgesteuertes Anziehen",
    "Streckgrenzengesteuertes Anziehen"
  ];
  String anziehkraft = "Schraubenschl??ssel";

  List<String> faelle = [
    "Querbeanspruchte, reibschl??ssige Schraubenverbindung",
    "Ung??nstige Deckelverschraubung, Kraftangriff weit vor Trennfuge",
    "Typischer Normalfall",
    "G??nstiger Fall mit Kraftangriff nahe Trennfuge"
  ];
  String fall = "Querbeanspruchte, reibschl??ssige Schraubenverbindung";

  List<String> festigkeitsklassen = ["8.8", "10.9", "12.9"];
  String festigkeitsklasse = "8.8";

  Widget InputFieldWithLabelq(String text, TextEditingController controller) {
    return Container(
      color: Colors.yellow,
      margin: EdgeInsets.only(left: 0, top: 10),
      child: Row(
        children: [
          Padding(
            //padding: const EdgeInsets.symmetric(horizontal: 5.0),
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 5.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                style: TextStyle(fontSize: 12),
                controller: controller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget InputFieldWithLabel(String text, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Container(
            width: 5.4.w,
            height: 4.h,
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
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 30),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Verbindungsart DropdownMenu
                    Container(
                      margin: EdgeInsets.only(left: 1, top: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Container(
                              width: 5.w,
                              height: 5.h,
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
                    ),
                    InputFieldWithLabel("Fa [N]", faN),
                    InputFieldWithLabel("lk [mm]", lkmm),
                    InputFieldWithLabel("Es [N/mm^2]", EsNm2),
                    InputFieldWithLabel("Ep[N/mm^2]", EpNm2),
                    InputFieldWithLabel("d [mm]", dmm),
                    InputFieldWithLabel("P", p),
                    InputFieldWithLabel("l1 [mm]", l1mm),
                    InputFieldWithLabel("lUG [mm]", lUGmm),
                    InputFieldWithLabel("dW [mm]", dWmm),
                    InputFieldWithLabel("DA [mm]", damm),
                    InputFieldWithLabel("dh [mm]", dhmm),
                    InputFieldWithLabel("fZ [um]", fZum),

                    // Anziehverfahren DropdownMenu
                    Container(
                      margin: EdgeInsets.only(left: 1, top: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Container(
                              width: 20.w,
                              height: 5.h,
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
                          Text("Anziehverfahren"),
                        ],
                      ),
                    ),
                    // Fall DropdownMenu
                    Container(
                      margin: EdgeInsets.only(left: 1, top: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Container(
                              width: 29.w,
                              height: 5.h,
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
                          Text("Fall"),
                        ],
                      ),
                    ),
                    // Festigkeitsklasse DropdownMenu
                    Container(
                      margin: EdgeInsets.only(left: 1, top: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Container(
                              width: 10.w,
                              height: 5.h,
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
                          Text("Festigkeitsklasse"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.black,
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
                      child: const Text('Berechne den Shit Baby!'),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              "Schraubennachgiebigkeit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(
                            children: [
                              InputFieldWithLabel("AN [mm^2]", anmm2),
                              InputFieldWithLabel("A3 [mm^2]", a3mm2),
                            ],
                          ),
                          Row(
                            children: [
                              InputFieldWithLabel("lSK [mm]", lSKmm),
                              InputFieldWithLabel("lG [mm]", lGmm),
                              InputFieldWithLabel("lM [mm]", lMmm),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              "Ersatzquerschnitt Aers",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Da <= dW + lK"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("x = sqrt3((lk * dW) / DA^2)"),
                                ],
                              ),
                              InputFieldWithLabel("Aers [mm^2]", aersmm),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              "Plattennachgiebigkeit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(
                            children: [
                              InputFieldWithLabel("P [mm/N]", pmmN),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              "Vorspannkraft FV",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(
                            children: [
                              Column(
                                children: [
                                  InputFieldWithLabel("n", n),
                                  InputFieldWithLabel("O", o),
                                ],
                              ),
                              Column(
                                children: [
                                  InputFieldWithLabel("aA", aA),
                                  InputFieldWithLabel("FZ [N]", fzN),
                                  InputFieldWithLabel("FVmin [N]", fvminN),
                                  InputFieldWithLabel("FVmax [N]", fvMax),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              "Spannungsquerschnitt",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(
                            children: [
                              InputFieldWithLabel("d2[mm]", d2mm),
                              InputFieldWithLabel("d3[mm]", d3mm),
                            ],
                          ),
                          Row(
                            children: [
                              InputFieldWithLabel("d5[mm]", dSmm),
                              InputFieldWithLabel("A5[mm^2]", a5mm2),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              "Zugkraft an der Schraube Fs",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(
                            children: [
                              InputFieldWithLabel("FAS[N]", fasn),
                              InputFieldWithLabel("FSmin[N]", fsmin),
                              InputFieldWithLabel("FSmax[N]", fsmax),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              "Plattennachgiebigkeit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(
                            children: [
                              InputFieldWithLabel("o min", omin),
                              InputFieldWithLabel("o max", omax),
                            ],
                          ),
                          Row(
                            children: [
                              InputFieldWithLabel("u min", umin),
                              InputFieldWithLabel("u max", umax),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double getAlphaA(String anziehverfahren) {
    double alphaA = 0.0;

    switch (anziehverfahren) {
      case "Schraubenschl??ssel":
        alphaA = 4.0;
        break;
      case "Schlagschrauber":
        alphaA = 4.0;
        break;
      case "Drehschrauber":
        alphaA = 2.5;
        break;
      case "Drehmomentschl??ssel":
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
      case "Querbeanspruchte, reibschl??ssige Schraubenverbindung":
        n = 1.0;
        break;
      case "Ung??nstige Deckelverschraubung, Kraftangriff weit vor Trennfuge":
        n = 0.7;
        break;
      case "Typischer Normalfall":
        n = 0.5;
        break;
      case "G??nstiger Fall mit Kraftangriff nahe Trennfuge":
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
