import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'predefined_posters.dart';

class TemplateTile extends StatefulWidget {
  const TemplateTile({Key key}) : super(key: key);

  @override
  _TemplateTileState createState() => _TemplateTileState();
}

class _TemplateTileState extends State<TemplateTile> {
  List<Template> _list = getTemplates();
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
            onTap: (){},
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 25,
                  height: MediaQuery.of(context).size.height - 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
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
                // Container(
                //   child: RichText(
                //   ),
                // )
              ],
            ),
          ),
        );
      }
    );
  }
}
