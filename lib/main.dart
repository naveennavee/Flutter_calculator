import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var output = "0", input1 = "";

  @override
  Widget buildButton(String buttonText) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          input1 += buttonText;
        });
      },
      child: Text(buttonText, style: TextStyle(fontSize: 30)),
      height: 60,
      color: Colors.white,
    );
  }

  @override
  Widget OperationButton(String buttonText) {
    if (buttonText == "clear") {
      return MaterialButton(
        onPressed: () {
          setState(() {
            input1 = "";
            output = "0";
          });
        },
        child: Text(buttonText, style: TextStyle(fontSize: 30)),
        color: Colors.red,
        height: 60,
      );
    } else {
      return MaterialButton(
        onPressed: () {
          setState(() {
            input1 += buttonText;
          });
        },
        child: Text(buttonText, style: TextStyle(fontSize: 30)),
        color: Colors.deepPurple,
        height: 60,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calc'),
        centerTitle: true,
      ),
      body: Container(
        //child: Text('1'),

        child: Column(
          children: <Widget>[
            new Container(
              color: Colors.deepPurple[400],
              height: 100,
              alignment: Alignment.centerRight,
              child: Text(output,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
            ),
            Padding(padding: EdgeInsets.only(top: 100)),
            new Container(
              color: Colors.deepPurple[400],
              height: 100,
              alignment: Alignment.centerRight,
              child: Text(input1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            new Row(
              children: [
                new Expanded(
                  child: buildButton('1'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton('2'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton('3'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton('('),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            new Row(
              children: [
                new Expanded(
                  child: buildButton('4'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton('5'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton('6'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton(')'),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            new Row(
              children: [
                new Expanded(
                  child: buildButton('7'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton('8'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton('9'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: OperationButton('-'),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            new Row(
              children: [
                new Expanded(
                  child: buildButton('0'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: buildButton('00'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: OperationButton('*'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: OperationButton('+'),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            new Row(
              children: [
                new Expanded(
                  child: OperationButton('clear'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: OperationButton('/'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: OperationButton('%'),
                ),
                SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: OperationButton('!'),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            new Column(
              children: [
                MaterialButton(
                  color: Colors.green,
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () => doCalc(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  doCalc() {
    String finalQue = input1;
    Parser p = Parser();
    Expression exp = p.parse(finalQue);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    output = eval.toString();
    setState(() {
      output;
    });
  }
}
