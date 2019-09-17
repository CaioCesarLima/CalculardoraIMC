import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _peso = TextEditingController();
  TextEditingController _altura = TextEditingController();

  String infoText = "Informe seus Dados";

  void _resetFields() {
    setState(() {
      _peso.text = "";
      _altura.text = "";
      infoText = "Informe seus Dados";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(_peso.text);
      double altura = double.parse(_altura.text) / 100;

      double imc = peso / (altura * altura);

      if (imc < 18) {
        infoText = "Abaixo do peso, IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 18 && imc < 25) {
        infoText = "Peso ideal, IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 25 && imc < 30) {
        infoText = "Sobrepeso, IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 30 && imc < 35) {
        infoText = "Obesidade grau 1, IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 35 && imc <= 40) {
        infoText = "Obesidade grau 2, IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc > 40) {
        infoText = "Obesidade grau 3, IMC: ${imc.toStringAsPrecision(3)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora IMC"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFields();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: TextField(
                  controller: _peso,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: TextField(
                  controller: _altura,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (Cm)",
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: FlatButton(
                    child: Text("Verificar"),
                    onPressed: () {
                      _calcular();
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Resultado:",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: Center(
                    child: Text(
                  "$infoText",
                  style: TextStyle(),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 90,
            child: Center(
                child: Text(
              "Menu",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.blue))),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text('IMC'),
            ),
          ),
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.blue))),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fmc()),
                );
              },
              child: Text('FMC'),
            ),
          )
        ],
      ),
    );
  }
}

class Fmc extends StatefulWidget {
  @override
  _FmcState createState() => _FmcState();
}

class _FmcState extends State<Fmc> {
  TextEditingController _idade = TextEditingController();
  TextEditingController _batimentos = TextEditingController();

  String _infoText = "Informe seus Dados";
  String _infoTextBatimentos = "Informe o número de batimentos contados";

  void _resetFields() {
    setState(() {
      _idade.text = "";
      _batimentos.text = "";
      _infoText = "Informe seus Dados";
    });
  }

  void _calcular() {
    setState(() {
      int idade = int.parse(_idade.text);
      int menosidade = 220 - idade;
      double maxcardia = menosidade * 85 / 100;
      print(maxcardia);
      _infoText =
          "Sua frequência  máxima cardiáca é: ${maxcardia.toStringAsFixed(0)}";
    });
  }

  void calculoBatimentos() {
    setState(() {
      int batimentos = int.parse(_batimentos.text);
      int result = batimentos * 6;
      
      _infoTextBatimentos =
          "Sua frequência cardiáca no momento é: ${result.toStringAsFixed(0)} bpm";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 80,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: TextField(
                  controller: _idade,
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Idade",
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: FlatButton(
                    child: Text("Calcular frequência máxima cardiáca"),
                    onPressed: () {
                      _calcular();
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Resultado:",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                margin: EdgeInsets.all(6),
                width: double.infinity,
                child: Center(
                    child: Text(
                  "$_infoText",
                  style: TextStyle(),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(6),
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Faça a contagem de batimentos durante 10 segundos e informe para o calculo de sua frequência cardiáca",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                )),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: TextField(
                  controller: _batimentos,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Batimentos",
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: FlatButton(
                    child: Text("Verificar bpm"),
                    onPressed: () {
                      calculoBatimentos();
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: Center(
                    child: Text(
                  "$_infoTextBatimentos",
                  style: TextStyle(),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
