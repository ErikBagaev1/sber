import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClearDataScreen extends StatelessWidget {
  const ClearDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clear Data'),
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
    await prefs.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Очистить все чеки'),
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
          content: Text('Очистить последний чек'),
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
