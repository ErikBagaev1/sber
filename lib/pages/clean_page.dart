import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClearDataScreen extends StatelessWidget {
  const ClearDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Очистка данных'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _clearAllData(context);
              },
              child: const Text('Очистить все чеки'),
            ),
            ElevatedButton(
              onPressed: () {
                _clearLastEntry(context);
              },
              child: const Text('Очистить последний чек'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _clearAllData(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Устанавливаем пустой список для ключа 'checks', чтобы удалить все чеки
    await prefs.setStringList('checks', []);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Очищены все чеки'),
      ),
    );
  }

  Future<void> _clearLastEntry(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? checks = prefs.getStringList('checks');
    if (checks != null && checks.isNotEmpty) {
      checks.removeLast();
      await prefs.setStringList('checks', checks);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Очистить все данные'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No entries to clear.'),
        ),
      );
    }
  }
}
