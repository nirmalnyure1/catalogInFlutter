import 'package:catalog_app/utils/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  movetoHomePage(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/loginimage.svg',
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'welcome $name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 26.0),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'enter username',
                              labelText: 'username'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password cannot be empty";
                            } else if (value.length < 6) {
                              return "password should greater then 6 digit";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'password',
                            hintText: 'enter passwprd',
                          ),
                        ),
                        SizedBox(height: 50.0),

                        Material(
                          color: Colors.purple.shade800,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 10.0),
                          child: InkWell(
                            onTap: () => movetoHomePage(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: 40,
                              width: changeButton ? 40 : 120,
                              // decoration: BoxDecoration(
                              //     color: Colors.purple.shade800,
                              //     borderRadius: BorderRadius.circular(
                              //         changeButton ? 50 : 10.0)),
                              child: Center(
                                child: changeButton
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : Text('LOGIN',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        )
                        // ElevatedButton(
                        //   onPressed: () {

                        //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                        //   },
                        //   style: TextButton.styleFrom(minimumSize: Size(120, 40)),
                        //   child: Text(' LOGIN '),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
