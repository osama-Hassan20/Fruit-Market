import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'db_states.dart';

class DataBaseCubit extends Cubit<DataBaseStates> {
  DataBaseCubit() : super (DBInitialStates());

  static DataBaseCubit get(context) => BlocProvider.of(context);


  late Database database;
  void createDatabase() {
    openDatabase(
      'Notes.db',
      version: 1,
      onCreate: (database, version) {
        if (kDebugMode) {
          print('database create');
        }

        database.execute(
            'CREATE TABLE Notes(id INTEGER PRIMARY KEY,title TEXT,subtitle TEXT)')
            .then((value) {
          if (kDebugMode) {
            print('Table Notes Created');
          }
        }).catchError((error) {
          if (kDebugMode) {
            print('error when creating table ${error.toString()}');
          }
        });
      },
      onOpen: (database) {
        getData(database);
        if (kDebugMode) {
          print('DataBase Opened');
        }

      },
    ).then((value) {
      database = value;
      emit(DBCreateSuccessStates());
    }).catchError((error){
      emit(DBCreateErrorStates());
    });
  }


  insertNotes({
    required String title,
    required String subtitle,

  }) async
  {
    await database.transaction((txn) async {
      return txn.rawInsert(
          'INSERT INTO Notes(title,subtitle)VALUES("$title","$subtitle")'
      ).then((value) {
        if (kDebugMode) {
          print('$value inserted successfully');
        }
        emit(DBAddSuccessStates());

        getData(database);

      }).catchError((error) {
        if (kDebugMode) {
          print('error when inserting new record ${error.toString()}');
        }
        emit(DBAddErrorStates());
      });
    });
  }


  List<Map> notes = [];
  void getData(database) {
    notes = [];
    database.rawQuery('SELECT * FROM Notes').then((value) {
      value.forEach((element) {
        notes.add(element);
      });

      emit(DBGetSuccessStates());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(DBGetErrorStates());
    });
  }

  // updateNoteInDB(NotesModel updatedNote) async {
  //   final db = await database;
  //   await db.update('Notes', updatedNote.toMap(),
  //       where: '_id = ?', whereArgs: [updatedNote.id]);
  //   print('Note updated: ${updatedNote.title} ${updatedNote.content}');
  // }

  void UpdateData({
    required String subtitle,
    required int id,
  }) async {
    await database.rawUpdate(
      'UPDATE Notes SET subtitle = ? WHERE id = ?',
      [subtitle, id],
    )
      // await database.update('Notes', {title:'title',subtitle:'subtitle'},
    //     where: 'id = ?', whereArgs: [id])
        .then((value) {
      getData(database);
      emit(DBUpdateSuccessStates());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(DBUpdateErrorStates());
    });
  }

  void deleteData({
    required int id,
  }) async {
    await database.rawDelete(
      'DELETE FROM Notes WHERE id = ?', [id],
    ).then((value) {
      getData(database);
      emit(DBDeleteSuccessStates());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(DBDeleteErrorStates());
    });
  }

}



