import 'package:adai/broadcast/broadcast_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'previous_templates_data.dart';

class PrevPosters extends StatefulWidget {
  const PrevPosters({Key key}) : super(key: key);

  @override
  _PrevPostersState createState() => _PrevPostersState();
}

class _PrevPostersState extends State<PrevPosters> {
  List<PreviousPosters> _list = getPreviousPosters();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: _list.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BroadcastForm(preview: _list[index].posterLocation)),
              );
            },
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 25,
                  height: MediaQuery.of(context).size.height - 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(_list[index].posterLocation),
                          fit: BoxFit.cover
                      )
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
