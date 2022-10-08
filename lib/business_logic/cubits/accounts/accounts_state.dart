import 'package:equatable/equatable.dart';
import '../../../data/data.dart';

class AccountsState extends Equatable {
  const AccountsState({this.accountsModel});
  final List<AccountData>? accountsModel;

  @override
  List<Object?> get props => [accountsModel];

  AccountsState copyWith({List<AccountData>? accountsModel}) {
    return AccountsState(accountsModel: accountsModel ?? this.accountsModel);
  }
}

class AccountsInitial extends AccountsState {}

class AccountsError extends AccountsState {}
