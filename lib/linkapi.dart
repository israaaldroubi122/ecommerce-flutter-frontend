class AppLink {
  static const String server = "http://192.168.1.8/eccommersapp";
  //
  static const String test = "$server/test.php";
/////img
  static const String images = "C:/Users/User/Desktop";
  static const String imagescategories = "$images/imagescategories";
  ////outh//////////////////////////////
  static const String singUp = "$server/outh/singup.php";
  static const String verfiyCodeSingUp = "$server/outh/verfiyCode.php";
  static const String logIn = "$server/outh/logIn.php";

  ///forgetpassword
  static const String checkEmail = "$server/forgetpassword/checkEmail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verfiycodeforgetpassword =
      "$server/forgetpassword/verfiycode.php";

  /////Home
  static const String homePage = "$server/home.php";
  static const String items = "$server/items/items.php";

  ///favorite
  static const String add = "$server/favorite/add.php";
  static const String remove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletFromFavorite =
      "$server/favorite/deletefromFavorite.php.php";
  ////CARt
  static const String cartAdd = "$server/cart/add.php";
  static const String cartremove = "$server/cart/remove.php";
  static const String cartview = "$server/cart/view.php";
  static const String getcountitems = "$server/cart/getcountitems.php";
  //////search
  static const String searchItems = "$server/items/search.php";
  ////address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String adressDelete = "$server/address/delete.php";

  ///coupon
  static const String checkCoupon = "$server/coupon/checkCoupon.php";

  ///orders
  static const String checkOrder = "$server/orders/checkOut.php";
  static const String pendingOrder = "$server/orders/pending.php";

  static const String archiveOrder = "$server/orders/archive.php";

  static const String orderDetails = "$server/orders/details.php";
  static const String ordersDelete = "$server/orders/delete.php";
  //offers

  static const String offers = "$server/offers.php";
}
