// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_import, unused_local_variable, prefer_const_literals_to_create_immutables

import 'dart:ffi';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'index.dart';

class LoginAsn extends StatelessWidget {
  const LoginAsn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asn App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: corSecundaria,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Body(sHeight: sHeight, sWidth: sWidth),
        ));
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.sHeight,
    required this.sWidth,
  }) : super(key: key);

  final double sHeight;
  final double sWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: sHeight,
      child: Column(
        children: [
          Container(
            //LOGO
            width: sWidth,
            height: sHeight * 0.4,
            child: Center(
                child: SizedBox(
              width: sWidth * 0.5,
              height: sHeight * 0.3,
              child: Image.asset('assets/images/asn-logo.png',
                  width: sWidth, height: sHeight, fit: BoxFit.fill),
            )),
          ),
          SizedBox(
              //TEXTOS
              width: sWidth * 0.8,
              height: sHeight * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(children: [
                  Expanded(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Por favor digite seu usuario e senha nos campos abaixo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ]),
              )),
          Container(
            //INPUT USER
            width: sWidth * 0.8,
            height: sHeight * 0.1,
            child: InputsLogin(
                labels: "Digite seu usuario aqui",
                icons: Icons.account_circle_outlined),
          ),
          SizedBox(
              //INPUT PASSWORD
              width: sWidth * 0.8,
              height: sHeight * 0.1,
              child: InputsLogin(
                  labels: "Digite sua senha aqui",
                  icons: Icons.create_rounded)),
          Margin(sHeight: sHeight, margins: 0.04),
          SizedBox(
            //BUTTON SEND
            width: sWidth * 0.8,
            height: sHeight * 0.08,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: corPrimaria,
                primary: Colors.white,
              ),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => IndexPage())))
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Margin(sHeight: sHeight, margins: 0.08)
        ],
      ),
    );
  }

  Container emptySpace() {
    return Container(
      width: sWidth,
      height: sHeight * 0.08,
    );
  }
}

class InputsLogin extends StatelessWidget {
  const InputsLogin({
    Key? key,
    required this.labels,
    required this.icons,
  }) : super(key: key);

  final String labels;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextFormField(
      onTap: () => {},
      decoration: InputDecoration(
          labelText: labels,
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 124, 124, 124), fontSize: 19),
          filled: true,
          fillColor: corSecundariaBB,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: Icon(
            icons,
            color: Colors.white,
            size: 25,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: corSecundariaBB, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: corPrimaria, width: 2.0),
          )),
    ));
  }
}
