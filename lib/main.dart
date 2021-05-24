import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Screens/create_articles.dart';

import 'Models/new_articles_Model.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<HomeScreen> data=[];
  Future<List<HomeScreen>> getdata()async{
  final response=await http.get(Uri.parse("https://spaceflightnewsapi.net/api/v2/articles"));

  List resbody=json.decode(response.body);
  print("jjjjjjjjjjjjjjjjjjjjjjjjjjjj");
 

  return resbody.map((data) => HomeScreen.fromMap(data)).toList();
  }
@override
  void initState() {
  this.getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(

        title: Text("New Articles"),
        centerTitle: true,
        backgroundColor: const Color(0xFF2742d2),

      ),
          bottomNavigationBar: BottomAppBar(
            color:  const Color(0xFF2742d2),
            shape: CircularNotchedRectangle(),
            child: Container(

              height:MediaQuery.of(context).size.height * 0.05,
              child: Row(
                children: <Widget>[

                ],
              ),
            )
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor:  const Color(0xFF2742d2),
            child: Center(
              child: Icon(
                Icons.add,
                size: 32.0,
              ),
            ),
            onPressed: () {
             setState(() {
               Navigator.push(context, MaterialPageRoute(builder: (context) => create_articles()));
             });
            },
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                     color:const Color(0xFF2742d2)) ,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                            left: MediaQuery.of(context).size.width * 0.05),
                        //color:  const Color(0xffe83e8c),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.white,
                                //backgroundImage: AssetImage("assets/images/profile icomn.png")
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left:
                                    MediaQuery.of(context).size.width * 0.05)),
                           Text("Admin")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      // Navigator.of(context).pushNamed(DASHBOARD_SCREEN);
                    });
                  },
                  title: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.home_outlined),
                        Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.03)),
                        Text("New Articles")
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: const Color(0xff211e3b),
                  thickness: 1.0,
                ),
                ListTile(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        //  Navigator.of(context).pushNamed(TICKET_LIST);
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Complaint_Details()));
                      });
                    },
                    title: Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.next_week_sharp),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.03)),
                          Text("New Blog"),
                        ],
                      ),
                    )),
                Divider(
                  color: const Color(0xff211e3b),
                  thickness: 1.0,
                ),
                ListTile(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        /*Navigator.of(context)
                        .pushNamed(COMPETITOR_INFORMATION_SCREEN);*/
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Complaint_Information_Screen()));
                      });
                    },
                    title: Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.compare),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.03)),
                          Text("Reports"),
                        ],
                      ),
                    )),
                Divider(
                  color: const Color(0xff211e3b),
                  thickness: 1.0,
                ),
        ])),
          body: SingleChildScrollView(
            child:Column(
              children: <Widget>[
               FutureBuilder<List<HomeScreen>>(
                 future:getdata() ,
                 builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else{
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index){
                          return  Card(
                            child: Container(
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01 ,bottom: MediaQuery.of(context).size.height * 0.02 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image(image: NetworkImage(snapshot.data[index].imageUrl)),
                                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01)),
                                  Text(snapshot.data[index].title,style: TextStyle(fontWeight: FontWeight.bold),),

                                ],
                              ),
                            ),
                          );
                          }
                      );
                    }
                 },
               )

              ],
            )
          ),
    ));
  }
}
