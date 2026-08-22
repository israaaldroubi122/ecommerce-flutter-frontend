class MyfavoeiteModel {
  String? favoritId;
  String? favoritUsersid;
  String? favoritItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemaDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? usersId;

  MyfavoeiteModel(
      {this.favoritId,
      this.favoritUsersid,
      this.favoritItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemaDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.usersId});

  MyfavoeiteModel.fromJson(Map<String, dynamic> json) {
    favoritId = json['favorit_id'];
    favoritUsersid = json['favorit_usersid'];
    favoritItemsid = json['favorit_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemaDesc = json['itema_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorit_id'] = this.favoritId;
    data['favorit_usersid'] = this.favoritUsersid;
    data['favorit_itemsid'] = this.favoritItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['itema_desc'] = this.itemaDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['users_id'] = this.usersId;
    return data;
  }
}
