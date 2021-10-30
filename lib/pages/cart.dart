import 'package:eat_meat/components/date_picker.dart';
import 'package:eat_meat/models/cart_item.dart';
import 'package:eat_meat/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                child: Text('Make an order'),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child: Column(
            children: <Widget>[
              TextButton(
                  onPressed: () {
                     Alert(
                      context: context,
                      title: "Hello World!",
                      desc: "This is alert",
                      buttons: [
                        DialogButton(
                            child: Text("Ok"),
                            onPressed: () {
                              Navigator.pop(context);
                            }
                        )
                      ]
                    ).show();
                  },
                child: Text("Click me"),
              ),
              TextButton(
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "LOGIN",
                        content: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.account_circle),
                                labelText: 'Username',
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: 'Password',
                              ),
                            ),
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ]).show();
                  },
                child: Text("Click me"),
              ),
              TextButton(
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "Checkbox",
                        content: Column(
                          children: <Widget>[
                            Checkbox(
                            checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                          },
                        ),
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Complete",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ]).show();
                  },
                child: Text("Click me"),
              ),

            ],
          ),
        ),
      )
    );
  }
}
