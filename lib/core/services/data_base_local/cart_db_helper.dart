import 'package:e_commerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDBHelper {
  CartDBHelper._();
  static final db = CartDBHelper._();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDataBase();
    return _database;
  }

  initDataBase() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''  
            CREATE TABLE CartProductsTable (
            name TEXT NOT NULL,
            image TEXT NOT NULL,
            price TEXT NOT NULL,
            productId TEXT NOT NULL,
            QUANTITY INTEGER NOT NULL)''');
    });
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    dbClient.insert('CartProductsTable', model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>>getAllProduct()async{
    var dbClient = await database;
    List<Map> maps = await dbClient.query('CartProductsTable');
    List<CartProductModel> list = maps.isNotEmpty?
        maps.map((product) => CartProductModel.formJson(product)).toList()
  :[];
    return list;
  }


}
