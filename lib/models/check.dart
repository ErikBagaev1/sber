import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Chek {
  final String icon; // Путь к иконке (изображению)
  final String fio;
  final String status;
  final double cash;
  final String date;
  final String image; // Путь к изображению

  Chek({
    required this.date,
    required this.icon,
    required this.fio,
    required this.status,
    required this.cash,
    required this.image, // Добавляем поле для изображения
  });

  // Метод для преобразования объекта Chek в JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'icon': icon,
      'fio': fio,
      'status': status,
      'cash': cash,
      'image': image, // Добавляем поле для изображения
    };
  }

  // Фабричный метод для создания объекта Chek из JSON
  factory Chek.fromJson(Map<String, dynamic> json) {
    return Chek(
      date: json['date'],
      icon: json['icon'],
      fio: json['fio'],
      status: json['status'],
      cash: json['cash'],
      image: json['image'], // Добавляем поле для изображения
    );
  }
}

class CheckRepository {
  static const _key = 'checks';

  // Метод для сохранения списка экземпляров класса Chek в SharedPreferences
  static Future<void> saveCheck(Chek check) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? checks = prefs.getStringList(_key);
    checks ??= [];
    checks.add(jsonEncode(check.toJson()));
    await prefs.setStringList(_key, checks);
  }

  // Метод для загрузки списка экземпляров класса Chek из SharedPreferences
  static Future<List<Chek>> loadChecks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStringList = prefs.getStringList(_key);
    if (jsonStringList != null) {
      final jsonList =
          jsonStringList.map((jsonString) => jsonDecode(jsonString)).toList();
      return jsonList.map((json) => Chek.fromJson(json)).toList();
    } else {
      return [];
    }
  }

// Метод для очистки данных в SharedPreferences
  Future<void> clearSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
