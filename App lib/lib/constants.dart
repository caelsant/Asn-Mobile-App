// ignore_for_file: unused_import

import 'package:app/barcode.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'index.dart';
import 'search.dart';

const corPrimaria = Color(0xFFFFB63D);
const corSecundaria = Color(0xFF00598A);
const corSecundariaBB = Color(0xFF003E60);
const corGreen = Color(0xFF55896A);
const corRed = Color(0xFFFC6666);

class Margin extends StatelessWidget {
  const Margin({
    Key? key,
    required this.sHeight,
    required this.margins,
  }) : super(key: key);

  final double sHeight;
  final double margins;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: sHeight * margins,
    );
  }
}

class ButtonAppBar extends StatelessWidget {
  const ButtonAppBar({
    Key? key,
    required this.sHeight,
    required this.sWidth,
    required this.rota,
    required this.icon,
  }) : super(key: key);

  final double sHeight;
  final double sWidth;
  final Widget rota;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 20,
        height: sHeight * 0.8,
        decoration: BoxDecoration(),
        child: Center(
            child: Container(
          width: sWidth * 0.1,
          height: sHeight * 0.05,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: TextButton(
            onPressed: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return rota;
                },
              )),
            },
            child: Icon(
              icon,
              color: corPrimaria,
              size: 25,
            ),
          ),
        )),
      ),
    );
  }
}

class SearchBarIndex extends StatelessWidget {
  const SearchBarIndex({
    Key? key,
    required this.sHeight,
    required this.sWidth,
  }) : super(key: key);

  final double sHeight;
  final double sWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: sHeight * 0.1,
      color: Colors.black,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: sWidth,
              height: sHeight * 0.06,
              decoration: BoxDecoration(
                  color: corPrimaria,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ),
          Positioned(
              bottom: sHeight * 0.015,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: sHeight * 0.06,
                child: Row(
                  children: [
                    SizedBox(
                        width: sWidth * 0.74,
                        height: sHeight,
                        child: TextFormField(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const SearchBody())))
                          },
                          decoration: InputDecoration(
                            labelText: "Pesquise seus produtos aqui",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 124, 124, 124),
                                fontSize: 19),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 124, 124, 124),
                              size: 25,
                            ),
                          ),
                        )),
                    SizedBox(
                      width: sWidth * 0.02,
                      height: sHeight,
                    ),
                    SizedBox(
                      width: sWidth * 0.15,
                      height: sHeight,
                      child: TextButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const BarcodeIndex())))
                              },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: Icon(
                            Icons.qr_code_scanner,
                            color: corPrimaria,
                            size: 30,
                          )),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
