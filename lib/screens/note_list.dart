import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keenote/screens/note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keenote'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB pressed');
          navigateToDetail('Add note');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(
              "dummy title",
              style: titleStyle,
            ),
            subtitle: Text('dummy date'),
            trailing: Icon(Icons.delete),
            onTap: () {
              debugPrint('list tapped');
              navigateToDetail('Edit note');
            },
          ),
        );
      },
    );
  }
  
  void navigateToDetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetail(title);
    }));
  }
  
}
