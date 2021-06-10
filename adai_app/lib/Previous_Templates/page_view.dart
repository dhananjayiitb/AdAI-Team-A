import 'package:adai/broadcast/broadcast_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart';

class PrevPosters extends StatefulWidget {
  const PrevPosters({Key key}) : super(key: key);

  @override
  _PrevPostersState createState() => _PrevPostersState();
}

class _PrevPostersState extends State<PrevPosters> {

  @override
  Widget build(BuildContext context) {
    return previousPosters == null
        ? Center(child: Text('Hold Posters Tight..', style: TextStyle(color: Colors.white, fontSize: 20),))
        : ListView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: previousPosters.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BroadcastForm(preview: templates[index],)),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 25,
                        height: MediaQuery.of(context).size.height - 250,
                        child: Image.memory(previousPosters[index], fit: BoxFit.fill,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          );
  }
}
