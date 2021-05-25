import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main ()
{
  runApp(Calculator());
}
class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstNum;
  int secondNum;
  String res = "";
  String operator = "";
  String textDisplay = "0";
  String previous ="0";

  void clicked(buttonText){
    if(buttonText=='C'){
      textDisplay='0';
      res='0';
      firstNum=0;
      secondNum=0;
      previous='0';
    }
    else if(buttonText=='0'){
      textDisplay='';
      res='0';
     }
    else if(buttonText=='+'||buttonText=='-'||buttonText=='*'||buttonText=='/'){
      firstNum=int.parse(textDisplay);
      res='';
      operator=buttonText;
    }
    else if (buttonText=='='){
      secondNum=int.parse(textDisplay);
      if(operator=='+') {
        res = (firstNum + secondNum).toString();
        previous=(firstNum.toString() + operator.toString() + secondNum.toString());
      }
        if(operator=='-') {
          res = (firstNum - secondNum).toString();
          previous=(firstNum.toString() + operator.toString() + secondNum.toString());
        }
          if(operator=='*') {
            res = (firstNum * secondNum).toString();
            previous=(firstNum.toString() + operator.toString() + secondNum.toString());
          }
            if(operator=='/') {
              res = (firstNum / secondNum).toString();
              previous=(firstNum.toString() + operator.toString() + secondNum.toString());

      }
    }
    else {

      res=int.parse(textDisplay + buttonText).toString();
        previous=res;
    }
    setState(() {
      textDisplay=res;
    });
  }

  Widget button(String buttonText ) {
    return Expanded(
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        color: Colors.deepPurpleAccent,
         padding: EdgeInsets.all(25),
        onPressed: ()=>clicked(buttonText),
        child: Text(
          "$buttonText",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Center(
          child: Text(
            'Calculator',
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                child: Text(
                  "$previous",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
                alignment: Alignment.bottomRight,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$textDisplay",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("7"),
                button("8"),
              ],
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("7"),
                button("8"),
                button("9"),
                button("+"),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("4"),
                button("5"),
                button("6"),
                button("-"),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("1"),
                button("2"),
                button("3"),
                button("*"),
              ],
            ),
            SizedBox(
              height: 10,
              width: 5,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("0"),
                button('.'),
                button("C"),
                button("="),
              ],
            ),
            SizedBox(
              height: 10,
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}