import 'package:flutter/material.dart';

class Fuel extends StatefulWidget {
  const Fuel({Key? key}) : super(key: key);

  @override
  State<Fuel> createState() => _FuelState();
}

class _FuelState extends State<Fuel> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var _textoResultado = "";

  void _calcular() {
    double precoAlcool =
        double.tryParse(_controllerAlcool.text.replaceAll(",", ".")) ?? 0.0;
    double precoGasolina =
        double.tryParse(_controllerGasolina.text.replaceAll(",", ".")) ?? 0.0;

    print("Álcool: " + precoAlcool.toString());
    print("Gasolina: " + precoGasolina.toString());

    if (precoAlcool == 0.0 || precoGasolina == 0.0) {
      setState(() {
        _textoResultado =
            "Preço inválido, por favor digite um número maior que 0 e utilizando \".\"";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com álcool";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 16, left: 22),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerAlcool,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
                    ),
                    TextField(
                      controller: _controllerGasolina,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Preço Gasolina, ex: 3.15"),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 45,
                    width: 330,
                    child: ElevatedButton(
                      onPressed: _calcular,
                      child: Text(
                        "Calcular",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade900),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ]),
          )),
    );
  }
}
