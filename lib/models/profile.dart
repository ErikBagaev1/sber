import 'package:shared_preferences/shared_preferences.dart';

class CreditCard {
  String cardNumber;
  String cvc;
  String balance;
  String provider;
  String expirationDate;
  String phoneNumber;

  CreditCard({
    required this.cardNumber,
    required this.provider,
    required this.balance,
    required this.cvc,
    required this.expirationDate,
    required this.phoneNumber,
  });

  factory CreditCard.fromSharedPreferences(SharedPreferences prefs) {
    return CreditCard(
      cardNumber: prefs.getString('cardNumber') ?? '',
      provider: prefs.getString('provider') ?? '',
      balance: prefs.getString('balance') ?? '',
      cvc: prefs.getString('cvc') ?? '',
      expirationDate: prefs.getString('expirationDate') ?? '',
      phoneNumber: prefs.getString('phoneNumber') ?? '',
    );
  }
}
