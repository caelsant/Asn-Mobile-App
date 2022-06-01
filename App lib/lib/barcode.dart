// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'constants.dart';
import 'index.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class BarcodeIndex extends StatelessWidget {
  const BarcodeIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Barcode Asn",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: BarcodeBody(),
    );
  }
}

class BarcodeBody extends StatefulWidget {
  BarcodeBody({Key? key}) : super(key: key);

  @override
  State<BarcodeBody> createState() => _BarcodeBodyState();
}

class _BarcodeBodyState extends State<BarcodeBody> {
  post() async {
    var body = jsonEncode({
      "codigo": null,
      "chaveacessopedido": null,
      "datavenda": "2002-05-25",
      "desconto": "0.00",
      "empresa": 1,
      "garcom": 1,
      "hora": "20:05:25",
      "id_cliente": 1,
      "id_vendedor": 1,
      "numero_nfce": null,
      "numero_nfe": null,
      "numero_os": null,
      "numerodocaixa": "00",
      "obs": null,
      "operador": null,
      "placa": null,
      "prazo_entrega": null,
      "qrcodepedido": null,
      "situacao": "EM ANALISE",
      "tipo_pagamento": 1,
      "totalvenda": 25
    });
    var response = await http.post(
        Uri.parse("http://192.168.0.102:9091/cadastrar/cabecalho"),
        body: body,
        headers: {'Content-type': 'application/json'});

    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: corSecundaria,
        body: Center(
          child: Container(
            width: sWidth * 0.8,
            height: sHeight * 0.6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: sHeight * 0.05,
                  child: Center(
                    child: Text(
                      "Codigo",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: sHeight * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: sHeight * 0.02,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: Offset(0, 3))
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                              width: sWidth * 0.1, child: Icon(Icons.qr_code)),
                          Expanded(
                              child: SizedBox(
                                  child: Center(
                                      child: Text(
                            "58404564645645645454",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ))))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sHeight * 0.05,
                  child: Center(
                    child: Text(
                      "Produto",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: sHeight * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: sHeight * 0.02,
                      decoration: BoxDecoration(
                          color: corPrimaria,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 190, 190, 190)
                                    .withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 8,
                                offset: Offset(0, 2))
                          ]),
                      child: Column(children: [
                        Expanded(
                          child: Container(
                            width: sWidth,
                            height: sHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                            child: Row(children: [
                              Expanded(
                                child: SizedBox(
                                    width: sWidth * 0.4,
                                    child: Center(
                                        child: Text(
                                      "PRODUTO",
                                      style: TextStyle(color: Colors.white),
                                    ))),
                              ),
                              SizedBox(
                                  width: sWidth * 0.2,
                                  child: Center(
                                      child: Text(
                                    "VALOR",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                              SizedBox(
                                  width: sWidth * 0.2,
                                  child: Center(
                                      child: Text(
                                    "QNT",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: sWidth,
                            height: sHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                            ),
                            child: Row(children: [
                              Expanded(
                                child: SizedBox(
                                    width: sWidth * 0.4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        "PRODUTO",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                  width: sWidth * 0.2,
                                  child: Center(
                                      child: Text(
                                    "VALOR",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ))),
                              SizedBox(
                                  width: sWidth * 0.2,
                                  child: Center(
                                      child: SizedBox(
                                          width: sWidth * 0.12,
                                          height: sHeight * 0.030,
                                          child: TextField(
                                            onChanged: (value) =>
                                                {print(value)},
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          )))),
                            ]),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: sHeight * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () => {},
                        style: TextButton.styleFrom(
                          backgroundColor: corGreen,
                        ),
                        child: Center(
                            child: Text(
                          "Adicionar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: sHeight * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => IndexPage())))
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: corRed,
                        ),
                        child: Center(
                            child: Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: sHeight * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () => {post()},
                        style: TextButton.styleFrom(
                          backgroundColor: corPrimaria,
                        ),
                        child: Center(
                            child: Text(
                          "Ler Novamente",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
