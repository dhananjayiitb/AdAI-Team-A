
import 'package:adai/home/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adai/bloc/authentication_bloc.dart';
import 'package:adai/broadcast/broadcast_form.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';
/*
class HomePage extends StatelessWidget {
  final _name = TextEditingController();
  final _phoneno = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void handleClick(String value) {
      //handles on click operation of popdown list of logout and change password
      switch (value) {
        case 'Logout':
          {
            //log_out();
            BlocProvider.of<AuthenticationBloc>(context)
                .add(LoggedOut()); //to logout
            break;
          }
      }
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
        ),
        title: 'FlutterBase',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: handleClick,
                itemBuilder: (BuildContext context) {
                  return {'Logout'}.map((String choice) {
                    //pop down list of logout and change password
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // padding: EdgeInsets.all(20),
                //margin: EdgeInsets.all(60),
                Container(
                    margin: EdgeInsets.all(60),
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      padding: EdgeInsets.all(20),
                      focusColor: Colors.red,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BroadcastForm()),
                        );
                      },
                      child: Text(
                        'Broadcast Update',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      // shape: StadiumBorder(
                      //   side: BorderSide(
                      //     color: Colors.black,
                      //     width: 2,
                      //   ),
                      // ),
                      color: Colors.red,
                      textColor: Colors.white,
                      highlightColor: Colors.red,
                    ))
              ]),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Alert(
                  context: context,
                  title: "Add a Customer",
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.queue),
                          labelText: 'Name',
                        ),
                        controller: _phoneno,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.queue),
                          labelText: 'Phone No.',
                        ),
                        controller: _name,
                      ),
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      onPressed: () {print("lmao");},
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    )
                  ]).show();
            },
            icon: Icon(Icons.add),
            label: Text('Add new customers'),
          ),
        ));
  }
}
*/

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  final imagePicker =ImagePicker();

  Future getCameraImage() async{
    final image= await imagePicker.getImage(
        source: ImageSource.camera
    );
    setState(() {
      _image=File(image.path);
    });
  }

  Future getGalleryImage() async{
    final image= await imagePicker.getImage(
        source: ImageSource.gallery
    );
    setState(() {
      _image=File(image.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Select Template'),
        icon: Icon(Icons.camera ),
        splashColor: Colors.white,
        onPressed: (){
          Alert(
              style: AlertStyle(
                alertElevation: 15.0,
                backgroundColor: Colors.black54,
                isButtonVisible: false,
                isCloseButton: false,
                titleStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 30.0
                )
              ),
              closeIcon: CloseButton(
                color: Colors.red,
              ),
              context: context,
              title: 'Select Method',
              content: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      getGalleryImage();
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)
                      ),
                      tileColor: Colors.blue[900],
                      leading: Icon(Icons.add_photo_alternate,color: Colors.white,),
                      title: Text(
                          'Gallery',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      getCameraImage();
                    },
                    child: ListTile(
                      tileColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)
                      ),
                      leading: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                      title: Text(
                          'Camera',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              )

          ).show();
        },

      ),
      backgroundColor: Colors.grey[700],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black87,
              floating: true,
              centerTitle: true,
              elevation: 4.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Home Page',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w400,
                      fontSize: 25.0,
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CategoryBar(),
                ]
                    )
                  )
                ],
              ),
            )
        );
  }
}
