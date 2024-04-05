import 'package:shared_preferences/shared_preferences.dart';

class CreditCard {
  String cardNumber;
  String cvc;
  String name;
  String provider;
  String expirationDate;
  String phoneNumber;
  String email; // Добавленное поле для email

  CreditCard({
    required this.cardNumber,
    required this.provider,
    required this.name,
    required this.cvc,
    required this.expirationDate,
    required this.phoneNumber,
    required this.email, // Поле email добавлено в конструктор
  });

  factory CreditCard.fromSharedPreferences(SharedPreferences prefs) {
   
    return CreditCard(
      cardNumber: prefs.getString('cardNumber') ?? '',
      provider: prefs.getString('provider') ?? '',
      name: prefs.getString('balance') ?? '',
      cvc: prefs.getString('cvc') ?? '',
      expirationDate: prefs.getString('expirationDate') ?? '',
      phoneNumber: prefs.getString('phoneNumber') ?? '',
      email: prefs.getString('email') ??
          '', // Получение email из SharedPreferences
    );
  }
}
