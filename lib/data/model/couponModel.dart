class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponExpiredate;
  String? couponDiscount;

  CouponModel({
    this.couponId,
    this.couponName,
    this.couponCount,
    this.couponExpiredate,
    this.couponDiscount,
  });

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id']?.toString();
    couponName = json['coupon_name']?.toString();
    couponCount = json['coupon_count']?.toString();
    couponExpiredate = json['coupon_expiredate']?.toString();
    couponDiscount = json['coupon_discount']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_count'] = couponCount;
    data['coupon_expiredate'] = couponExpiredate;
    data['coupon_discount'] = couponDiscount;
    return data;
  }
}
