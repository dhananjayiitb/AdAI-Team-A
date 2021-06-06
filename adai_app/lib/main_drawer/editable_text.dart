import 'package:flutter/material.dart';

// ignore: camel_case_types
class EditableText_Own extends StatefulWidget {
  final String initialText;
  const EditableText_Own(this.initialText, {Key key}) : super(key: key);

  @override
  _EditableText_OwnState createState() => _EditableText_OwnState();
}

// ignore: camel_case_types
class _EditableText_OwnState extends State<EditableText_Own> {

  bool _isEditingText = false;
  TextEditingController _editingController;
  // ignore: non_constant_identifier_names
  String InitialText;
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: InitialText?.isEmpty ?? true ? widget.initialText : InitialText);
  }

  @override
  void dispose() {
    super.dispose();
    _editingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (_isEditingText)
      return Container(
        width: 150,
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
            ),
            cursorColor: Colors.white,
            textCapitalization: TextCapitalization.words,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
            onSubmitted: (newValue){
              setState(() {
                InitialText = newValue;
                _isEditingText = false;
              });
            },
            autofocus: true,
            controller: _editingController,
          ),
        ),
      );
    return InkWell(
      onTap: (){
        setState(() {
          _isEditingText=true;
        });
      },
      child: Text(
        InitialText?.isEmpty ?? true ? widget.initialText : InitialText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 23.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
