import 'package:flutter/cupertino.dart';
import 'package:googlesheets_notes/googlesheets_api.dart';
import 'package:googlesheets_notes/components/text_box.dart';
class NotesGrid extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: GoogleSheets.currentNotes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return TextBox(text:GoogleSheets.currentNotes[index]);
      },
    );
  }
}
