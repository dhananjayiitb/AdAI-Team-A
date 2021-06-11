import 'package:adai/UpdateUserProfile/updatePage.dart';
import 'package:adai/bloc/authentication_bloc.dart';
import 'package:adai/directory/directory_home.dart';
import 'package:adai/globals.dart';
import 'package:adai/main_drawer/editable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adai/globals.dart' as globals;

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final imagePicker =ImagePicker();


  Future getGalleryImage() async{
    final image= await imagePicker.getImage(
        source: ImageSource.gallery
    );
    setState(()  {
      globals.images.add(File(image.path));
    });
  }



  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: background),
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: (){
                        getGalleryImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: globals.images?.isEmpty ?? true ? AssetImage('assets/images/profile_pic.jpg') : FileImage(globals.images.last),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                        width: MediaQuery.of(context).size.height * 0.14,
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      globals.fullName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      globals.businessName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdatePage()),
                );

              },
              minLeadingWidth: 5.0,
              shape: RoundedRectangleBorder(),
              leading: Icon(Icons.account_circle,color: Colors.white),
              tileColor: button,
              title: Text(
                'Update Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DirectoryHome()),
                );
              },
              minLeadingWidth: 5.0,
              shape: RoundedRectangleBorder(),
              leading: Icon(Icons.account_box_sharp,color: Colors.white),
              tileColor: button,
              title: Text(
                'Directory',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            ListTile(
              onTap: (){
                phone = "";
                token = "";
                phoneNum = "";
                templates = [];
                previousPosters = [];
                userContacts = [];
                images = null;
                fullName = null;
                businessName = null;
                businessType = null;
                businessAddress = null;
                businessNumber = null;
                phoneContacts = [];
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(LoggedOut());
              },
              minLeadingWidth: 5.0,
              leading: Icon(Icons.arrow_back, color: Colors.white),
              tileColor: button,
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
