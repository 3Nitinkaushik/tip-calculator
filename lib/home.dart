import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double Tipamount = 0;
  double billamount = 0;
  int result = 0;
  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Tip Calculator",
            ),
          ),
          backgroundColor: Colors.pinkAccent,
        ),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            inputcontainer(
              shadowcolor: Colors.blue,
              color: Colors.blue.shade200,
              Child: Container(
                child: TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  decoration: InputDecoration(
                    labelText: "Enter Bill Amount",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black87),
                    floatingLabelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  onChanged: (value) {
                    textEditingController.text==""?billamount=0:
                    billamount = double.parse(textEditingController.text);
                    setState(() {
                      result = (billamount * Tipamount / 100).round();
                    });
                  },
                ),
              ),
            ),
            inputcontainer(
              shadowcolor: Colors.blue,
              color: Colors.blue.shade200,
              Child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Set Tip Percentage",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    Text("${Tipamount.round()}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                    SizedBox(
                      height: 10,
                    ),
                    Slider(
                      value: Tipamount,
                      max: 100,
                      min: 0,
                      label: Tipamount.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          Tipamount = value;
                          result = (billamount * Tipamount / 100).round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            inputcontainer(
              shadowcolor: Colors.pink,
              color: Colors.pink.shade200,
              Child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tip Amount",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  Text("${result}",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ],
              ),
            ),

          ],
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () {
            setState(() {
              billamount = 0;
              result = 0;
              Tipamount = 0;
              textEditingController.text="";
            });
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "RESET",
                style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              ),
              Icon(Icons.refresh,weight: 800,size: 40,color: Colors.pinkAccent,)
            ],
          ),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),padding: MaterialStateProperty.all(EdgeInsets.all(10))),
        ),
      ),
    );
  }
}

class inputcontainer extends StatelessWidget {
  inputcontainer({
    this.Child,
    required this.shadowcolor,
    required this.color,
    super.key,
  });
  Widget? Child;
  Color shadowcolor;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        height: 180,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: shadowcolor, blurRadius: 4, spreadRadius: 2),
              BoxShadow(color: Colors.white)
            ],
            color: color,
            borderRadius: BorderRadius.circular(30),
            shape: BoxShape.rectangle),
        child: Child,
      ),
    );
  }
}
