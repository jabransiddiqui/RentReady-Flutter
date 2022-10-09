import 'package:equatable/equatable.dart';
import '../../../data/data.dart';

class AccountsState extends Equatable {
  const AccountsState(
      {this.allAccountsModel, this.accountsModel, this.isList = true});
  final List<AccountData>? allAccountsModel;
  final List<AccountData>? accountsModel;
  final bool isList;

  @override
  List<Object?> get props => [allAccountsModel, accountsModel, isList];

  AccountsState copyWith(
      {List<AccountData>? accountsModel,
      List<AccountData>? allAccountsModel,
      bool? isList}) {
    return AccountsState(
      accountsModel: accountsModel ?? this.accountsModel,
      allAccountsModel: allAccountsModel ?? this.allAccountsModel,
      isList: isList ?? this.isList,
    );
  }
}

class AccountsInitial extends AccountsState {}

class AccountsError extends AccountsState {}
