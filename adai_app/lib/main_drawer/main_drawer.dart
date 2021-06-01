import 'package:adai/bloc/authentication_bloc.dart';
import 'package:adai/main_drawer/editable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<File> _images=[];
  final imagePicker =ImagePicker();
  EditableText_Own nameText=new EditableText_Own("Enter Name");
  EditableText_Own emailText=new EditableText_Own("Enter Email");


  Future getGalleryImage() async{
    final image= await imagePicker.getImage(
        source: ImageSource.gallery
    );
    setState(() {
      _images.add(File(image.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.indigo,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      getGalleryImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: _images?.isEmpty ?? true ? AssetImage('assets/images/profile_pic.jpg') : FileImage(_images.last),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  nameText,
                  SizedBox(
                    height: 10.0,
                  ),
                  emailText,
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          ListTile(
            onTap: (){},
            minLeadingWidth: 5.0,
            leading: Icon(Icons.home,color: Colors.white),
            tileColor: Colors.indigoAccent,
            title: Text(
              'Home Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          ListTile(
            onTap: (){},
            minLeadingWidth: 5.0,
            leading: Icon(Icons.account_circle,color: Colors.white),
            tileColor: Colors.indigoAccent,
            title: Text(
              'Directory Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          ListTile(
            onTap: (){
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(LoggedOut());
            },
            minLeadingWidth: 5.0,
            leading: Icon(Icons.arrow_back,color: Colors.white),
            tileColor: Colors.indigoAccent,
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
