class AddressModel {
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressCity;

  AddressModel({
    this.addressId,
    this.addressUsersid,
    this.addressName,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressCity,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id']?.toString();
    addressUsersid = json['address_usersid']?.toString();
    addressName = json['address_name']?.toString();
    addressStreet = json['address_street']?.toString();
    addressLat = json['address_lat']?.toString();
    addressLong = json['address_long']?.toString();
    addressCity = json['address_city']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_city'] = addressCity;
    return data;
  }
}
