import 'package:flutter/material.dart';

void main()=> runApp(MovableContainer());
class MovableContainer extends StatefulWidget {
  @override
  _MovableContainerState createState() => _MovableContainerState();
}

class _MovableContainerState extends State<MovableContainer> {
  double xPosition = 100.0; // Starting X position
  double yPosition = 100.0; // Starting Y position

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Move the Container")),
        body: Stack(
          children: [
            Positioned(
              left: xPosition,
              top: yPosition,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    xPosition += details.delta.dx; // Update X position
                    yPosition += details.delta.dy; // Update Y position
                  });
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.blue,
                  child: Center(child: Text("Drag me", style: TextStyle(color: Colors.white))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
