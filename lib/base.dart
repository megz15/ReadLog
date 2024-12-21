import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readlog/words_provider.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> words = context.watch<WordsProvider>().words;
    return Scaffold(
      appBar: AppBar(
        title: Text("ReadLog", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(words[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<WordsProvider>().removeWord(words[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newWord = '';
              return AlertDialog(
                title: Text('Add a word'),
                content: TextField(
                  onChanged: (String value) {
                    newWord = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      context.read<WordsProvider>().addWord(newWord);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
