import 'package:adai/broadcast/broadcast_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart';

class TemplateTile extends StatefulWidget {
  const TemplateTile({Key key}) : super(key: key);

  @override
  _TemplateTileState createState() => _TemplateTileState();
}

class _TemplateTileState extends State<TemplateTile> {

  @override
  Widget build(BuildContext context) {
    return templates == null
        ? CircularProgressIndicator()
        : ListView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: templates.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BroadcastForm()),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 25,
                        height: MediaQuery.of(context).size.height - 250,
                        child: Image.memory(templates[index]),
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
