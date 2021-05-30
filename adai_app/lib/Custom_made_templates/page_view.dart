import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'predefined_posters.dart';

class PosterTemplateTile extends StatefulWidget {
  const PosterTemplateTile({Key key}) : super(key: key);

  @override
  _PosterTemplateTileState createState() => _PosterTemplateTileState();
}

class _PosterTemplateTileState extends State<PosterTemplateTile> {
  List<CustomMadeTemplate> _list=getCustomTemplates();
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
                  width: MediaQuery.of(context).size.width-25,
                  height: MediaQuery.of(context).size.height-350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.white
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(_list[index].posterLocation),
                        fit: BoxFit.cover
                      )
                  ),
                ),
                Container(
                  child: RichText(
                    
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
