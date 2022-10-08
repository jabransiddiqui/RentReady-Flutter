import '/core/core.dart';

class AccountsAPI {
  AccountsAPI();

  Future<dynamic> getAccounts() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.accounts);
    } catch (e) {
      rethrow;
    }
  }
}
