import 'package:flutter_bloc/flutter_bloc.dart';
import '/business_logic/business_logic.dart';
import '/data/data.dart';
import 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsError()) {
    getAccounts();
  }
  Future getAccounts() async {
    try {
      emit(AccountsInitial());
      final res = await AccountsRepository.instance.getAccounts();
      if (res.accountData != null && (res.accountData?.length ?? 0) > 0) {
        emit(state.copyWith(
            accountsModel: res.accountData, allAccountsModel: res.accountData));
      } else {
        emit(AccountsError());
      }
    } catch (e) {
      emit(AccountsError());
    }
  }

  changeView() {
    emit(state.copyWith(isList: !state.isList));
  }

  filterBy(bool isStateCode) {
    try {
      if (isStateCode) {
        final filter = (state.allAccountsModel ?? [])
            .where((element) => (element.address1Stateorprovince) != null)
            .toList();
        emit(state.copyWith(accountsModel: filter));
      } else {
        final filter = (state.allAccountsModel ?? [])
            .where((element) => (element.statecode) != null)
            .toList();
        emit(state.copyWith(accountsModel: filter));
      }
    } catch (e) {
      emit(AccountsError());
    }
  }

  searchAccount(String key) {
    try {
      if (key.isEmpty) {
        emit(state.copyWith(accountsModel: state.allAccountsModel));
      } else {
        final filter = (state.allAccountsModel ?? [])
            .where((element) =>
                (element.name ?? '')
                    .toLowerCase()
                    .contains(key.toLowerCase()) ||
                (element.accountnumber ?? '')
                    .toLowerCase()
                    .contains(key.toLowerCase()))
            .toList();
        emit(state.copyWith(accountsModel: filter));
      }
    } catch (e) {
      emit(AccountsError());
    }
  }
}
