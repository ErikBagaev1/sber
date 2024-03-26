import 'package:flutter/material.dart';
import 'package:sber/models/check.dart';

const List<String> listBanks = <String>['Сбербанк', 'Тинькоф', 'ВТБ', 'ОЗОН'];
const List<String> listStatus = <String>[
  'Входящий перевод',
  'Исходящий перевод',
];

class ChekAdd extends StatefulWidget {
  const ChekAdd({Key? key}) : super(key: key);

  @override
  State<ChekAdd> createState() => _ChekAddState();
}

class _ChekAddState extends State<ChekAdd> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fioController = TextEditingController();
  final TextEditingController _cashController = TextEditingController();
  String _selectedStatus = listStatus.first;
  String _selectedBank = listBanks.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AddChekTextField(
            text: 'Дата',
            controller: _dateController,
          ),
          AddChekTextField(
            text: 'ФИО',
            controller: _fioController,
          ),
          AddChekTextField(
            text: 'Сумма',
            controller: _cashController,
          ),
          DropdownButtonExample(
            dropdown: listStatus,
            initialValue: _selectedStatus,
            onChanged: (value) {
              setState(() {
                _selectedStatus = value ?? listBanks.first;
              });
            },
          ),
          DropdownButtonExample(
            dropdown: listBanks,
            initialValue: _selectedBank,
            onChanged: (value) {
              setState(() {
                _selectedBank = value ?? listStatus.first;
              });
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              final newCheck = Chek(
                date: _dateController.text,
                fio: _fioController.text,
                cash: _cashController.text,
                status: _selectedStatus,
                icon: _selectedBank,
              );
              print('Дата: ${newCheck.date}');
              print('ФИО: ${newCheck.fio}');
              print('Сумма: ${newCheck.cash}');
              print('Статус: ${newCheck.status}');
              print('Иконка: ${newCheck.icon}');

              CheckRepository.saveCheck(newCheck);
            },
            child: const Text('Добавить чек'),
          ),
        ],
      ),
    );
  }
}

class AddChekTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const AddChekTextField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(color: Color(0xFFB3BDC6), fontSize: 14),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(102, 149, 146, 146),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatelessWidget {
  final List<String> dropdown;
  final String initialValue;
  final void Function(String?)? onChanged;

  const DropdownButtonExample({
    Key? key,
    required this.dropdown,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButton<String>(
        isExpanded: true,
        value: initialValue,
        onChanged: onChanged,
        items: dropdown.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
