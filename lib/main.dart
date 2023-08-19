import 'dart:convert';

import 'package:api_consumir/paginas/apiPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApiPage(),
    );
  }
}

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  Future? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Network('https://jsonplaceholder.typicode.com/posts').fetchData();
    /* data?.then((value) => print(value)); */
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Json Api'),
      ),
      body: Center(
        child: Container(
            child: FutureBuilder(
          future: data,
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return createList(snapshot.data, context);
            } else {
              return CircularProgressIndicator();
            }
          },
        )),
      ),
    );
  }
}

class Network {
  final String url;

  Network(this.url);
  Future fetchData() async {
    Response res = await get(Uri.parse(url));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      print(res.statusCode);
    }
  }
}

Widget createList(List data, BuildContext context) {
  return Container(
    child: ListView.builder(
      itemCount: data.length,
      itemBuilder: ((context, index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(),
          ListTile(
            title: Text("${data[index]['title']}"),
            subtitle: Text("${data[index]['body']}"),
            leading: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 20,
                  child: Text("${data[index]['userId']}"),
                )
              ],
            ),
          )
        ],
      );
    })),
  );
}
