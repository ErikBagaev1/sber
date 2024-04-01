import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProfileData extends StatefulWidget {
  const AddProfileData({super.key});

  @override
  _AddProfileDataState createState() => _AddProfileDataState();
}

class _AddProfileDataState extends State<AddProfileData> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController providerController = TextEditingController();
  @override
  void dispose() {
    // Освобождение ресурсов контроллеров
    cardNumberController.dispose();
    cvcController.dispose();
    balanceController.dispose();
    expirationDateController.dispose();
    phoneNumberController.dispose();
    providerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card Form'),
        actions: [
          IconButton(
            onPressed: () {
              deleteCreditCardData();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(labelText: 'Номер карты'),
            ),
            TextField(
              controller: cvcController,
              decoration: const InputDecoration(labelText: 'CVC'),
            ),
            TextField(
              controller: providerController,
              decoration: const InputDecoration(labelText: 'visa masterkard'),
            ),
            TextField(
              controller: balanceController,
              decoration: const InputDecoration(labelText: 'Баланс'),
            ),
            TextField(
              controller: expirationDateController,
              decoration:
                  const InputDecoration(labelText: 'До какого работает'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Номер телефона'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                saveCreditCardData();
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveCreditCardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cardNumber', cardNumberController.text);
    await prefs.setString('cvc', cvcController.text);
    await prefs.setString('balance', balanceController.text);
    await prefs.setString('expirationDate', expirationDateController.text);
    await prefs.setString('phoneNumber', phoneNumberController.text);
    await prefs.setString('provider', providerController.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Данные сохранены'),
    ));
    // Очистка значений в текстовых полях
    cardNumberController.clear();
    cvcController.clear();
    balanceController.clear();
    expirationDateController.clear();
    phoneNumberController.clear();
    providerController.clear();
  }

  Future<void> deleteCreditCardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cardNumber');
    await prefs.remove('cvc');
    await prefs.remove('balance');
    await prefs.remove('expirationDate');
    await prefs.remove('phoneNumber');
    await prefs.remove('provider');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Данные карты удалены'),
    ));
  }
}
