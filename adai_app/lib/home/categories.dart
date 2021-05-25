import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({Key key}) : super(key: key);

  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  List<String> categoryList=['Previous Templates','Custom Made Template'];
  var selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[850],
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context,index)=>CatTile(index)),
    );
  }
  // ignore: non_constant_identifier_names
  Widget CatTile(index){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white12,
            blurRadius: 1.0,
          )
        ]
      ),
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedIndex=index;
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
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 2,
              width: 80,
              color: selectedIndex == index ? Colors.white : Colors.transparent,
            )
          ],
        ),
      ),
    );

  }

}

