import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/vachanamrutQuotes.dart';

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(255, 241, 203, 1),
        body: Center(
            child: FutureBuilder<List<VQuotes>>(
          future: _fetchJobs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<VQuotes> data = snapshot.data;
              return _jobsListView(data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        )));
  }

  Future<List<VQuotes>> _fetchJobs() async {
    final jobsListAPIUrl =
        'https://next.json-generator.com/api/json/get/4ykb9CsY_';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new VQuotes.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        
        itemBuilder: (context, index) {
          return _tile(data[index].body, data[index].chapter, Icons.work);
        });
  }

  Card _tile(String title, String subtitle, IconData icon) => Card(
    child: ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            
          ),
        )
        
  ));
}
