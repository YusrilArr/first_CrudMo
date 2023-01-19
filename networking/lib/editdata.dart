// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditData extends StatefulWidget {
  const EditData({super.key});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
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
                    // controller: _namaController,
                    decoration: InputDecoration(
                        hintText: 'Nama Barang',
                        contentPadding: EdgeInsets.only(left: 15)),
                  ),
                  TextFormField(
                    // controller: _hargaController,
                    decoration: InputDecoration(
                        hintText: 'Harga Barang',
                        contentPadding: EdgeInsets.only(left: 15)),
                  ),
                  TextFormField(
                    // controller: _qtyController,
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
              onPressed: () {
                // await postData({
                //   'nama': _namaController.text,
                //   'harga': int.parse(
                //     _hargaController.text,
                //   ),
                //   'qty': int.parse(
                //     _qtyController.text,
                //   )
                // });
                // _namaController.clear();
                // _hargaController.clear();
                // _qtyController.clear();
                // Navigator.of(context).popAndPushNamed('/home');
                // setState(() {});
              },
              child: Text(
                'Update',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
