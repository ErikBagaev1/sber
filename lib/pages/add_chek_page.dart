import 'package:flutter/material.dart';
import 'package:sber/models/check.dart';

const List<String> listBanks = <String>[
  'Сбербанк',
  'Тинькоф',
  'ВТБ',
  'OZON',
  'Альфа банк',
  'Почта банк',
  'Зенит банк',
  'Райфайзен банк',
  'Открытие банк',
  'Россельхоз банк',
  'УБРиР банк',
  'Совком банк',
  'Росбанк',
  'РНКБ банк',
  'Сургут банк',
  'Газпром банк',
  'Уралсиб банк',
];
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
  String _successMessage = '';
  @override
  void dispose() {
    _dateController.dispose();
    _fioController.dispose();
    _cashController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

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
                cash: double.parse(_cashController.text),
                status: _selectedStatus,
                icon: _selectedBank,
              );

              CheckRepository.saveCheck(newCheck);
              setState(() {
                _successMessage = 'Чек успешно добавлен!';
              });

              // Очищаем поля ввода после успешного добавления
              _dateController.clear();
              _fioController.clear();
              _cashController.clear();

              // Задержка перед скрытием сообщения
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _successMessage = '';
                });
              });
            },
            child: const Text('Добавить чек'),
          ),
          // Отображаем сообщение об успешном добавлении
          if (_successMessage.isNotEmpty)
            Text(
              _successMessage,
              style: const TextStyle(
                color: Color(0xFF08A652),
                fontWeight: FontWeight.bold,
              ),
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
        style: const TextStyle(color: Color.fromARGB(211, 27, 234, 9)),
        controller: controller,
        decoration: InputDecoration(
          focusColor: const Color(0xFFB3BDC6),
          hintText: text,
          hintStyle: const TextStyle(color: Color(0xFFB3BDC6), fontSize: 14),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(102, 75, 76, 75),
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
        dropdownColor: const Color.fromARGB(255, 75, 76, 75),
        value: initialValue,
        onChanged: onChanged,
        items: dropdown.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Color.fromARGB(211, 27, 234, 9)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
