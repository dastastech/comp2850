import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'models/note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final appDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  // await Hive.openBox<Note>("notesBox");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _noteController = TextEditingController();

  // late final Box<Note> _notesBox = Hive.box("notesBox");
  // late final _notesBox = Hive.box("notesBox");
  late Box<Note> _notesBox;

  // Future<void> _addNote(Note note) async {
  void _addNote(Note note) async {
    await _notesBox.put("MyNote", note);
    print("Note Box size: ${_notesBox.length}");
  }

  @override
  void initState() async {
    super.initState();
    _notesBox = await Hive.openBox<Note>('notesBox');

    // if (_notesBox.get())
    // _notesBox = Hive.openBox<Note>("notesBox") as Box<Note>;
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _noteController,
              decoration: InputDecoration(labelText: 'Añadir nota'),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _notesBox.listenable(),
              builder: (context, box, _) {
                if (box.values.isEmpty) {
                  return Center(
                    child: Text("No hay notas aún"),
                  );
                }
                return ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    Note note = box.getAt(index) as Note;

                    return ListTile(
                      title: Text(note.title),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          box.deleteAt(index);
                          setState(() {});
                        },
                      ),
                      onTap: () {
                        // Para futuras operaciones como editar
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Note note = Note(
            _noteController.text,
            'Descripción (puedes expandir esto)',
          );
          _addNote(note);
          _noteController.clear();
        },
      ),
    );
  }
}
