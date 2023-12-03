import 'package:flutter/material.dart';

final _icons = <String,IconData>{
  'home': Icons.home,
  'account_circle': Icons.account_circle,
  'adb_sharp': Icons.abc_sharp,
  'account_circle_outlined': Icons.account_circle_outlined,
  'account_balance_wallet_sharp': Icons.account_balance_wallet_sharp,
  'add_card_rounded': Icons.add_card_rounded,
  'ac_unit': Icons.ac_unit,
  'account_balance_sharp': Icons.account_balance_sharp,
  'production_quantity_limits': Icons.production_quantity_limits
};
Icon getIcon(String nombre){
  return Icon(_icons[nombre],color: Colors.pinkAccent);
}