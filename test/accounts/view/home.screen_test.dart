import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskapp/business_logic/business_logic.dart';
import 'package:taskapp/data/data.dart';
import 'package:taskapp/presentation/presentation.dart';
import 'package:taskapp/rentready.dart';

class MockAccountsCubit extends MockCubit<AccountsState>
    implements AccountsCubit {}

class MockAccountsRepository extends Mock implements AccountsRepository {}

void main() {
  group('HomeScreen', () {
    late AccountsCubit accountCubit;
    late AccountsRepository accountRepository;

    setUp(() {
      accountCubit = MockAccountsCubit();
      accountRepository = AccountsRepository();
    });

    testWidgets('renders HomeScreen', (tester) async {
      when(() => accountCubit.state)
          .thenReturn(const AccountsState(status: AccountsStatus.initial));
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: accountRepository,
          child: BlocProvider.value(
            value: accountCubit,
            child: const RendReadyAppView(),
          ),
        ),
      );
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('renders HomeScreen Initial', (tester) async {
      when(() => accountCubit.state)
          .thenReturn(const AccountsState(status: AccountsStatus.initial));
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: accountRepository,
          child: BlocProvider.value(
            value: accountCubit,
            child: const MaterialApp(
              home: HomeScreen(),
            ),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    testWidgets('renders HomeScreen Failure', (tester) async {
      when(() => accountCubit.state)
          .thenReturn(const AccountsState(status: AccountsStatus.failure));
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: accountRepository,
          child: BlocProvider.value(
            value: accountCubit,
            child: const MaterialApp(
              home: HomeScreen(),
            ),
          ),
        ),
      );
      expect(find.byType(NoDataWidget), findsOneWidget);
    });

    /*testWidgets('renders HomeScreen Success', (tester) async {
      when(() => accountCubit.state).thenReturn(AccountsState(
        status: AccountsStatus.success,
        accountsModel: accountModelDummy.accountData,
        allAccountsModel: accountModelDummy.accountData,
        isList: true,
      ));
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: accountRepository,
          child: BlocProvider.value(
            value: accountCubit,
            child: const MaterialApp(
              home: HomeScreen(),
            ),
          ),
        ),
      );
      expect(find.byType(SuccessStateWidget), findsWidgets);
    });*/
  });
}
