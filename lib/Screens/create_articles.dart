import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/main.dart';

class create_articles extends StatefulWidget {
  @override
  _create_articlesState createState() => _create_articlesState();
}

class _create_articlesState extends State<create_articles> {
  final _formKey = GlobalKey<FormState>();
  final featured = TextEditingController();
  final title = TextEditingController();
  final url = TextEditingController();
  final summary = TextEditingController();
  final imageUrl = TextEditingController();
  final newsSite = TextEditingController();
  final publishedAt = TextEditingController();
  final id = TextEditingController();
  final provider = TextEditingController();

  _postArticles() async {
    var postUri = Uri.parse("https://spaceflightnewsapi.net/api/v2/articles");
    var request = http.MultipartRequest("POST", postUri);
    request.fields['featured'] = "false";
    request.fields['title'] = 'sataym';
    request.fields['url'] = 'sataym';
    request.fields['imageUrl'] = 'sataym';
    request.fields['newsSite'] = 'sataym';
    request.fields['summary'] = 'sataym';
    request.fields['publishedAt'] = 'sataym';
    request.fields['id'] = 'sataym';
    request.fields['provider'] = 'sataym';

    request.send();

    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Articles"),
        centerTitle: true,
        backgroundColor: const Color(0xFF2742d2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            color: const Color(0xFF2742d2),
            onPressed: () {
              setState(() {
                final isvalid = _formKey.currentState!.validate();
                if (!isvalid) {
                  return;
                } else {
                  _postArticles();
                }
              });
            },
            child: Text(
              'Submit',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "Featured "),
                controller: featured,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "Title "),
                controller: title,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "Url"),
                controller: url,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "ImageUrl"),
                controller: imageUrl,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "NewsSite"),
                controller: newsSite,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "Summary"),
                controller: summary,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "PublishedAt"),
                controller: publishedAt,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "Id"),
                controller: id,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02)),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else {}
                },
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: const Color(0xff211e3b))),
                    labelText: "Provider"),
                controller: provider,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
