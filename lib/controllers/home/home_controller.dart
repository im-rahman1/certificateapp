import 'package:certificateapp/globals/enum.dart';
import 'package:certificateapp/globals/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeController extends GetxController {
  bool hidePassword = true;
  final pdf = pw.Document();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();
  String loading = "";

  TextEditingController certificateIdController = TextEditingController();
  TextEditingController locationDetailsController = TextEditingController();
  TextEditingController contactDetailsController = TextEditingController();
  TextEditingController nameOfWorkerController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController phoneEmailController = TextEditingController();
  TextEditingController nameOfSupervisorController = TextEditingController();
  TextEditingController descriptionOfWorkController = TextEditingController();

  FocusNode certificateIdFocusNode = FocusNode();
  FocusNode locationDetailsFocusNode = FocusNode();
  FocusNode contactDetailsFocusNode = FocusNode();
  FocusNode nameOfWorkerFocusNode = FocusNode();
  FocusNode licenseNumberFocusNode = FocusNode();
  FocusNode companyNameFocusNode = FocusNode();
  FocusNode phoneEmailFocusNode = FocusNode();
  FocusNode nameOfSupervisorFocusNode = FocusNode();
  FocusNode descriptionOfWorkFocusNode = FocusNode();

  Map<String, bool> typeOfWork = {
    'addition': false,
    'alterations': false,
    'newWork': false
  };

  Map<String, bool> prescribedWork = {
    'lowRisk': false,
    'general': false,
    'highRisk': false
  };
  TextEditingController prescribedWorkSpecifyController =
      TextEditingController();
  FocusNode prescribedWorkSpecifyFocusNode = FocusNode();

  Map<String, bool> referenceStandards = {
    'part1': false,
    'part2': false,
  };
  TextEditingController referenceStandardsController = TextEditingController();
  FocusNode referenceStandardsFocusNode = FocusNode();

  Map<String, bool> selectApply = {
    'installedWithSpecifiedCertifiedDesign': false,
    'earthingSystemIsCorrectlyRated': false,
    'containsFittings': false,
    'reliesOnSupplierDeclaration': false,
    'reliesOnManufacturerInstructions': false,
    'satisfactorilyTested': false,
    'safeToConnect': false,
  };
  TextEditingController electronicReferenceController = TextEditingController();
  FocusNode electronicReferenceFocusNode = FocusNode();

  Future<bool> initvalidation() async {
    if (!Global.checkNull(emailController.text.toString().trim())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg: 'Please enter email',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(emailNode);
      return false;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text.toString().trim())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg: 'Please enter a valid email',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(emailNode);
      return false;
    }
    if (!(passwordController.text.length > 7)) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'Password must be at least 8 characters long',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(passNode);
      return false;
    }
    // if (await Database.isUserExist(emailController.text.toString().trim())) {
    //   EasyLoading.dismiss();
    //   Global.showToastAlert(
    //       context: Get.overlayContext!,
    //       strTitle: "ok",
    //       strMsg: 'An account with this email already exists.',
    //       toastType: TOAST_TYPE.toastError);
    //   return false;
    // }
    return true;
  }

  // Future<void> createPDF() async {
  //   final pdf = pw.Document();

  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Center(
  //         child: pw.Text('Hello World!'),
  //       ),
  //     ),
  //   );

  //   // final file = File('example.pdf');
  //   // await file.writeAsBytes(await pdf.save());
  // }

  Future<void> submitForm() async {
    if (await (initvalidation())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'Validation error',
          toastType: TOAST_TYPE.toastError);
    }
  }
}
