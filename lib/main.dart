import 'dart:math';

import 'package:flutter/material.dart';
// mytex
void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{

  double value1 =  0;
  double value2 =  0;
  double value3 = 0;

  double _currentSliderValue1 = 0;
  double _currentSliderValue2 = 0;
  double _currentSliderValue3 = 0;

  TextStyle myts = const TextStyle(
      color: Colors.green,
      fontSize: 24.0,
      fontWeight: FontWeight.bold);

  Widget mySlider1(){
    return Slider(
    activeColor: Colors.blue,
    inactiveColor: Colors.orange, max: 50,
        min: 0,
        value: _currentSliderValue1,
        onChanged: (double newvalue){

        setState(() {
          value1 = newvalue.roundToDouble();
          _currentSliderValue1 = newvalue.roundToDouble();
        });
    });

  }

  Widget mySlider2(){
    return Slider(
        activeColor: Colors.indigo[800],
        inactiveColor: Colors.green,
        max: 150,
        min: 0,

        value: _currentSliderValue2,
        //graduated slider
         label: _currentSliderValue2.round().toString(),
        divisions: 10,
        onChanged: (double newvalue){

          setState((){
            value2 = newvalue.roundToDouble();
            _currentSliderValue2 = newvalue.roundToDouble();
          });

        }, );

  }
//widget 3------------------------------------
  Widget mySlider3(){
    return Slider(
        activeColor: Colors.indigo[800],
        inactiveColor: Colors.green,
        max: 360,
        min: 0,

        value: _currentSliderValue3,
        //graduated slider
        label: _currentSliderValue3.round().toString(),
        divisions: 10,
        onChanged: (double newvalue){

         setState((){
        value3 = newvalue.roundToDouble();
        _currentSliderValue3 = newvalue.roundToDouble();
        myRotate();

    });
    });
  }

  // Widget mysquare(){
  //   return Container(
  //     width: 400,
  //       height: 400,
  //     child: CustomPaint(
  //
  //       painter: myPainter()
  //   ),
  //   );
  //
  //
  //
  // }

  myRotate()
  {
    //alignment is need for height and width
    //provides base point so plotter knows
    //where to take measurements form
    return Align(
      alignment: Alignment.center,
        child: Transform.rotate(
          angle: (value3 * (pi/180)),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Container(
              color: Colors.pinkAccent,
                child: const Text("Bubba", style: TextStyle(color: Colors.white)
            ),
          ),
        )
    )
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: const Text("Date Picker")),
      body: ListView(padding: const EdgeInsets.all(20.0), children: [
        Column(
            children: [
              Text("Examples", style: myts,),
              Text(value1.toString(), style: myts,),
              mySlider1(),
              Text("Example 2", style: myts),
              Text(value2.toString(), style: myts),
              mySlider2(),
              Text("Example 3", style: myts),
              Text(value3.toString(), style: myts),
              mySlider3(),
              myRotate()
            ])
      ]));
}

}