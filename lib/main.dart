import 'package:flutter/material.dart';
import 'package:taskapp/data/data.dart';
import '/rentready.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RendReadyApp(
    accountsRepository: AccountsRepository(),
  ));
}
