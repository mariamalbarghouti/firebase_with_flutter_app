import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail/app/core/domain/value_object/email.dart';
import 'package:trail/app/core/domain/value_object/password.dart';
import 'package:trail/app/modules/sign_in/domain/repository/sign_in_repository.dart';
import 'package:trail/app/routes/app_pages.dart';
import 'package:trail/core/services/get_signed_in_user_service.dart';

// Sign In Controller
class SignInController extends GetxController {
  SignInController({
    required this.iSignInRepoitory,
    required this.getSignedInUserService,
  });
  final ISignInRepoitory iSignInRepoitory;
  final SignedInUserService getSignedInUserService;
  // Email Controller
  late Rx<TextEditingController> emailEditionController;
  // Password Controller
  late Rx<TextEditingController> passwordEditionController;
  // Form Key
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailEditionController = TextEditingController().obs;
    passwordEditionController = TextEditingController().obs;
    super.onInit();
  }

  @override
  void onClose() {
    emailEditionController.value.dispose();
    passwordEditionController.value.dispose();
  }

  // Email Validation
  String? emailValidation() =>
      Email(email: emailEditionController.value.text).value.fold(
            (l) => l.msg,
            (r) => null,
          );

  // Password Validation
  String? passwordValidation() =>
      Password(password: passwordEditionController.value.text).value.fold(
            (l) => l.msg,
            (r) => null,
          );

  // sign In
  Future<void> signIn() async {
    if (signInKey.currentState?.validate() ?? false) {
      await iSignInRepoitory
          .signInWithEnailAndPassword(
            email: Email(
              email: emailEditionController.value.text, //"mariam@gmail.com",
            ),
            password: Password(
              password: passwordEditionController.value.text, //"123456",
            ),
          )
          .then(
            (value) => value.fold(
              (l) {
                emailEditionController.value.clear();
                passwordEditionController.value.clear();
                return Get.snackbar(
                  "Sign In",
                  l.msg,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              (r) {
                //  cache the user isSigned In
                getSignedInUserService.isUserOut(isUserOut: false);
                return Get.offAllNamed(Routes.HOME);
              },
            ),
          );
    }
  }
}
