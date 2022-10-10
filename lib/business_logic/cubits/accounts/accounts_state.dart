import 'package:equatable/equatable.dart';
import '../../../data/data.dart';

enum AccountsStatus { initial, loading, success, failure }

extension AccountsStatusX on AccountsStatus {
  bool get isInitial => this == AccountsStatus.initial;
  bool get isLoading => this == AccountsStatus.loading;
  bool get isSuccess => this == AccountsStatus.success;
  bool get isFailure => this == AccountsStatus.failure;
}

class AccountsState extends Equatable {
  const AccountsState(
      {this.allAccountsModel,
      this.accountsModel,
      this.isList = true,
      this.status = AccountsStatus.initial});
  final List<AccountData>? allAccountsModel;
  final List<AccountData>? accountsModel;
  final bool isList;
  final AccountsStatus status;

  @override
  List<Object?> get props => [allAccountsModel, accountsModel, isList, status];

  AccountsState copyWith(
      {List<AccountData>? accountsModel,
      List<AccountData>? allAccountsModel,
      bool? isList,
      AccountsStatus? status}) {
    return AccountsState(
      accountsModel: accountsModel ?? this.accountsModel,
      allAccountsModel: allAccountsModel ?? this.allAccountsModel,
      isList: isList ?? this.isList,
      status: status ?? this.status,
    );
  }
}
