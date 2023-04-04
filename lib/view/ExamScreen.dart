import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maatrixflutter/data/constant/MyConstant.dart';

import '../utils/TriangleClipper.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);
  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final List<String> myList = ["1", "2", "3", "4","5","6","7","8","9","10"];
  String selectedOption = 'Option 1';
  int _selectedValue = 1;
  int timerSeconds = 0;
  int timerMinutes = 0;
  int timerHours = 0;
   late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timerSeconds++;
        if (timerSeconds == 60) {
          timerSeconds = 0;
          timerMinutes++;
        }
        if (timerMinutes == 60) {
          timerMinutes = 0;
          timerHours++;
        }
      });
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0,48,0,0),
                width: double.maxFinite,
                height: 60,
                child: Image.asset("assets/images/sdiblogo.png",)),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(16,48,16,0),
                width: double.maxFinite,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Aptitude'),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('C programming'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Java'),
                    ),
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(16,16,16,0),
                width: double.maxFinite,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(16,0,0,0),
                              child: Text("Question No."),
                            ),
                            Text("1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                ),
                          ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16,0,0,0),
                            child: Text("Right Mark:",),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4,0,0,0),
                            child: Text("1.00",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16,0,0,0),
                            child: Text("Negative Mark:"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8,0,0,0),
                            child: Text("0.00",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,0,0,0),
                            child: Text("View In:"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,0,0,0),
                            child: DropdownButton(
                              value: selectedOption,
                              items: [
                                DropdownMenuItem(
                                  child: Text('English'),
                                  value: 'Option 1',
                                ),
                                DropdownMenuItem(
                                  child: Text('Odia'),
                                  value: 'Option 2',
                                ),
                                DropdownMenuItem(
                                  child: Text('Hindi'),
                                  value: 'Option 3',
                                ),
                              ],
                              onChanged: (newValue) {
                                setState(() {
                                  selectedOption = newValue!;
                                });
                              },
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(16,16,16,0),
                width: double.maxFinite,
                height: null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16,16,16,0),
                      child: Text("What was the percentage increase in snowfall in Whistler from November to December?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        RadioListTile(
                          title: Text('Option 1'),
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Option 2'),
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Option 3'),
                          value: 3,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        )       ,
                        RadioListTile(
                          title: Text('Option 4'),
                          value: 4,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 0.0,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(16,16,16,0),
                        width: double.maxFinite,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.indigoAccent),
                              ),
                              onPressed: () {},
                              child: Text('Mark for Review & Next'),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                              ),
                              onPressed: () {},
                              child: Text('Clear Response'),
                            ),

                          ],
                        )),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        onPressed: () {},
        child: Text('Save & Next'),
      ),
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              margin: EdgeInsets.fromLTRB(16,16,16,0),
              width: double.maxFinite,
              height: null,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('${timerHours.toString().padLeft(2, '0')}:',
                            style: TextStyle(fontSize: 44,color: Colors.green,)),
                        Text('${timerMinutes.toString().padLeft(2, '0')}:',
                            style: const TextStyle(fontSize: 44,
                              color: Colors.orange,)),
                        Text('${timerSeconds.toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 44,
                              color: Colors.red,)),
                      ],
                    ), Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Hours',
                            style: TextStyle(fontSize: 16)),
                        Text('Minutes',
                            style: TextStyle(fontSize: 16)),
                        Text('Seconds',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                )
            ),
            Container(
              color: Colors.black12,
              margin: EdgeInsets.fromLTRB(16,16,16,0),
              width: double.maxFinite,
              height: 300,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16,16,0,0),
                          child: Text("Question pallette:",
                          style: TextStyle(fontSize: 16),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [

                          ],
                        ),

                      ],
                    ),
              Container(
                height: 200,
                child: GridView.builder(
                  itemCount: myList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ClipPath(

                      clipper: TriangleClipper(),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: Text(myList[index]),
                      ),
                    );
                  },
                ),
              ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
