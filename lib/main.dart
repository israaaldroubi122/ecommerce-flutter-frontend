import 'package:ecommerceapp21/bindings/initilbindings.dart';
import 'package:ecommerceapp21/core/localization/changLocal_controller.dart';
import 'package:ecommerceapp21/core/localization/translation.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 740),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          ChangLocalControllerImp controller =
              Get.put(ChangLocalControllerImp());
          return GetMaterialApp(
            translations: MyTranslation(),
            locale: controller.language,
            debugShowCheckedModeBanner: false,
            initialBinding: InitialBindings(),
            //  home: const Language(),
            //  routes: routes,
            getPages: routes,
          );
        });
  }
}
