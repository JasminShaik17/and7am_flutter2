import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main( )
{
    runApp(new MyWidget());
}

class MyWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new MyState();
  }
}

class MyState extends State
{
  TextEditingController et1 = new TextEditingController( );
  TextEditingController et2 = new TextEditingController( );

  String email_value = " ";
  String pass_value = "" ;


  void insert( ) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', et1.text);
    await prefs.setString('pass', et2.text);
    prefs.commit();
  }

  void read( ) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
 email_value =   await prefs.getString('email');
 pass_value =   await prefs.getString('pass');

 setState(() {

 });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(

          floatingActionButton: new FloatingActionButton(onPressed: (){
              Navigator.of(context).pushNamed('/second');

              setState(() {

              });

          },child: new Icon(Icons.next_week),),
            appBar: new AppBar(title: new Text("First App",
              style: new TextStyle(),),
            backgroundColor: Colors.green,),

            body: new Container(
            padding: const EdgeInsets.all(10.0),
              child: new Center(
                  child: new Form(child:
                    new Column(
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter Email : "
                          ),
                          keyboardType: TextInputType.text,
                          controller: et1,
                        ),

                        new Padding(padding: const EdgeInsets.only(top: 30.0)),

                        new TextFormField(
                          decoration: new InputDecoration(
                              hintText: "Enter Password : "
                          ),
                          keyboardType: TextInputType.text,
                          controller: et2,
                        ),

                        new Padding(padding: const EdgeInsets.only(top: 30.0)),

                        new Row(
                          children: <Widget>[



                            new RaisedButton(onPressed:insert,
                              color: Colors.green,
                              child: new Text("InSert",
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),),

                            new Padding(padding: const EdgeInsets.only(right: 30.0)),

                            new RaisedButton(onPressed:read,
                              color: Colors.green,
                              child: new Text("Read",
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),),


                          ],

                        ),

                        new Padding(padding: const EdgeInsets.only(right: 30.0)),

                        new Text("$email_value",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                textAlign: TextAlign.center,
              ),

                        new Padding(padding: const EdgeInsets.only(right: 30.0)),

                        new Text("$pass_value",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    )

                  ),

              ),

            ),


        ),
      routes:  <String,WidgetBuilder>{
        '/first': (BuildContext context) => new MyWidget(),
        '/second': (BuildContext context) => new NextScreen(),
      },
    );
  }

}



class NextScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {

    return new NextState();
  }

}


class NextState extends State
{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new Scaffold(
        floatingActionButton: new FloatingActionButton(onPressed: (){
              Navigator.of(context).pop( );

              setState(() {

              });


        },
        child: new Icon(Icons.exit_to_app),),
      ),
    );
  }

}