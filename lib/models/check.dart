import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Chek {
  final String icon;
  final String fio;
  final String status;
  final String cash;

  final String date;

  Chek({
    required this.date,
    required this.icon,
    required this.fio,
    required this.status,
    required this.cash,
  });

  // Метод для преобразования объекта Chek в JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'icon': icon,
      'fio': fio,
      'status': status,
      'cash': cash,
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
    );
  }
}

class CheckRepository {
  static const _key = 'checks';

  // Метод для сохранения списка экземпляров класса Chek в SharedPreferences
  static Future<void> saveCheck(Chek check) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? checks = prefs.getStringList(_key);
    checks?.add(jsonEncode(check.toJson()));
    await prefs.setStringList(_key, checks ?? [jsonEncode(check.toJson())]);
  }

  // Метод для загрузки списка экземпляров класса Chek из SharedPreferences
  static Future<List<Chek>> loadChecks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList.map((json) => Chek.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  // Метод для сортировки списка экземпляров класса Chek по дате
  static List<Chek> sortChecksByDate(List<Chek> checks) {
    checks.sort((a, b) => a.date.compareTo(b.date));
    return checks;
  }
}
