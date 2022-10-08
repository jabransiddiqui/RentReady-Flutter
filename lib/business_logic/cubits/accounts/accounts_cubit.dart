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
        emit(state.copyWith(accountsModel: res.accountData));
      } else {
        emit(AccountsError());
      }
    } catch (e) {
      emit(AccountsError());
    }
  }
}
