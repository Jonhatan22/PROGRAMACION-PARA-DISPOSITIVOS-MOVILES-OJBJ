//Copia eliminada 
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Contador(),
    );
  }
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int cont = 1;
  String mensaje = "Hola mundo";
  bool lightOn = false;

  void toggleLight() {
    setState(() {
      lightOn = !lightOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio Jonathan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Valor de contador',
              style: TextStyle(fontSize: 35, color: Colors.blue),
            ),
            Text(
              cont.toString(),
              style: const TextStyle(fontSize: 50, color: Colors.red),
            ),
            Icon(
              Icons.lightbulb,
              color: lightOn
                  ? Colors.amber
                  : Colors
                      .grey, // Cambia el color según el estado de la bombilla
              size: 50,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cont++;
          });
          // Inicia un temporizador para encender y apagar la bombilla 5 veces
          int toggleCount = 0;
          const int totalToggles = 10;
          const Duration toggleDuration =
              Duration(milliseconds: 600); // Cambia la duración según lo desees
          Timer.periodic(toggleDuration, (timer) {
            if (toggleCount < totalToggles) {
              toggleLight();
              toggleCount++;
            } else {
              timer.cancel();
            }
          });
        },
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
