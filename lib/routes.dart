import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/localization/language.dart';
import 'package:ecommerceapp21/core/middelewere/myMelelWare.dart';
import 'package:ecommerceapp21/view/address/addadress/add.dart';
import 'package:ecommerceapp21/view/address/addparttowaddress/addDetailseaddress.dart';
import 'package:ecommerceapp21/view/address/view/view.dart';
import 'package:ecommerceapp21/view/screen/outh/Setting/setting.dart';
import 'package:ecommerceapp21/view/screen/homeScreen/homescreen.dart';
import 'package:ecommerceapp21/view/screen/onboarding/onboardingScreen.dart';
import 'package:ecommerceapp21/view/screen/outh/Favorite/myFavorite.dart';
import 'package:ecommerceapp21/view/screen/outh/LOGIN/login.dart';
import 'package:ecommerceapp21/view/screen/outh/SINGUP/singup.dart';
import 'package:ecommerceapp21/view/screen/outh/cart/cart.dart';
import 'package:ecommerceapp21/view/screen/outh/checkout/checlout.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/ForgetPassword/forgetPassword.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/SuccessResetPussword/successResetPassword.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/SuccessSingUP/success_SingUp.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/resetPassword/resetPassword.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/verfiyCode/verFiyCode.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/verfiyCode/verfiyCodeSingUp/verfiyCodeSingUp.dart';
import 'package:ecommerceapp21/view/screen/outh/items/items.dart';
import 'package:ecommerceapp21/view/screen/outh/orders/archiveOrder/archiveOrderscreen.dart';
import 'package:ecommerceapp21/view/screen/outh/orders/ordersDetails/ordersdetails.dart';
import 'package:ecommerceapp21/view/screen/outh/orders/pandingorder/pandingOrder.dart';
import 'package:ecommerceapp21/view/screen/outh/productdetails/productdetails.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
//  GetPage(name: "/", page: () => Onboarding()),
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddelWare()]),
  GetPage(name: AppRoutes.onBoarding, page: () => const Onboarding()),
  GetPage(name: AppRoutes.login, page: () => const LogIn()),
  GetPage(name: AppRoutes.sinUp, page: () => const SingUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),

  GetPage(name: AppRoutes.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoutes.resetpassword, page: () => const ResetPassWord()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSingUp, page: () => const SuccessSingUp()),
  GetPage(
      name: AppRoutes.verfiyCodeSingUp, page: () => const VerfiyCodeSingUp()),
  ////////
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.productdetails, page: () => const Productdetails()),
  GetPage(name: AppRoutes.myfavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoutes.setting, page: () => const Setting()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  GetPage(name: AppRoutes.addressView, page: () => const AddressView()),
  GetPage(name: AppRoutes.addressAdd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoutes.addpartTowAddress,
      page: () => const AddDetailseAddress()),
  GetPage(name: AppRoutes.checkout, page: () => const CheckOut()),
  GetPage(name: AppRoutes.pendingOrder, page: () => const PendingOrder()),
  GetPage(name: AppRoutes.archiveOrder, page: () => const ArchiveOrder()),
  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails()),
//  GetPage(name: AppRoutes.offers, page: () => const Offers()),
];
