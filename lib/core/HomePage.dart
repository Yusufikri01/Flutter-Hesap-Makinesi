import 'package:calculator/ui/Color_Schemes.dart';
import 'package:calculator/widget/Special_Button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorSchemes get _colorschemes => ColorSchemes.instance;
  String sonuc = '0';
  List<String> button = [
    "AC",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "£",
    "0",
    ",",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  sonuc,
                  style: TextStyle(fontSize: 48.0, color: _colorschemes.white),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: button.length,
                  itemBuilder: (context, index) {
                    if (index == 0 || index == 1 || index == 2) {
                      return SpecialButton(
                        () => Hesaplama(button[index]),
                        button[index],
                        _colorschemes.grey,
                        _colorschemes.black,
                      );
                    } else if (index == button.length - 1 ||
                        index == 3 ||
                        index == 7 ||
                        index == 11 ||
                        index == 15) {
                      return SpecialButton(
                        () => Hesaplama(button[index]),
                        button[index],
                        _colorschemes.orange,
                        _colorschemes.white,
                      );
                    } else {
                      return SpecialButton(
                        () => Hesaplama(button[index]),
                        button[index],
                        _colorschemes.black45,
                        _colorschemes.white,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Hesaplama(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        sonuc = '0';
      } else if (buttonText == "DEL") {
        if (sonuc == "Error") {
          // Sonuç Error çıkarsa Del tek tek silmesin
        } else {
          if (sonuc.isNotEmpty) {
            sonuc = sonuc.substring(0, sonuc.length - 1);
          }
        }
      } else if (buttonText == "=") {
        try {
          evalExpression(sonuc);
        } catch (e) {
          sonuc = 'Error';
        }
      } else {
        if (sonuc == "0") {
          sonuc = "";
        }
        sonuc += buttonText;
      }
    });
  }

  String evalExpression(String expression) {
    String finalquestion = sonuc.replaceAll(',', '.');
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    sonuc = eval.toStringAsFixed(2);

    return sonuc;
  }
}
