import 'package:flutter/material.dart';

class Draftpage extends StatefulWidget {
  const Draftpage({Key? key}) : super(key: key);

  @override
  State<Draftpage> createState() => _DraftpageState();
}

class _DraftpageState extends State<Draftpage> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text("Checkbox"),
            Checkbox(
                value: _value,
                onChanged: (val) {
                  setState(() {
                    _value = val!;
                    print(_value);
                  });
                })
          ],
        ),
      ),
    ));
  }
}
