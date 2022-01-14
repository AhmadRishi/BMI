import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State {
  Widget te(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black));
  }

  bool _isMale = false;
  int _weight = 50;
  int _age = 18;
  double _height = 105.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Body Mass Index",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  boxOption('male'),
                  const SizedBox(
                    width: 15,
                  ),
                  boxOption('female'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Height",
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    _height.toStringAsFixed(1) + " CM",
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                    min: 105,
                    max: 210,
                    value: _height,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  incBox('weight'),
                  const SizedBox(
                    width: 15,
                  ),
                  incBox('age'),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.teal,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 16,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                            result: _weight / ((_height * _height) / 10000),
                            isMale: _isMale,
                            age: _age)));
              },
              child: const Text(
                'Calculate',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      )),
    );
  }

  Expanded boxOption(String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () => setState(() {
        _isMale = type == 'male' ? true : false;
      }),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: (_isMale && type == 'male') || (!_isMale && type == 'female')
                ? Colors.teal
                : Colors.grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'male' ? Icons.male : Icons.female,
              size: 90,
            ),
            const SizedBox(
              height: 15,
            ),
            te(type == 'male' ? "Male" : "Female")
          ],
        ),
      ),
    ));
  }

  Expanded incBox(String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: (Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          te(type == 'weight' ? "Weight" : "Age"),
          Text(
            type == 'weight' ? _weight.toString() : _age.toString(),
            style: const TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: 'null',
                onPressed: () => setState(() {
                  if (type == 'weight' && _weight < 260) _weight++;
                  if (type == 'age' && _age < 200) _age++;
                }),
                child: const Icon(
                  Icons.add,
                ),
                mini: true,
              ),
              FloatingActionButton(
                heroTag: 'btn2',
                onPressed: () => setState(() {
                  if (_weight > 0 && type == 'weight')
                    _weight--;
                  else if (_age > 0 && type == 'age') _age--;
                }),
                child: const Icon(
                  Icons.remove,
                ),
                mini: true,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
