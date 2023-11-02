import 'package:gsheets/gsheets.dart';
import 'credentials.dart';

class GoogleSheets {
//create credentials from json file
  static const String _credentials = GoogleSheetsCredentials.credentials;


//set up and connect to the spreadsheet
//spreadsheet id
  static const _spreadsheetId = GoogleSheetsCredentials.spreadsheetId;
//initialize GSheet
  static final _GSheet = GSheets(_credentials);
  static Worksheet? _worksheet;
  static bool loading = true;

  //initialize spreadsheet
  Future init() async {
    //fetch spreadsheet by its ID
    final spreadsheet = await _GSheet.spreadsheet(_spreadsheetId);

    //get worksheet by its title
    _worksheet = spreadsheet.worksheetByTitle("worksheet");
    countRows();
  }

  // Variables to keep track of note data
  static int numberOfNotes = 0;
  static List<String> currentNotes = [];

  // Determining the number of rows in the sheet
  static Future countRows() async {
    while (
        (await _worksheet!.values.value(column: 1, row: numberOfNotes + 1)) !=
            "") {
      numberOfNotes++;
    }
    //now we know how many notes to load, now lets load them
    loadNotes();
  }
  // Loading notes from the spreadsheet
  static void loadNotes() async {
    if (_worksheet == null) return;

    for (int i = 0; i < numberOfNotes; i++) {
      final String newNote =
          await _worksheet!.values.value(column: 1, row: i + 1);
      if (currentNotes.length < numberOfNotes) {
        currentNotes.add(newNote);
      }
    }
    loading = false;
  }

  //insert a new note in spreadsheet
  static Future insert(String note) async {
    if (_worksheet == null) return;
    numberOfNotes++;
    currentNotes.add(note);
    await _worksheet!.values.appendRow([note]);
  }
}
