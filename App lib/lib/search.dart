// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:io';
import 'dart:ui';
import 'package:app/models/teste.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'constants.dart';
import 'index.dart';
import 'login.dart';
import 'models/fakeApi.dart';
import 'models/teste.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Asn App Index',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.red),
        home: SearchIndex());
  }
}

class SearchIndex extends StatefulWidget {
  SearchIndex({Key? key}) : super(key: key);

  @override
  State<SearchIndex> createState() => _SearchIndexState();
}

class _SearchIndexState extends State<SearchIndex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: corPrimaria,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color:
                          Color.fromARGB(255, 218, 217, 217).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(0, 2))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Digite o produto aqui:',
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
        ),
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: sHeight * 0.05,
          color: Colors.red,
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
                        width: sWidth * 0.2,
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
                          "--",
                          style: TextStyle(color: Colors.white),
                        ))),
                  ]),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: sWidth,
              height: sHeight * 0.7,
              child: ListView.builder(
                itemCount: produtos.length,
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
                            produtos[index].id.toString(),
                            style: TextStyle(color: Colors.black),
                          ))),
                      SizedBox(
                          width: sWidth * 0.3,
                          child: Text(
                            produtos[index].nome,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                          )),
                      SizedBox(
                          width: sWidth * 0.2,
                          child: Center(
                              child: SizedBox(
                                  width: sWidth * 0.12,
                                  height: sHeight * 0.030,
                                  child: TextField(
                                    onChanged: (value) => {
                                      setState(() {
                                        quantidade = int.parse(value);
                                      }),
                                      print(quantidade)
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  )))),
                      SizedBox(
                          width: sWidth * 0.2,
                          child: Center(
                              child: Text(
                            produtos[index].preco.toString(),
                            style: TextStyle(color: Colors.black),
                          ))),
                      SizedBox(
                          width: sWidth * 0.2,
                          child: Center(
                              child: SizedBox(
                                  width: sWidth * 0.08,
                                  height: sHeight * 0.029,
                                  child: Center(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: corGreen,
                                      ),
                                      onPressed: () => {
                                        adicionados.add(Adicionados(
                                            id: produtos[index].id,
                                            quantidade: quantidade,
                                            valor:
                                                produtos[index].preco.toInt())),
                                        print(adicionados.length)
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
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(produtos.length);
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => IndexPage())));
        },
        backgroundColor: corPrimaria,
        child: const Icon(Icons.home),
      ),
    );
  }
}
