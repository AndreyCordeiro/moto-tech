// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class BancoDados {
//   static final BancoDados _instance = BancoDados.internal();

//   factory BancoDados() => _instance;

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }

//     _database = await inicializarBancoDados();
//     return _database!;
//   }

//   BancoDados.internal();

//   Future<Database> inicializarBancoDados() async {
//     String path = await getDatabasesPath();
//     path = join(path, 'meu_banco_de_dados.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         await db.execute('''
//           CREATE TABLE IF NOT EXISTS minha_tabela (
//             id INTEGER PRIMARY KEY,
//             nome TEXT,
//             email TEXT
//           )
//         ''');
//       },
//     );
//   }

//   Future<int> inserirDados(Map<String, dynamic> dados) async {
//     Database db = await database;
//     return await db.insert('minha_tabela', dados);
//   }

//   Future<List<Map<String, dynamic>>> obterDados() async {
//     Database db = await database;
//     return await db.query('minha_tabela');
//   }
// }
