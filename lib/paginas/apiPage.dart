import 'dart:convert';
import 'dart:js_interop';

import 'package:api_consumir/controller/api.dart';
import 'package:api_consumir/main.dart';
import 'package:api_consumir/model/Post.dart';
import 'package:flutter/material.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late Future<List<Post>> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=Apis.apiCall('https://jsonplaceholder.typicode.com/posts');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(snapshot.data![index].title),);
                },);
              } 
              if(snapshot.hasError){
                return Text('Erro ao carregar, verifique sua conexao com a internet');
              }
              else {
                return CircularProgressIndicator();
              }
            return Text('');
          },),
        ),
      ),
    );
  }
}