import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultipleChoiceSelector(),
    );
  }
}

class MultipleChoiceSelector extends StatefulWidget {
  @override
  _MultipleChoiceSelectorState createState() => _MultipleChoiceSelectorState();
}

class _MultipleChoiceSelectorState extends State<MultipleChoiceSelector> {
  int? selectedOption; // Track the selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple Choice Selector"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildOption(1, "Option 1"),
          buildOption(2, "Option 2"),
          buildOption(3, "Option 3"),
          buildOption(4, "Option 4"),
        ],
      ),
    );
  }

  Widget buildOption(int value, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = value;
        });
      },
      child: Row(
        children: [
          SizedBox(width: 20),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blueAccent, width: 2),
            ),
            child: Center(
              child: selectedOption == value
                  ? Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
              )
                  : Container(), // Empty container when not selected
            ),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
