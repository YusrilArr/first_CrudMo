// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> postData(Map<String, dynamic> data) async {
  var result = await http.post(
    Uri.parse("http://127.0.0.1:8082/api/produk/insertProduk"),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: jsonEncode(data),
  );
  print(result.statusCode);
  print(result.body);
  return result;
}

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();
  final _qtyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).popAndPushNamed('/home'),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                    },
                    controller: _namaController,
                    decoration: InputDecoration(
                        hintText: 'Nama Barang',
                        contentPadding: EdgeInsets.only(left: 15)),
                  ),
                  TextFormField(
                    controller: _hargaController,
                    decoration: InputDecoration(
                        hintText: 'Harga Barang',
                        contentPadding: EdgeInsets.only(left: 15)),
                  ),
                  TextFormField(
                    controller: _qtyController,
                    decoration: InputDecoration(
                        hintText: 'Qty',
                        contentPadding: EdgeInsets.only(left: 15)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                await postData({
                  'nama': _namaController.text,
                  'harga': int.parse(
                    _hargaController.text,
                  ),
                  'qty': int.parse(
                    _qtyController.text,
                  )
                });
                _namaController.clear();
                _hargaController.clear();
                _qtyController.clear();
                Navigator.of(context).popAndPushNamed('/home');
                setState(() {});
              },
              child: Text(
                'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
