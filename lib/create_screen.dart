import 'package:flutter/material.dart';
import 'package:irgisad/firestore.dart';

class CustomCounterTextField extends StatefulWidget {
  const CustomCounterTextField({super.key});

  @override
  _CustomCounterTextFieldState createState() => _CustomCounterTextFieldState();
}

class _CustomCounterTextFieldState extends State<CustomCounterTextField> {
  final FirestoreService firestoreService = FirestoreService();
  int count = 0;
  final _textControllerName = TextEditingController();
  final _textControllerDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/solar-box-broken.png',
            scale: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Number Of Item'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (count > 0) {
                      count--;
                    }
                  });
                },
              ),
              SingleChildScrollView(
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
          Text('Item Name'),
          TextField(
            controller: _textControllerName,

            style: TextStyle(color: Colors.black), // Mengatur warna teks input
            decoration: InputDecoration(
                hintText: 'Enter Name',
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Description'),
          TextField(
            controller: _textControllerDescription,

            style: TextStyle(color: Colors.black), // Mengatur warna teks input
            decoration: InputDecoration(
                hintText: 'Write Down Your Description',
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        firestoreService.addItem(_textControllerName.text,
                            _textControllerDescription.text, count);
                        _textControllerDescription.clear();
                        _textControllerName.clear();
                        
                      },
                      icon: Icon(
                        Icons.check_box,
                        size: 40,
                      )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
