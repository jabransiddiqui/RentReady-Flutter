import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/presentation.dart';
import '/business_logic/business_logic.dart';
import '/data/data.dart';

class RendReadyApp extends StatelessWidget {
  const RendReadyApp(
      {super.key, required AccountsRepository accountsRepository})
      : _accountsRepository = accountsRepository;

  final AccountsRepository _accountsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _accountsRepository,
      child: BlocProvider(
        create: (context) => AccountsCubit(context.read<AccountsRepository>()),
        child: const RendReadyAppView(),
      ),
    );
  }
}

class RendReadyAppView extends StatelessWidget {
  const RendReadyAppView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent Ready',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
