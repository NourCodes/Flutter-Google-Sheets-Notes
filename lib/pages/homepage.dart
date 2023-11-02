import 'dart:async';
import 'package:flutter/material.dart';
import 'package:googlesheets_notes/googlesheets_api.dart';
import 'package:googlesheets_notes/pages/loading_page.dart';
import 'package:googlesheets_notes/components/notes_grid.dart';
import '../components/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //setstate everytime we type something new
    _controller.addListener(() => setState(() {}));
  }

  final TextEditingController _controller = TextEditingController();

  void _postNote() {
    GoogleSheets.insert(_controller.text);
    _controller.clear();
  }

  //waiting the data to be fetched from google sheets
  void loading() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (GoogleSheets.loading == false) {
        setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //start loading until data arrive
    if (GoogleSheets.loading == true) {
      loading();
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blueGrey.shade700,
        centerTitle: true,
        title: const Text("SheetNotes",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                GoogleSheets.loading == true
                    ? const LoadingScreen()
                    : Expanded(
                        child: NotesGrid(),
                      ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),

                    hintText: 'Enter a note...',
                    //    border: const OutlineInputBorder(),
                    filled: true,
                    //focusedBorder: OutlineInputBorder(),
                    fillColor: Colors.grey[200], // Text field background color
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.black),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                  ),
                ),
                Button(function: _postNote, text: "Post"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
