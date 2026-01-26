import 'package:imcflutter/models/imc_sql_model.dart';

import 'database_sql.dart';

class ImcSqlRepository {


  Future<List<ImcSqlModel>> obterDados() async{

    List<ImcSqlModel> tarefas = [];
    var db = await DatabaseSql().obterDataBase();
    var result = await db.rawQuery('SELECT id, descricao, concluido FROM tarefas');

    for(var element in result){
      tarefas.add(ImcSqlModel(int.parse(element["id"].toString()) ,element["descricao"].toString(), element["concluido"] == 1));
    }
    return tarefas;
  }

  Future<void> salvar(ImcSqlModel tarefaSqlModel) async{
    var db = await DatabaseSql().obterDataBase();

    await db.rawInsert('INSERT INTO tarefas (descricao, concluido) values(?,?)', [
      tarefaSqlModel.descricao,
      tarefaSqlModel.concluido
    ]);
  }

  Future<void> atualizar(ImcSqlModel tarefaSqlModel) async{
    var db = await DatabaseSql().obterDataBase();

    await db.rawInsert('UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      tarefaSqlModel.descricao,
      tarefaSqlModel.concluido,
      tarefaSqlModel.id
    ]);
  }

  Future<void> delear(int id) async{
    var db = await DatabaseSql().obterDataBase();

    await db.rawInsert('DELETE FROM tarefas WHERE id = ?', [
      id
    ]);
  }

}