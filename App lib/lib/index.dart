// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unused_element, prefer_typing_uninitialized_variables, unnecessary_import, depend_on_referenced_packages, prefer_const_constructors_in_immutables, must_be_immutable

import 'dart:ffi';
import 'dart:io';
import 'package:app/models/fakeApi.dart';
import 'package:app/models/teste.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:convert';
import 'dart:math';
import 'package:app/search.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'login.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asn App Index',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: BodyIndex(),
    );
  }
}

class BodyIndex extends StatefulWidget {
  BodyIndex({Key? key}) : super(key: key);

  @override
  State<BodyIndex> createState() => _BodyIndexState();
}

class _BodyIndexState extends State<BodyIndex> {
  @override
  Widget build(BuildContext context) {
    addShow() {
      adicionados.forEach((element) {
        Iterable<Produto> idProdutos =
            produtos.where((id) => id.id.toString() == element.id.toString());
        idProdutos.forEach((nome) {
          produtosResult
              .add(Produto(id: nome.id, nome: nome.nome, preco: nome.preco));
        });
      });
    }

    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;
    var rota = IndexPage();
    var icon = Icons.audiotrack;
    var mostrar;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: corPrimaria,
        leadingWidth: sWidth * 0.15,
        leading: ButtonAppBar(
            sHeight: sHeight,
            sWidth: sWidth,
            rota: IndexPage(),
            icon: Icons.person),
        title: Text("Cael"),
        actions: <Widget>[
          SizedBox(
            width: sWidth * 0.3,
            height: sHeight * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    width: 20,
                    height: sHeight * 0.8,
                    decoration: const BoxDecoration(),
                    child: Center(
                        child: Container(
                      width: sWidth * 0.1,
                      height: sHeight * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () => {},
                        child: Icon(
                          icon,
                          color: corPrimaria,
                          size: 25,
                        ),
                      ),
                    )),
                  ),
                ),
                ButtonAppBar(
                    sHeight: sHeight,
                    sWidth: sWidth,
                    rota: const LoginPage(),
                    icon: Icons.offline_bolt),
              ],
            ),
          )
        ],
      ),
      body: Column(children: [
        SearchBarIndex(sHeight: sHeight, sWidth: sWidth),
        Expanded(
          child: Container(
            color: Colors.white,
            width: sWidth,
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  width: sWidth,
                  height: sHeight * 0.05,
                  child: Row(children: [
                    SizedBox(
                        width: sWidth * 0.1,
                        child: Center(
                            child: Text(
                          "ID",
                          style: TextStyle(color: Colors.white),
                        ))),
                    SizedBox(
                        width: sWidth * 0.3,
                        child: Center(
                            child: Text(
                          "PRODUTO",
                          style: TextStyle(color: Colors.white),
                        ))),
                    SizedBox(
                        width: sWidth * 0.1,
                        child: Center(
                            child: Text(
                          "QNT",
                          style: TextStyle(color: Colors.white),
                        ))),
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
                          "TOTAL",
                          style: TextStyle(color: Colors.white),
                        ))),
                    SizedBox(
                        width: sWidth * 0.1,
                        child: Center(
                            child: Text(
                          "--",
                          style: TextStyle(color: Colors.white),
                        ))),
                  ]),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: sWidth,
                      height: sHeight * 0.7,
                      child: ListView.builder(
                        itemCount: produtosResult.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            width: sWidth,
                            height: sHeight * 0.05,
                            child: Row(children: [
                              SizedBox(
                                  width: sWidth * 0.1,
                                  child: Center(
                                      child: Text(
                                    produtosResult[index].id.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ))),
                              SizedBox(
                                  width: sWidth * 0.3,
                                  child: Text(
                                    produtosResult[index].nome.toString(),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black),
                                  )),
                              SizedBox(
                                  width: sWidth * 0.1,
                                  child: Center(
                                      child: Text(
                                    adicionados[index].quantidade.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ))),
                              SizedBox(
                                  width: sWidth * 0.2,
                                  child: Center(
                                      child: Text(
                                    produtosResult[index].preco.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ))),
                              SizedBox(
                                  width: sWidth * 0.2,
                                  child: Center(
                                      child: Text(
                                    produtosResult[index].preco.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ))),
                              SizedBox(
                                  width: sWidth * 0.1,
                                  child: Center(
                                      child: SizedBox(
                                          width: sWidth * 0.06,
                                          height: sHeight * 0.029,
                                          child: Center(
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.red,
                                              ),
                                              onPressed: () => {
                                                adicionados.removeAt(index),
                                                produtosResult.removeAt(index),
                                                setState(() {
                                                  mostrar = adicionados;
                                                }),
                                                print(mostrar.length)
                                              },
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          )))),
                            ]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        width: double.infinity,
        height: sHeight * 0.16,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: sHeight * 0.065,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      "Total:",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "RS20,00",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: sHeight * 0.02,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: corGreen),
                    onPressed: () => {
                      /*print(adicionados.length),
,*/

                      produtosResult.clear(),
                      addShow(),
                      print(produtosResult.length),
                      setState(() {
                        mostrar = adicionados;
                      }),
                    },
                    child: Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
