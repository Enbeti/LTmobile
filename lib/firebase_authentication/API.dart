import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class API extends StatefulWidget {
  const API();

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  final String apiKey = 'live_DwY7L3V4Yhg2OmBzDbay6JWqAlvhr27fOT4NUxDxpG7atJkb0WKncdCn0xYx7CtJ';
  List articles = [];

  @override
  void initState() {
    super.initState();
    api();
  }

  Future<void> api() async {
    final String apiUrl = 'http://localhost:5001/api/cocktails';

    setState(() {
      articles;
    });

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        /*setState(() {
          articles = data['articles'];
        });*/
      } else {
        throw Exception("Failed to load news: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load news: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: ListTile(
                leading: article['urlToImage'] != null
                    ? Image.network(article['urlToImage'])
                    : null,
                title: Text(article['title'] ?? 'No title'),
                subtitle: Text(article['description'] ?? 'No description'),
              ),
            ),
          );
        },
      ),
    );
  }
}