import 'package:calculadora_imc/models/registro.dart';
import 'package:calculadora_imc/repository/sqliteDatabase.dart';

class RegistroRepository {

  Future<List<Registro>> obterDados() async {
    var db = await SqliteDatabase().getDatabase();
    var result = await db.rawQuery('SELECT * FROM registro_imc');

    List<Registro> registros = [];
    for (var element in result) {
      registros.add(
        Registro.comData(
          int.parse(element['id'].toString()),
          double.parse(element['peso'].toString()),
          double.parse(element['altura'].toString()),
          double.parse(element['imc'].toString()),
          element['faixa'].toString(),
          DateTime.parse(element['data'].toString())
        )
      );
    }

    return registros;
  }

  Future<void> salvar(Registro registro) async {
    var db = await SqliteDatabase().getDatabase();
    await db.rawInsert(
      "INSERT INTO registro_imc (peso, altura, imc, faixa, data) values(?, ?, ?, ?, ?)",
      [
        registro.peso,
        registro.altura,
        registro.imc,
        registro.faixa,
        registro.data.toString()
      ]
    );
  }

  Future<void> update(Registro registro) async {
    var db = await SqliteDatabase().getDatabase();
    await db.rawUpdate(
      "UPDATE registro_imc SET peso = ?, altura = ?, imc = ?, faixa = ?,  WHERE id = ?",
      [
        registro.peso,
        registro.altura,
        registro.imc,
        registro.faixa,
        registro.id,
      ]
    );
  }

  Future<void> remover(int id) async {
    var db = await SqliteDatabase().getDatabase();
    await db.rawDelete(
      "DELETE FROM registro_imc WHERE id = ?",
      [
        id,
      ]
    );
  }
}