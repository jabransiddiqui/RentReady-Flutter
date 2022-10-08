import 'package:flutter_bloc/flutter_bloc.dart';
import 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsInitial());
}
