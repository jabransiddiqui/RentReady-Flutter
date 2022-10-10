import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskapp/business_logic/business_logic.dart';
import 'package:taskapp/business_logic/cubits/cubits.dart';
import 'package:taskapp/data/data.dart';

AccountModel accountModelDummy = AccountModel.fromJson(
    "{\"value\":[{\"@odata.etag\":\"W/\\\"3222121\\\"\",\"customertypecode\":3,\"address1_latitude\":47.41137,\"merged\":false,\"accountnumber\":\"3006\",\"statecode\":0,\"emailaddress1\":\"pete@contoso.com\",\"exchangerate\":1.000000000000,\"openrevenue_state\":1,\"name\":\"CafeDuo\",\"opendeals\":0,\"modifiedon\":\"2022-09-29T21:31:36Z\",\"address2_addresstypecode\":1,\"_owninguser_value\":\"2b06bf8f-d73f-ed11-9db3-000d3aa96fe9\",\"importsequencenumber\":77,\"address1_composite\":\"16160NE83rdSt\\r\\nRedmond,WA98052\\r\\nUnitedStates\",\"address1_longitude\":-120.55637,\"donotpostalmail\":false,\"accountratingcode\":1,\"marketingonly\":false,\"donotphone\":false,\"preferredcontactmethodcode\":1,\"_ownerid_value\":\"2b06bf8f-d73f-ed11-9db3-000d3aa96fe9\",\"customersizecode\":1,\"openrevenue_date\":\"2022-10-10T08:44:34Z\",\"openrevenue_base\":0.0000000000,\"businesstypecode\":1,\"donotemail\":false,\"address2_shippingmethodcode\":1,\"address1_addressid\":\"dd950051-d498-4ef7-91af-0518eecc3b88\",\"msdyn_gdproptout\":false,\"address2_freighttermscode\":1,\"statuscode\":1,\"createdon\":\"2022-09-29T21:30:00Z\",\"msdyn_travelchargetype\":690970003,\"opendeals_state\":1,\"address1_stateorprovince\":\"WA\",\"openrevenue\":0.0000000000,\"donotsendmm\":false,\"donotfax\":false,\"donotbulkpostalmail\":false,\"address1_country\":\"UnitedStates\",\"versionnumber\":3222121,\"address1_line1\":\"16160NE83rdSt\",\"creditonhold\":false,\"telephone1\":\"265-555-0144\",\"_transactioncurrencyid_value\":\"ead6d7ca-2940-ed11-9db3-000d3aa96fe9\",\"accountid\":\"88019079-e334-46c0-b2da-27d8a73c51dc\",\"donotbulkemail\":false,\"_modifiedby_value\":\"2b06bf8f-d73f-ed11-9db3-000d3aa96fe9\",\"followemail\":true,\"shippingmethodcode\":1,\"address1_freighttermscode\":1,\"_createdby_value\":\"2b06bf8f-d73f-ed11-9db3-000d3aa96fe9\",\"address1_city\":\"Redmond\",\"territorycode\":1,\"_msdyn_serviceterritory_value\":\"52078bb4-940a-ea11-a811-000d3a1b17cf\",\"ownershipcode\":2,\"fax\":\"265-555-0144\",\"msdyn_taxexempt\":false,\"participatesinworkflow\":false,\"accountclassificationcode\":1,\"_owningbusinessunit_value\":\"abb9c689-d73f-ed11-9db3-000d3aa96fe9\",\"address2_addressid\":\"92f3b8f5-4475-4fc5-9ed7-15a98eb9e791\",\"address1_postalcode\":\"98052\",\"_defaultpricelevelid_value\":\"10f883f4-8d0a-ea11-a811-000d3a1b1d16\",\"opendeals_date\":\"2022-10-10T08:44:34Z\"}]}");

class MockAccountsRepository extends Mock implements AccountsRepository {}

class MockAccountModel extends Mock implements AccountModel {}

void main() {
  group('AccountsCubit', () {
    late AccountsRepository accountsRepository;
    late AccountModel accountModel;
    late AccountsCubit accountsCubit;
    setUp(() async {
      accountsRepository = MockAccountsRepository();
      // accountModel = MockAccountModel();
      when(
        () => accountsRepository.getAccounts(),
      ).thenAnswer((value) async => AccountModel());
      accountsCubit = AccountsCubit(accountsRepository);
    });

    test('initial state is correct', () {
      expect(accountsCubit.state,
          const AccountsState(status: AccountsStatus.failure));
    });
    group('fetchAccounts Failed', () {
      blocTest<AccountsCubit, AccountsState>(
        'calls accounts with correct token',
        build: () => accountsCubit,
        act: (cubit) => cubit.getAccounts(),
        verify: (_) {
          verify(() => accountsRepository.getAccounts()).called(2);
        },
      );
      blocTest<AccountsCubit, AccountsState>(
        'emits [loading, failure] when getAccounts throws',
        setUp: () {
          when(
            () => accountsRepository.getAccounts(),
          ).thenThrow(Exception('oops'));
        },
        build: () => accountsCubit,
        act: (cubit) => cubit.getAccounts(),
        expect: () => <AccountsState>[
          const AccountsState(status: AccountsStatus.loading),
          const AccountsState(status: AccountsStatus.failure),
        ],
      );
    });

    group('fetchAccount Success', () {
      setUp(() async {
        accountModel = MockAccountModel();
        accountsRepository = MockAccountsRepository();
        when(() => accountModel.accountData)
            .thenReturn(accountModelDummy.accountData);
        when(() => accountsRepository.getAccounts())
            .thenAnswer((valu) async => accountModel);
        accountsCubit = AccountsCubit(accountsRepository);
      });

      blocTest<AccountsCubit, AccountsState>(
        'emits [loading, success] when getAccounts returns AccountsModel',
        build: () => accountsCubit,
        act: (cubit) => cubit.getAccounts(),
        expect: () => <dynamic>[
          AccountsState(
            allAccountsModel: (accountModelDummy.accountData ?? []),
            accountsModel: (accountModelDummy.accountData ?? []),
            status: AccountsStatus.loading,
          ),
          AccountsState(
            allAccountsModel: (accountModelDummy.accountData ?? []),
            accountsModel: (accountModelDummy.accountData ?? []),
            status: AccountsStatus.success,
          ),
        ],
      );
    });
  });
}
