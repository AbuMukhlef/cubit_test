import 'dart:io';
import 'package:cubit_test/model/company.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

Future<List<Company>> importExcel() async {
  var result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'],
  );

  List<Company> companies = [];

  List<String> names = [];
  List<String> emails = [];

  late dynamic numFormat;
  if (result != null) {
    var bytes = File(result.files.single.path!).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      // print(table); //sheet Name
      // print(excel.tables[table]?.maxColumns);
      // print(excel.tables[table]?.maxRows);
      for (var row in excel.tables[table]?.rows ?? []) {
        for (var cell in row) {
          // print('cell ${cell?.rowIndex}/${cell?.columnIndex}');
          final value = cell?.value;
          // print('  value: $value');
          numFormat = cell?.cellStyle?.numberFormat ?? NumFormat.standard_0;
          if (cell?.rowIndex != 0) {
            switch (value) {
              case null:
                print('  empty cell');
                print('  format: $numFormat');
              case TextCellValue():
                if (cell?.columnIndex == 0) {
                  names.add('$value');
                } else {
                  emails.add('$value');
                }

              case FormulaCellValue():
              case IntCellValue():
              case BoolCellValue():
              case DoubleCellValue():
              case DateCellValue():
              case TimeCellValue():
              case DateTimeCellValue():
            }
          }
        }
      }

      for (var email in emails) {
        companies.add(Company.fromJson(
            {'name': names[emails.indexOf(email)], 'email': email}));
      }
    }
    return companies;
  } else {
    return [];
  }
}
