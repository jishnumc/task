import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}
String ?stringResponse;
Map ?mapResponse;
Map ?dataResponse;
List ?listResponse;
class _ProfileState extends State<Profile> {

  Future apiCall() async{
    http.Response response;
    response=await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    if(response.statusCode==200){
      print(response.statusCode);
      setState(() {
       // stringResponse= response.body;
        mapResponse= jsonDecode(response.body);
        listResponse=mapResponse!['data'];
      });
    }
  }
  @override
  void initState() {
    apiCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children:  <Widget>[
                Image(
                    height: MediaQuery.of(context).size.height/3,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://media.istockphoto.com/photos/blurred-abstract-bokeh-background-picture-id1172073205?b=1&k=20&m=1172073205&s=170667a&w=0&h=XKC1I-YkKNHq7ebNt4wWnxb-jgqbWTmvC_xx_VDn4lc='
                    )),
                Positioned(
                    bottom: -50.0,
                    child: CircleAvatar(backgroundColor: Colors.white,radius:53,child: CircleAvatar(radius: 50,backgroundImage:  listResponse==null?NetworkImage('https://images.unsplash.com/photo-1552699611-e2c208d5d9cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmVtYWxlJTIwcG9ydHJhaXR8ZW58MHx8MHx8&w=1000&q=80')
                      :NetworkImage(listResponse![1]['avatar'].toString())
                      ,)))
              ],
            ),
            SizedBox(height: 40,),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  listResponse==null?Text('no data'):Text(listResponse![1]['first_name'].toString()),
                  SizedBox(width: 5,),
                  listResponse==null?Text('no data'):Text(listResponse![1]['last_name'].toString())
                ],
              ),
              subtitle: Center(child: listResponse==null?Text('no data'):Text(listResponse![1]['email'].toString())),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 18, 0),
              child: ListBody(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.notifications,color: Colors.grey,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Notifications',style: TextStyle(color: Colors.grey,),),

                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(39, 0, 0, 0),

                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),

                  //===========================================================

                  Row(
                    children: [
                      Icon(Icons.payment_rounded,color: Colors.grey,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            Text('Payments',style: TextStyle(color: Colors.grey,),),

                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(39, 0, 0, 0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),

                  //=================================================
                  Row(
                    children: [
                      Icon(Icons.message,color: Colors.grey,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            Text('Messages',style: TextStyle(color: Colors.grey,),),

                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(39, 0, 0, 0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  //==============================================

                  Row(
                    children: [
                      Icon(Icons.delivery_dining,color: Colors.grey,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            Text('My Orders',style: TextStyle(color: Colors.grey,),),

                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(39, 0, 0, 0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  //=======================================================================

                  Row(
                    children: [
                      Icon(Icons.settings,color: Colors.grey,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            Text('Settings Account',style: TextStyle(color: Colors.grey,),),

                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(39, 0, 0, 0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  //=============================================================
                  Row(
                    children: [
                      Icon(Icons.call,color: Colors.grey,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            Text('Call Center',style: TextStyle(color: Colors.grey,),),

                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(39, 0, 0, 0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  //=============================================================

                  Row(
                    children: [
                      Icon(Icons.language,color: Colors.grey,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            Text('Language',style: TextStyle(color: Colors.grey,),),

                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(39, 0, 0, 0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  //================================================================

                  Row(
                    children: [
                      Icon(Icons.app_blocking,color: Colors.grey,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            Text('About Apps',style: TextStyle(color: Colors.grey,),),

                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],

        ),
      )
    );
  }
}

