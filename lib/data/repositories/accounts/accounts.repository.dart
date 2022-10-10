import '../../data.dart';

class AccountsRepository {
  /*AccountsRepository._privateConstructor();

  static final AccountsRepository _instance =
      AccountsRepository._privateConstructor();
  static AccountsRepository get instance => _instance;*/
  AccountsRepository({AccountsAPI? accountsAPI})
      : _accountsAPI = accountsAPI ?? AccountsAPI();

  final AccountsAPI _accountsAPI;

  Future<AccountModel> getAccounts() async {
    try {
      final res = await _accountsAPI.getAccounts();
      return AccountModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
