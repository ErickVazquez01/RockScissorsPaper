import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int conteoMaquina = 0;
  String assetJugador = "assets/question.png";
  String assetMaquina = "assets/question.png";
  int conteoJugador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Piedra Papel o Tijera'),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text("Tu: $conteoJugador | Maquina: $conteoMaquina",
                  style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 50),
              //add elevated button with padding

              ElevatedButton(
                onPressed: () {
                  _procesar(1);
                },
                child: const Text('Piedra',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  _procesar(2);
                },
                child: const Text('Papel',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  _procesar(3);
                },
                child: const Text('Tijera',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 50),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    assetJugador,
                    width: 100,
                  ),
                  const SizedBox(width: 20),
                  const Text("VS",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 20),
                  Image.asset(
                    assetMaquina,
                    width: 100,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Jugador",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(width: 70),
                  Text("Maquina",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    conteoMaquina = 0;
                    conteoJugador = 0;
                    assetJugador = "assets/question.png";
                    assetMaquina = "assets/question.png";
                  });
                },
                child: const Text('Reiniciar',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _procesar(number) {
    int maquina = _randomNumber();
    if (number == maquina) {
      showToast("Empate");
      setState(() {
        if (number == 1) {
          assetJugador = "assets/piedra.png";
          assetMaquina = "assets/piedra.png";
        } else if (number == 2) {
          assetJugador = "assets/papel.png";
          assetMaquina = "assets/papel.png";
        } else if (number == 3) {
          assetJugador = "assets/tijeras.png";
          assetMaquina = "assets/tijeras.png";
        }
      });
    } else if (number == 1 && maquina == 2) {
      showToast("Perdiste");
      setState(() {
        assetJugador = "assets/piedra.png";
        assetMaquina = "assets/papel.png";
        conteoMaquina++;
      });
    } else if (number == 1 && maquina == 3) {
      showToast("Ganaste");
      setState(() {
        assetJugador = "assets/piedra.png";
        assetMaquina = "assets/tijeras.png";
        conteoJugador++;
      });
    } else if (number == 2 && maquina == 1) {
      showToast("Ganaste");
      setState(() {
        assetJugador = "assets/papel.png";
        assetMaquina = "assets/piedra.png";
        conteoJugador++;
      });
    } else if (number == 2 && maquina == 3) {
      showToast("Perdiste");
      setState(() {
        assetJugador = "assets/papel.png";
        assetMaquina = "assets/tijeras.png";
        conteoMaquina++;
      });
    } else if (number == 3 && maquina == 1) {
      showToast("Perdiste");
      setState(() {
        assetJugador = "assets/tijeras.png";
        assetMaquina = "assets/piedra.png";
        conteoMaquina++;
      });
    } else if (number == 3 && maquina == 2) {
      showToast("Ganaste");
      setState(() {
        assetJugador = "assets/tijeras.png";
        assetMaquina = "assets/papel.png";
        conteoJugador++;
      });
    }
  }

  _randomNumber() {
    return Random().nextInt(3) + 1;
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 20.0,
    );
  }
}
