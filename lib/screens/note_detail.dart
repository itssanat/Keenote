import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  
  String appBarTitle;
  NoteDetail(String title){
    this.appBarTitle = title;
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['High', 'Low'];
  String appBarTitle;
  
  NoteDetailState(String title){
    appBarTitle = title;
  }
  
  @override
  Widget build(BuildContext context) {
    
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    
    return WillPopScope (
      onWillPop: (){
        moveToLastScreen();
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            moveToLastScreen();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            
            // first element
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownItem,
                    child: Text(dropDownItem),
                  );
                }).toList(),
                style: titleStyle,
                value: 'Low',
                onChanged: (valueSelectedByUser){
                  setState(() {
                    debugPrint('user selected $valueSelectedByUser');
                  });
                },
              ),
            ),
            
            // second element
            Padding(
              padding: EdgeInsets.only( top: 15.0 , bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: titleStyle,
                onTap: (){
                  debugPrint("list has been changed in title");
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: titleStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              ),
            ),
            
            // third element
            Padding(
              padding: EdgeInsets.only( top: 15.0 , bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: titleStyle,
                onTap: (){
                  debugPrint("list has been in description");
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: titleStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              ),
            ),
            
            // fourth element
            Padding(
              padding: EdgeInsets.only(top: 15.0 , bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save' ,
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        setState(() {
                          debugPrint('Save button clicked');
                        });
                      },
                    ),
                  ),
                  
                  Container(width: 5.0,),
                  
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete' ,
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        setState(() {
                          debugPrint('Delete button clicked');
                        });
                      },
                    ),
                  )
                ],
              ),
            )
            
          ],
        ),
      ),
    ));
  }
  
  
  void moveToLastScreen(){
    Navigator.pop(context);
  }
}
