import '../../data.dart';

class AccountsRepository {
  AccountsRepository._privateConstructor();

  static final AccountsRepository _instance =
      AccountsRepository._privateConstructor();
  static AccountsRepository get instance => _instance;

  final AccountsAPI _accountsAPI = AccountsAPI();

  Future<AccountModel> getAccounts() async {
    try {
      final res = await _accountsAPI.getAccounts();
      return AccountModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
