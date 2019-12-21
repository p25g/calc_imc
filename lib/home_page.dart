import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  String _infoText = "Informe seus dados!";

  void _reflesh() {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      _infoText = "Informe seus dados!";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      if (imc <= 18.59) {
        _infoText = "IMC: ${imc.toStringAsFixed(2)} Abaixo do peso";
      } else if (imc >= 18.6 && imc <= 24.99) {
        _infoText = "IMC: ${imc.toStringAsFixed(2)} peso ideal";
      } else if (imc >= 25 && imc <= 29.99) {
        _infoText = "IMC: ${imc.toStringAsFixed(2)} levimente acima do peso";
      } else if (imc >= 30 && imc <= 34.99) {
        _infoText = "IMC: ${imc.toStringAsFixed(2)} obesidade grau 1 (Pré-obesidade)";
      } else if (imc >= 35 && imc <= 39.99) {
        _infoText = "IMC: ${imc.toStringAsFixed(2)} obesidade grau 2 (Severa) ";
      } else if (imc >= 40 ){
        _infoText = "IMC ${imc.toStringAsFixed(2)} obesidade grau 3 (Mórbida)";
      }
    });
  }

  Widget _buttonAction(IconData icon, Function callback) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(icon, size: 35, color: Colors.blue),
      ),
      onTap: callback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IMC Calculadora",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            height: 700,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/imcc.png',
                    width: double.maxFinite,
                    height: 200,
                  ),
                ),
                Positioned(
                  top: 171,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                    width: 470,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(115.0),
                        )),
                    child: Column(children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Peso em (Kg)",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white, fontSize: 25.0),
                        controller: pesoController,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Altura em (Cm)",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white, fontSize: 25.0),
                        controller: alturaController,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Container(
                          height: 60,
                          child: Text(
                            _infoText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buttonAction(Icons.refresh, () {
              _reflesh();
            }),
            _buttonAction(Icons.done_outline, () {
              _calcular();
            }),
          ],
        ),
      ),
    );
  }
}
