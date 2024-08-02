import '../models/notes_model.dart';
import 'package:flutter/material.dart';


class NoteView extends StatelessWidget {
  const NoteView(this.note, this.index, this.onNoteDeleted,{super.key} );

  final Note note;
  final int index;

   final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        actions: [
          IconButton(onPressed:(){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("Are you you want to delete this note?"),
                      actions:[
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                          onNoteDeleted(index);
                          Navigator.of(context).pop();
                          
                        }, child: Text("Delete")),

                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Cancel")),
                      ],

                  );


                }

            );
          }, icon: Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              note.body,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
