import 'package:flutter/material.dart';
import 'package:notes_app/screens/create_note.dart';
import 'package:notes_app/widgets/note_card.dart';
import '../models/notes_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes Application"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return NoteCard(note: notes[index], index: index,onNoteDeleted: onNoteDeleted,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.of(context).push<Note>(
            MaterialPageRoute(builder: (context) =>  CreateNote(onNewNoteCreated: onNewNoteCreated,)),
          );
          if (newNote != null) {
            onNewNoteCreated(newNote);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void onNoteDeleted(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
}
