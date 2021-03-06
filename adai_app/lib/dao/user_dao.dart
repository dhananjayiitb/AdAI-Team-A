import 'package:adai/database/user_database.dart';
import 'package:adai/model/user_model.dart';
import 'package:adai/globals.dart' as globals;

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createUser(User user) async {
    final db = await dbProvider.database;

    var result = db.insert(userTable, user.toDatabaseJson());
    return result;
  }

  Future<int> deleteUser(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(userTable, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<bool> checkUser(int id) async {
    final db = await dbProvider.database;
    try {
      List<Map> users =
          await db.query(userTable, where: 'id = ?', whereArgs: [id]);
      if (users.length > 0) {
        globals.token = users[0]['token'];
        globals.phoneNum = users[0]['username'];
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  // Future<String> getusername(int id) async {
  //   final db = await dbProvider.database;
  //   try {
  //     List<Map> users =
  //         await db.query(userTable, where: 'id = ?', whereArgs: [id]);
  //     if (users.length > 0) {
  //       return users[0]['username'];
  //     } else {
  //       return "";
  //     }
  //   } catch (error) {
  //     return "";
  //   }
  // }
}
