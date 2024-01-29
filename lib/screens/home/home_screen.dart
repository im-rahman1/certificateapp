import 'package:certificateapp/controllers/home/home_controller.dart';
import 'package:certificateapp/globals/widgets/custom_appbar.dart';
import 'package:certificateapp/globals/widgets/custom_button.dart';
import 'package:certificateapp/globals/widgets/custom_checkbox.dart';
import 'package:certificateapp/globals/widgets/custom_text_fields.dart';
import 'package:certificateapp/utils/app_colors.dart';
import 'package:certificateapp/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: customAppBar(
            "Certificate",
            color: AppColors.primaryColor,
            leading: false,
            // action: ,
          ),
          backgroundColor: AppColors.colorWhite,
          body: SafeArea(child: GetBuilder<HomeController>(builder: (logic) {
            return Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Personal Details",
                          style: subHeadingText(),
                          textDirection: TextDirection.ltr),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Certificate Id",
                        controller.certificateIdController,
                        controller.certificateIdFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Location Details",
                        controller.locationDetailsController,
                        controller.locationDetailsFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Contact Details",
                        hint: 'Enter Phone and Address',
                        controller.contactDetailsController,
                        controller.contactDetailsFocusNode),
                    const SizedBox(
                        height: 20,
                        child: Divider(
                          height: 1,
                          color: AppColors.scaffoldBacground,
                        )),
                    customTextFiled(
                        label: "Worker Name",
                        hint: 'Enter Name of worker',
                        controller.nameOfWorkerController,
                        controller.nameOfWorkerFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "License no.",
                        hint: 'Enter license number of worker',
                        controller.licenseNumberController,
                        controller.licenseNumberFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Email / Phone",
                        hint: 'Enter email or phone no. of worker',
                        controller.phoneEmailController,
                        controller.phoneEmailFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Supervisor Name",
                        // hint: 'Enter email or phone no. of worker',
                        controller.nameOfSupervisorController,
                        controller.nameOfSupervisorFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("CoC",
                          style: subHeadingText(),
                          textDirection: TextDirection.ltr),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Type of work:"),
                    Row(
                      children: [
                        CustomCheckBox(
                            value: logic.typeOfWork['addition'] as bool,
                            onChange: (val) {
                              logic.typeOfWork['addition'] = val as bool;
                              logic.update();
                            },
                            label: "Additions"),
                        CustomCheckBox(
                            value: logic.typeOfWork['alterations'] as bool,
                            onChange: (val) {
                              logic.typeOfWork['alterations'] = val as bool;
                              logic.update();
                            },
                            label: "Alterations"),
                        CustomCheckBox(
                            value: logic.typeOfWork['newWork'] as bool,
                            onChange: (val) {
                              logic.typeOfWork['newWork'] = val as bool;
                              logic.update();
                            },
                            label: "New Work")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Prescribed electrical work:"),
                    Row(
                      children: [
                        CustomCheckBox(
                            value: logic.prescribedWork['lowRisk'] as bool,
                            onChange: (val) {
                              logic.prescribedWork['lowRisk'] = val as bool;
                              logic.update();
                            },
                            label: "Prescribed Work"),
                        CustomCheckBox(
                            value: logic.prescribedWork['general'] as bool,
                            onChange: (val) {
                              logic.prescribedWork['general'] = val as bool;
                              logic.update();
                            },
                            label: "General"),
                      ],
                    ),
                    CustomCheckBox(
                        value: logic.prescribedWork['highRisk'] as bool,
                        onChange: (val) {
                          logic.prescribedWork['highRisk'] = val as bool;
                          logic.update();
                        },
                        label: "High Risk"),
                    customTextFiled(
                        label: "Specify",
                        // hint: 'Enter email or phone no. of worker',
                        controller.prescribedWorkSpecifyController,
                        controller.prescribedWorkSpecifyFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Reference Standards:",
                    ),
                    Column(
                      children: [
                        CustomCheckBox(
                            value: logic.referenceStandards['part1'] as bool,
                            onChange: (val) {
                              logic.referenceStandards['part1'] = val as bool;
                              logic.update();
                            },
                            label: "Part 1 of AS/NZS 3000"),
                        CustomCheckBox(
                            value: logic.referenceStandards['part2'] as bool,
                            onChange: (val) {
                              logic.referenceStandards['part2'] = val as bool;
                              logic.update();
                            },
                            label: "Part 2 of AS/NZS 3000"),
                      ],
                    ),
                    customTextFiled(
                        label: "Additional Standards:",
                        // hint: 'Enter email or phone no. of worker',
                        controller.referenceStandardsController,
                        controller.referenceStandardsFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Description of Work:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiledMultiLine(
                        hint:
                            "Enter Description of Work (including date/s of work and type of supply system)",
                        lines: 3,
                        controller.descriptionOfWorkController,
                        controller.descriptionOfWorkFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Select those that apply:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        CustomCheckBox(
                            value: logic.selectApply[
                                    'installedWithSpecifiedCertifiedDesign']
                                as bool,
                            onChange: (val) {
                              logic.selectApply[
                                      'installedWithSpecifiedCertifiedDesign'] =
                                  val as bool;
                              logic.update();
                            },
                            label:
                                "Has been installed in accordance with the specified certified design"),
                        CustomCheckBox(
                            value: logic.selectApply[
                                'earthingSystemIsCorrectlyRated'] as bool,
                            onChange: (val) {
                              logic.selectApply[
                                      'earthingSystemIsCorrectlyRated'] =
                                  val as bool;
                              logic.update();
                            },
                            label:
                                "Has an earthing system that is correctly rated (where applicable)"),
                        CustomCheckBox(
                            value:
                                logic.selectApply['containsFittings'] as bool,
                            onChange: (val) {
                              logic.selectApply['containsFittings'] =
                                  val as bool;
                              logic.update();
                            },
                            label:
                                "Contains fittings that are safe to connect to a power supply"),
                        CustomCheckBox(
                            value:
                                logic.selectApply['reliesOnSupplierDeclaration']
                                    as bool,
                            onChange: (val) {
                              logic.selectApply['reliesOnSupplierDeclaration'] =
                                  val as bool;
                              logic.update();
                            },
                            label:
                                "Relies on a supplier Declaration of Conformity"),
                        CustomCheckBox(
                            value: logic.selectApply[
                                'reliesOnManufacturerInstructions'] as bool,
                            onChange: (val) {
                              logic.selectApply[
                                      'reliesOnManufacturerInstructions'] =
                                  val as bool;
                              logic.update();
                            },
                            label: "Relies on a manufacturer's instructions"),
                        CustomCheckBox(
                            value: logic.selectApply['satisfactorilyTested']
                                as bool,
                            onChange: (val) {
                              logic.selectApply['satisfactorilyTested'] =
                                  val as bool;
                              logic.update();
                            },
                            label:
                                "Has been satisfactorily tested in accordance with the Electricity (Safety) Regulations 2010"),
                        CustomCheckBox(
                            value: logic.selectApply['safeToConnect'] as bool,
                            onChange: (val) {
                              logic.selectApply['safeToConnect'] = val as bool;
                              logic.update();
                            },
                            label: "Is safe to connect"),
                      ],
                    ),
                    customTextFiled(
                        label: "Electronic/Other reference:",
                        // hint: 'Enter email or phone no. of worker',
                        controller.electronicReferenceController,
                        controller.electronicReferenceFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Certifier's signature:",
                        // hint: 'Enter email or phone no. of worker',
                        controller.referenceStandardsController,
                        controller.referenceStandardsFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Test Results:",
                    ),
                    Column(
                      children: [
                        CustomCheckBox(
                            value: logic.referenceStandards['part1'] as bool,
                            onChange: (val) {
                              logic.referenceStandards['part1'] = val as bool;
                              logic.update();
                            },
                            label: "Part 1 of AS/NZS 3000"),
                        CustomCheckBox(
                            value: logic.referenceStandards['part2'] as bool,
                            onChange: (val) {
                              logic.referenceStandards['part2'] = val as bool;
                              logic.update();
                            },
                            label: "Part 2 of AS/NZS 3000"),
                        CustomButton(
                            label: "Export PDF",
                            onPress: () {
                              // logic.createPDF();
                            })
                      ],
                    ),
                  ],
                ));
          })),
        ));
  }
}
