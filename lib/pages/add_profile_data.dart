import 'package:flutter/material.dart';
import 'package:sber/main.dart';
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
  TextEditingController emailController =
      TextEditingController(); // Добавлен контроллер для email

  @override
  void dispose() {
    // Освобождение ресурсов контроллеров
    cardNumberController.dispose();
    cvcController.dispose();
    balanceController.dispose();
    expirationDateController.dispose();
    phoneNumberController.dispose();
    providerController.dispose();
    emailController.dispose(); // Освобождение ресурсов контроллера для email
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
      body: ListView(
        children: [
          Padding(
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
                  decoration:
                      const InputDecoration(labelText: 'visa masterkard'),
                ),
                TextField(
                  controller: balanceController,
                  decoration: const InputDecoration(labelText: 'Имя'),
                ),
                TextField(
                  controller: expirationDateController,
                  decoration:
                      const InputDecoration(labelText: 'До какого работает'),
                ),
                TextField(
                  controller: phoneNumberController,
                  decoration:
                      const InputDecoration(labelText: 'Номер телефона'),
                ),
                TextField(
                  controller: emailController, // Привязка контроллера для email
                  decoration: const InputDecoration(
                      labelText:
                          'Электронная почта'), // Добавлено поле для ввода email
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    saveCreditCardData();
                    Future.delayed(Duration.zero, () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const MyApp()),
                        (Route<dynamic> route) => false,
                      );
                    });
                  },
                  child: const Text('Сохранить'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveCreditCardData() async {
    final isMounted = mounted;
    print(emailController.text);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cardNumber', cardNumberController.text);
    await prefs.setString('cvc', cvcController.text);
    await prefs.setString('balance', balanceController.text);
    await prefs.setString('expirationDate', expirationDateController.text);
    await prefs.setString('phoneNumber', phoneNumberController.text);
    await prefs.setString('provider', providerController.text);
    await prefs.setString(
        'email', emailController.text); // Сохранение email в SharedPreferences
    if (isMounted) {
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
      emailController.clear(); // Очистка значения email
    }
  }

  Future<void> deleteCreditCardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cardNumber');
    await prefs.remove('cvc');
    await prefs.remove('balance');
    await prefs.remove('expirationDate');
    await prefs.remove('phoneNumber');
    await prefs.remove('provider');
    await prefs.remove('email'); // Удаление email из SharedPreferences
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Данные карты удалены'),
    ));
  }
}
