import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/extensions/extension.dart';
import '/business_logic/business_logic.dart';
import '/presentation/presentation.dart';
import 'package:taskapp/data/model/accounts/account.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text('Rent Ready'),
      ),
      body: BlocBuilder<AccountsCubit, AccountsState>(
        builder: (context, state) {
          if (state.status.isInitial || state.status.isLoading) {
            return SizedBox(
                height: MediaQuery.of(context).size.height - 250,
                child: const Center(
                  child: CircularProgressIndicator(),
                ));
          } else if (state.status.isSuccess &&
              state.accountsModel != null &&
              (state.accountsModel?.length ?? 0) >= 0) {
            final data = state.accountsModel ?? [];
            return SuccessStateWidget(state, data);
          } else {
            return const NoWidgetMethod(
                'No account data/error while fetching.');
          }
        },
      ),
    );
  }
}
