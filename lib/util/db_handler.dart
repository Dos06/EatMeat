import 'dart:io';

import 'package:eat_meat/models/menu_item.dart';
import 'package:eat_meat/models/restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHandler {
  DbHandler._privateConstructor();

  static final DbHandler instance = DbHandler._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'db.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static List<MenuItem> items = [];

  addItem(item){
    items.add(item);
    debugPrint(items.length.toStringAsFixed(2));
  }

  getBasketItems(){
    return items;
  }

  getBasketSubTotal(){
    double summ = 0;
    items.forEach((element) {
      summ+=element.price;
    });

    return summ.toStringAsFixed(2);
  }

  getBasketService(){
    double summ = 0;
    items.forEach((element) {
      summ+=element.price;
    });
    
    double service = summ * 0.1;
    
    return service.toStringAsFixed(2);
  }

  getBasketTotal() {
    double summ = 0;
    items.forEach((element) {
      summ+=element.price;
    });

    double service = summ * 0.1;
    
    double total = service + summ;
    
    return total.toStringAsFixed(2);
  }

  clearBasket() {
    items = [];
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "create table if not exists restaurants(id INTEGER PRIMARY KEY, "
        "name TEXT, "
        "imageUrl TEXT, "
        "rating DOUBLE, "
        "distance DOUBLE "
        ");");
  }

  Future<List<Restaurant>> getRestaurants() async {
    Database db = await instance.database;
    var restaurants = await db.query('restaurants', orderBy: 'name');
    List<Restaurant> list = restaurants.isNotEmpty
        ? restaurants.map((i) => Restaurant.fromMap(i)).toList()
        : [];
    return list;
  }

  Future<int> add(Restaurant restaurant) async {
    Database db = await instance.database;
    return await db.insert('restaurants', restaurant.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('restaurants', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> dropTable() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'db.db');
    Database db = await openDatabase(path, onCreate: _onCreate);
    await db.execute("DROP TABLE IF EXISTS restaurants");
  }
}
