// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getData() async {
  var result = await http
      .get(Uri.parse("http://127.0.0.1:8082/api/produk/getAllProduk"));
  print(result.statusCode);
  // print(result.body);
  return result;
}

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

TextEditingController editNama = TextEditingController();
TextEditingController editHarga = TextEditingController();
TextEditingController editQty = TextEditingController();

Future<http.Response> updateData(id) async {
  Map<String, dynamic> data = {
    'nama': editNama.text,
    'harga': editHarga.text,
    'qty': editQty.text,
  };
  var result = await http.put(
    Uri.parse("http://127.0.0.1:8082/api/produk/updateProduk/${id}"),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: jsonEncode(data),
  );

  return result;
}

Future<http.Response> deleteData(id) async {
  var result = await http.delete(
    Uri.parse("http://127.0.0.1:8082/api/produk/deleteProduk/${id}"),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
    },
  );
  print(result.statusCode);
  print(result.body);
  return result;
}

class NetworkingHttps extends StatefulWidget {
  NetworkingHttps({super.key});

  @override
  State<NetworkingHttps> createState() => _NetworkingHttpsState();
}

class _NetworkingHttpsState extends State<NetworkingHttps> {
  final _editNama = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var data = getData();
    // print(postData());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Networking Https",
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).popAndPushNamed('/adddata'),
            icon: Icon(Icons.add),
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> json = jsonDecode(snapshot.data!.body);
            return ListView.builder(
              itemCount: json.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(18.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(json[index]['nama'][0]),
                      backgroundColor: Colors.amber,
                    ),
                    title: Text(json[index]['nama']),
                    subtitle: Text(json[index]['harga']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: (() {
                            // updateData(json[index]['id']);
                            editNama.text = json[index]['nama'];
                            editHarga.text = json[index]['harga'];
                            editQty.text = json[index]['qty'];

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Update Data'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: editNama,
                                        decoration: InputDecoration(
                                            hintText: 'Nama Barang'),
                                      ),
                                      TextField(
                                        controller: editHarga,
                                        decoration: InputDecoration(
                                            hintText: 'Harga Barang'),
                                      ),
                                      TextField(
                                        controller: editQty,
                                        decoration:
                                            InputDecoration(hintText: 'Jumlah'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await updateData(json[index]['id']);
                                          Navigator.of(context)
                                              .popAndPushNamed('/home');
                                          setState(() {});
                                        },
                                        child: Text('Update'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteData(json[index]['id']);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
