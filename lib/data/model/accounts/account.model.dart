import 'dart:convert';

class AccountModel {
  AccountModel({
    this.accountData,
  });

  final List<AccountData>? accountData;

  factory AccountModel.fromJson(String str) =>
      AccountModel.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

  factory AccountModel.fromMap(Map<String?, dynamic> json) => AccountModel(
        accountData: json["value"] == null
            ? null
            : List<AccountData>.from(
                json["value"].map((x) => AccountData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "value": accountData == null
            ? null
            : List<dynamic>.from(accountData!.map((x) => x.toMap())),
      };
}

class AccountData {
  AccountData(
      {this.customertypecode,
      this.address1Latitude,
      this.merged,
      this.accountnumber,
      this.statecode,
      this.emailaddress1,
      this.exchangerate,
      this.openrevenueState,
      this.name,
      this.opendeals,
      this.modifiedon,
      this.address2Addresstypecode,
      this.owninguserValue,
      this.importsequencenumber,
      this.address1Composite,
      this.address1Longitude,
      this.donotpostalmail,
      this.accountratingcode,
      this.marketingonly,
      this.donotphone,
      this.preferredcontactmethodcode,
      this.owneridValue,
      this.customersizecode,
      this.openrevenueDate,
      this.openrevenueBase,
      this.businesstypecode,
      this.donotemail,
      this.address2Shippingmethodcode,
      this.address1Addressid,
      this.msdynGdproptout,
      this.address2Freighttermscode,
      this.statuscode,
      this.createdon,
      this.msdynTravelchargetype,
      this.opendealsState,
      this.address1Stateorprovince,
      this.openrevenue,
      this.donotsendmm,
      this.donotfax,
      this.donotbulkpostalmail,
      this.address1Country,
      this.versionnumber,
      this.address1Line1,
      this.creditonhold,
      this.telephone1,
      this.transactioncurrencyidValue,
      this.accountid,
      this.donotbulkemail,
      this.modifiedbyValue,
      this.followemail,
      this.shippingmethodcode,
      this.address1Freighttermscode,
      this.createdbyValue,
      this.address1City,
      this.territorycode,
      this.msdynServiceterritoryValue,
      this.ownershipcode,
      this.fax,
      this.msdynTaxexempt,
      this.participatesinworkflow,
      this.accountclassificationcode,
      this.owningbusinessunitValue,
      this.address2Addressid,
      this.address1Postalcode,
      this.defaultpricelevelidValue,
      this.entityimageurl});

  final dynamic customertypecode;
  final dynamic address1Latitude;
  final bool? merged;
  final String? accountnumber;
  final dynamic statecode;
  final String? emailaddress1;
  final dynamic exchangerate;
  final dynamic openrevenueState;
  final String? name;
  final dynamic opendeals;
  final DateTime? modifiedon;
  final dynamic address2Addresstypecode;
  final String? owninguserValue;
  final dynamic importsequencenumber;
  final String? address1Composite;
  final dynamic address1Longitude;
  final bool? donotpostalmail;
  final dynamic accountratingcode;
  final bool? marketingonly;
  final bool? donotphone;
  final dynamic preferredcontactmethodcode;
  final String? owneridValue;
  final dynamic customersizecode;
  final DateTime? openrevenueDate;
  final dynamic openrevenueBase;
  final dynamic businesstypecode;
  final bool? donotemail;
  final dynamic address2Shippingmethodcode;
  final String? address1Addressid;
  final bool? msdynGdproptout;
  final dynamic address2Freighttermscode;
  final dynamic statuscode;
  final DateTime? createdon;
  final dynamic msdynTravelchargetype;
  final dynamic opendealsState;
  final String? address1Stateorprovince;
  final dynamic openrevenue;
  final bool? donotsendmm;
  final bool? donotfax;
  final bool? donotbulkpostalmail;
  final String? address1Country;
  final dynamic versionnumber;
  final String? address1Line1;
  final bool? creditonhold;
  final String? telephone1;
  final String? transactioncurrencyidValue;
  final String? accountid;
  final bool? donotbulkemail;
  final String? modifiedbyValue;
  final bool? followemail;
  final dynamic shippingmethodcode;
  final dynamic address1Freighttermscode;
  final String? createdbyValue;
  final String? address1City;
  final dynamic territorycode;
  final String? msdynServiceterritoryValue;
  final dynamic ownershipcode;
  final String? fax;
  final bool? msdynTaxexempt;
  final bool? participatesinworkflow;
  final dynamic accountclassificationcode;
  final String? owningbusinessunitValue;
  final String? address2Addressid;
  final String? address1Postalcode;
  final String? defaultpricelevelidValue;
  final String? entityimageurl;

  factory AccountData.fromJson(String str) =>
      AccountData.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

  factory AccountData.fromMap(Map<String, dynamic> json) => AccountData(
        customertypecode: json["customertypecode"],
        address1Latitude: json["address1_latitude"],
        merged: json["merged"],
        accountnumber: json["accountnumber"],
        statecode: json["statecode"],
        emailaddress1: json["emailaddress1"],
        exchangerate: json["exchangerate"],
        openrevenueState: json["openrevenue_state"],
        name: json["name"],
        opendeals: json["opendeals"],
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
        address2Addresstypecode: json["address2_addresstypecode"],
        owninguserValue: json["_owninguser_value"],
        importsequencenumber: json["importsequencenumber"],
        address1Composite: json["address1_composite"],
        address1Longitude: json["address1_longitude"],
        donotpostalmail: json["donotpostalmail"],
        accountratingcode: json["accountratingcode"],
        marketingonly: json["marketingonly"],
        donotphone: json["donotphone"],
        preferredcontactmethodcode: json["preferredcontactmethodcode"],
        owneridValue: json["_ownerid_value"],
        customersizecode: json["customersizecode"],
        openrevenueDate: json["openrevenue_date"] == null
            ? null
            : DateTime.parse(json["openrevenue_date"]),
        openrevenueBase: json["openrevenue_base"],
        businesstypecode: json["businesstypecode"],
        donotemail: json["donotemail"],
        address2Shippingmethodcode: json["address2_shippingmethodcode"],
        address1Addressid: json["address1_addressid"],
        msdynGdproptout: json["msdyn_gdproptout"],
        address2Freighttermscode: json["address2_freighttermscode"],
        statuscode: json["statuscode"],
        createdon: json["createdon"] == null
            ? null
            : DateTime.parse(json["createdon"]),
        msdynTravelchargetype: json["msdyn_travelchargetype"],
        opendealsState: json["opendeals_state"],
        address1Stateorprovince: json["address1_stateorprovince"],
        openrevenue: json["openrevenue"],
        donotsendmm: json["donotsendmm"],
        donotfax: json["donotfax"],
        donotbulkpostalmail: json["donotbulkpostalmail"],
        address1Country: json["address1_country"],
        versionnumber: json["versionnumber"],
        address1Line1: json["address1_line1"],
        creditonhold: json["creditonhold"],
        telephone1: json["telephone1"],
        transactioncurrencyidValue: json["_transactioncurrencyid_value"],
        accountid: json["accountid"],
        donotbulkemail: json["donotbulkemail"],
        modifiedbyValue: json["_modifiedby_value"],
        followemail: json["followemail"],
        shippingmethodcode: json["shippingmethodcode"],
        address1Freighttermscode: json["address1_freighttermscode"],
        createdbyValue: json["_createdby_value"],
        address1City: json["address1_city"],
        territorycode: json["territorycode"],
        msdynServiceterritoryValue: json["_msdyn_serviceterritory_value"],
        ownershipcode: json["ownershipcode"],
        fax: json["fax"],
        msdynTaxexempt: json["msdyn_taxexempt"],
        participatesinworkflow: json["participatesinworkflow"],
        accountclassificationcode: json["accountclassificationcode"],
        owningbusinessunitValue: json["_owningbusinessunit_value"],
        address2Addressid: json["address2_addressid"],
        address1Postalcode: json["address1_postalcode"],
        defaultpricelevelidValue: json["_defaultpricelevelid_value"],
        entityimageurl: json["entityimage_url"],
      );

  Map<String, dynamic> toMap() => {
        "customertypecode": customertypecode,
        "address1_latitude": address1Latitude,
        "merged": merged,
        "accountnumber": accountnumber,
        "statecode": statecode,
        "emailaddress1": emailaddress1,
        "exchangerate": exchangerate,
        "openrevenue_state": openrevenueState,
        "name": name,
        "opendeals": opendeals,
        "modifiedon": modifiedon,
        "address2_addresstypecode": address2Addresstypecode,
        "_owninguser_value": owninguserValue,
        "importsequencenumber": importsequencenumber,
        "address1_composite": address1Composite,
        "address1_longitude": address1Longitude,
        "donotpostalmail": donotpostalmail,
        "accountratingcode": accountratingcode,
        "marketingonly": marketingonly,
        "donotphone": donotphone,
        "preferredcontactmethodcode": preferredcontactmethodcode,
        "_ownerid_value": owneridValue,
        "customersizecode": customersizecode,
        "openrevenue_date": openrevenueDate,
        "openrevenue_base": openrevenueBase,
        "businesstypecode": businesstypecode,
        "donotemail": donotemail,
        "address2_shippingmethodcode": address2Shippingmethodcode,
        "address1_addressid": address1Addressid,
        "msdyn_gdproptout": msdynGdproptout,
        "address2_freighttermscode": address2Freighttermscode,
        "statuscode": statuscode,
        "createdon": createdon,
        "msdyn_travelchargetype": msdynTravelchargetype,
        "opendeals_state": opendealsState,
        "address1_stateorprovince": address1Stateorprovince,
        "openrevenue": openrevenue,
        "donotsendmm": donotsendmm,
        "donotfax": donotfax,
        "donotbulkpostalmail": donotbulkpostalmail,
        "address1_country": address1Country,
        "versionnumber": versionnumber,
        "address1_line1": address1Line1,
        "creditonhold": creditonhold,
        "telephone1": telephone1,
        "_transactioncurrencyid_value": transactioncurrencyidValue,
        "accountid": accountid,
        "donotbulkemail": donotbulkemail,
        "_modifiedby_value": modifiedbyValue,
        "followemail": followemail,
        "shippingmethodcode": shippingmethodcode,
        "address1_freighttermscode": address1Freighttermscode,
        "_createdby_value": createdbyValue,
        "address1_city": address1City,
        "territorycode": territorycode,
        "_msdyn_serviceterritory_value": msdynServiceterritoryValue,
        "ownershipcode": ownershipcode,
        "fax": fax,
        "msdyn_taxexempt": msdynTaxexempt,
        "participatesinworkflow": participatesinworkflow,
        "accountclassificationcode": accountclassificationcode,
        "_owningbusinessunit_value": owningbusinessunitValue,
        "address2_addressid": address2Addressid,
        "address1_postalcode": address1Postalcode,
        "_defaultpricelevelid_value": defaultpricelevelidValue,
        "entityimage_url": entityimageurl,
      };
}
