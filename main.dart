import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(PayasoApp());

class PayasoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payaso Interactivo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: PayasoInteractivo(),
    );
  }
}

class PayasoInteractivo extends StatefulWidget {
  @override
  _PayasoInteractivoState createState() => _PayasoInteractivoState();
}

class _PayasoInteractivoState extends State<PayasoInteractivo> {
  Offset _posicion = Offset(200, 300); // Posición inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payaso Interactivo')),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _posicion = details.localPosition;
          });
        },
        child: Stack(
          children: [
            Positioned(
              left: _posicion.dx - 100,
              top: _posicion.dy - 150,
              child: CustomPaint(
                painter: PayasoPainter(),
                size: Size(200, 300), // Tamaño más grande
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Hola a todos, soy el payaso Deyvid',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PayasoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Cabeza
    paint.color = Colors.orange;
    canvas.drawCircle(Offset(size.width / 2, 60), 50, paint);

    // Sombrero
    paint.color = Colors.purple;
    canvas.drawRect(Rect.fromLTWH(size.width / 2 - 25, 10, 50, 25), paint);

    // Ojos
    paint.color = Colors.white;
    canvas.drawCircle(Offset(size.width / 2 - 18, 55), 6, paint);
    canvas.drawCircle(Offset(size.width / 2 + 18, 55), 6, paint);

    // Nariz
    paint.color = Colors.red;
    canvas.drawCircle(Offset(size.width / 2, 65), 7, paint);

    // Boca
    paint.color = Colors.black;
    canvas.drawArc(
      Rect.fromLTWH(size.width / 2 - 20, 80, 40, 20),
      0,
      pi,
      false,
      paint,
    );

    // Cuerpo
    paint.color = Colors.blue;
    canvas.drawRect(Rect.fromLTWH(size.width / 2 - 40, 110, 80, 120), paint);

    // Brazos
    paint.color = Colors.green;
    canvas.drawRect(Rect.fromLTWH(size.width / 2 - 80, 120, 40, 15), paint);
    canvas.drawRect(Rect.fromLTWH(size.width / 2 + 40, 120, 40, 15), paint);

    // Piernas
    paint.color = Colors.black;
    canvas.drawRect(Rect.fromLTWH(size.width / 2 - 30, 230, 15, 60), paint);
    canvas.drawRect(Rect.fromLTWH(size.width / 2 + 15, 230, 15, 60), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}