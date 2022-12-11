import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  String userUid = '';
  var verId = '';
  int? resendTokenId;
  bool phoneAuthCheck = false;
  dynamic credentials;

  phoneAuth(String phone) async {
    try {
      credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          log('Completed');
          credentials = credential;
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        forceResendingToken: resendTokenId,
        verificationFailed: (FirebaseAuthException e) {
          log('Failed');
          if (e.code == 'invalid-phone-number') {
            debugPrint('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          log('Code sent');
          verId = verificationId;
          resendTokenId = resendToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log("Error occured $e");
    }
  }

  verifyOtp(String otpNumber) async {
    log("Called");
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: otpNumber);

    log("LogedIn");

    await FirebaseAuth.instance.signInWithCredential(credential);

    // await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
    //   decideRoute();
    // }).catchError((e) {
    //   print("Error while sign In $e");
    // });
  }

  // var isDecided = false;

  // decideRoute() {
  //   if (isDecided) {
  //     return;
  //   }
  //   isDecided = true;
  //   print("called");

  //   ///step 1- Check user login?
  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (user != null) {
  //     /// step 2- Check whether user profile exists?
  //     ///isLoginAsDriver == true means navigate it to the driver module
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .get()
  //         .then((value) {

  //       ///isLoginAsDriver == true means navigate it to driver module
  //       if(isLoginAsDriver){

  //         if (value.exists) {
  //           print("Driver HOme Screen");
  //         } else {
  //           Get.offAll(() => DriverProfileSetup());
  //         }

  //       }else{
  //         if (value.exists) {
  //           Get.offAll(() => HomeScreen());
  //         } else {
  //           Get.offAll(() => ProfileSettingScreen());
  //         }
  //       }

  //     }).catchError((e) {
  //       print("Error while decideRoute is $e");
  //     });
  //   }
  // }

}
