import 'package:adai/UpdateUserProfile/updateDataGlobals.dart';
import 'package:adai/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:adai/api_connection/api_connection.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  Map userDetails = {};
  final imagePicker = ImagePicker();
  Future getGalleryImage() async {
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      globals.images.add(File(image.path));
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globals.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  updateUserDetails(
                      globals.fullName,
                      globals.businessName,
                      globals.businessNumber,
                      globals.businessAddress,
                      globals.businessType);
                  Navigator.of(context).pop();
                },
              ),
              iconTheme: IconThemeData(color: globals.button),
              backgroundColor: globals.background,
              floating: true,
              centerTitle: true,
              elevation: 20.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25.0,
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      getGalleryImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          // ignore: null_aware_in_condition
                          image: globals.images?.isEmpty ?? true
                              ? AssetImage('assets/images/profile_pic.jpg')
                              : FileImage(globals.images.last),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                            // ignore: null_aware_in_condition
                            initialValue: globals.fullName?.isEmpty ?? true
                                ? 'empty'
                                : globals.fullName,
                            decoration: InputDecoration(
                                labelText: 'Full Name',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                            onChanged: (newValue) {
                              globals.fullName = newValue;
                              print(globals.fullName);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                            // ignore: null_aware_in_condition
                            initialValue: globals.businessName?.isEmpty ?? true
                                ? 'empty'
                                : globals.businessName,
                            decoration: InputDecoration(
                                labelText: 'Business Name',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                            onChanged: (newValue) {
                              globals.businessName = newValue;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                            // ignore: null_aware_in_condition
                            initialValue: globals.businessType?.isEmpty ?? true
                                ? ' '
                                : globals.businessType,
                            decoration: InputDecoration(
                                labelText: 'Business Type',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                            onChanged: (newValue) {
                              globals.businessType = newValue;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                            // ignore: null_aware_in_condition
                            initialValue:
                                globals.businessNumber?.isEmpty ?? true
                                    ? ' '
                                    : globals.businessNumber,
                            decoration: InputDecoration(
                                labelText: 'Business Number',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                            onChanged: (newValue) {
                              globals.businessNumber = newValue;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                            // ignore: null_aware_in_condition
                            initialValue:
                                globals.businessAddress?.isEmpty ?? true
                                    ? ' '
                                    : globals.businessAddress,
                            decoration: InputDecoration(
                                labelText: 'Business Address',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                            onChanged: (newValue) {
                              globals.businessAddress = newValue;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
