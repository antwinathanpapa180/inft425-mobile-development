import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item.dart';

class StorageService {
  static const String _storageKey = 'vvu_items_key';

  // Load items from local storage
  Future<List<Item>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_storageKey);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Item.fromJson(json)).toList();
  }

  // Save items list to local storage
  Future<void> saveItems(List<Item> items) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_storageKey, jsonString);
  }
}
