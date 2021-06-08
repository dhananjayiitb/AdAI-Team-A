import 'package:adai/Custom_made_templates/page_view.dart';
import 'package:adai/Custom_made_templates/predefined_posters.dart';
import 'package:adai/Previous_Templates/page_view.dart';
import 'package:adai/broadcast/broadcast_form.dart';
import 'package:adai/get_api_data/getting_Data.dart';
import 'package:adai/main_drawer/main_drawer.dart';
import 'package:adai/model/api_model.dart';
import 'package:adai/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../globals.dart';

class HomePage extends StatefulWidget {
  final UserRepository userRepository;
  const HomePage(this.userRepository, {Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(userRepository);
}

class _HomePageState extends State<HomePage> {
  File _image;
  final imagePicker = ImagePicker();
  MainDrawer mainDrawer = new MainDrawer();
  List<String> categoryList = ['Templates','Previous Posters'];
  var selectedIndex;


  UserRepository userRepository;
  _HomePageState(this.userRepository);

  Future getSelectedIndex() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs.getInt('selectedIndex');
    });
  }

  Future getCameraImage() async{
    final image= await imagePicker.getImage(
        source: ImageSource.camera
    );
    setState(() {
      _image = File(image.path);
    });
    if(_image != null){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BroadcastForm(preview: null, image: _image,)),
      );
    }
  }

  Future getGalleryImage() async{
    final image= await imagePicker.getImage(
        source: ImageSource.gallery
    );
    setState(() {
      _image = File(image.path);
    });
    if(_image != null){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BroadcastForm(preview: null, image: _image,)),
      );
    }
  }

  // Future<List> getTemp()async{
  //   return await getTemplates(token);
  // }

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    // getTemp();
  }

  Widget catTile(index) {
    return Container(
      width: MediaQuery.of(context).size.width *0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: selectedIndex != index ? background : button,
            )
          ]
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                child: Text(
                  categoryList[index],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: selectedIndex != index ? FontWeight.w100 : FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: mainDrawer,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Select Images'),
        backgroundColor: button,
        icon: Icon(Icons.camera),
        splashColor: Colors.white,
        onPressed: () {
          Alert(
              style: AlertStyle(
                alertElevation: 15.0,
                backgroundColor: background,
                isButtonVisible: false,
                isCloseButton: false,
                titleStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 30.0,
                )
              ),
              closeIcon: CloseButton(
                color: button,
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
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      tileColor: button,
                      leading: Icon(Icons.add_photo_alternate, color: Colors.white,),
                      title: Text(
                          'Gallery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
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
                      tileColor: button,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      leading: Icon(Icons.camera_alt_outlined, color: Colors.white,),
                      title: Text(
                          'Camera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              )

          ).show();
        },

      ),
      backgroundColor: background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: button),
              backgroundColor: background,
              floating: true,
              centerTitle: true,
              elevation: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Home',
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
                children: [
                Container(
                  height: 55.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context,index) => catTile(index)),
                ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height-220,
                      // child: selectedIndex == 0 ? TemplateTile() : PrevPosters(),
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

