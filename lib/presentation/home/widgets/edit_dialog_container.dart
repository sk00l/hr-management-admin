import 'package:admin_pannel/presentation/common/app_button.dart';
import 'package:admin_pannel/presentation/common/app_text_form_field.dart';
import 'package:admin_pannel/presentation/home/bloc/user_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EditDialogContainer extends StatefulWidget {
  const EditDialogContainer({super.key});

  @override
  State<EditDialogContainer> createState() => _EditDialogContainerState();
}

class _EditDialogContainerState extends State<EditDialogContainer> {
  bool isAdmin = false;
  bool isActive = false;
  int _currentStep = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController cellController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController eNameController = TextEditingController();
  TextEditingController eRelationController = TextEditingController();
  TextEditingController eNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      width: 560,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentStep == 2)
                    AppButton(
                      title: "Submit",
                      borderColor: Colors.black,
                      textColorColor: Colors.black,
                      height: 32,
                      width: 68,
                      onTap: () {},
                    )
                  else
                    AppButton(
                      title: "Next",
                      borderColor: Colors.black,
                      textColorColor: Colors.black,
                      height: 32,
                      width: 68,
                      onTap: details.onStepContinue,
                    ),
                  // if (_currentStep == 2)
                  //   ElevatedButton(
                  //     onPressed: () {
                  //       context.read<UserDetailsBloc>().add(
                  //             AddUserEvent(
                  //               userModel: UserModel(
                  //                 uid: "",
                  //                 appliedDate: dateController.text,
                  //                 picture: '',
                  //                 viber: int.parse(cellController.text),
                  //                 whatsapp: int.parse(cellController.text),
                  //                 cell: int.parse(cellController.text),
                  //                 email: emailController.text,
                  //                 address: addressController.text,
                  //                 github: githubController.text,
                  //                 linkedIn: linkedinController.text,
                  //                 bio: bioController.text,
                  //                 eName: eNameController.text,
                  //                 eNumber: int.parse(eNumberController.text),
                  //                 eRelation: eRelationController.text,
                  //                 isActive: isActive,
                  //                 isAdmin: isAdmin,
                  //                 name: NameLocalisedFields(
                  //                   en: nameController.text,
                  //                   ne: '',
                  //                 ),
                  //                 position: NameLocalisedFields(
                  //                   en: positionController.text,
                  //                   ne: '',
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 24, vertical: 12),
                  //       textStyle: const TextStyle(fontSize: 16),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //     ),
                  //     child: const Text('Submit'),
                  //   )
                  // else
                  //   ElevatedButton(
                  //     onPressed: details.onStepContinue,
                  //     style: ElevatedButton.styleFrom(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 24, vertical: 12),
                  //       textStyle: const TextStyle(fontSize: 16),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //     ),
                  //     child: const Text('Next'),
                  //   ),
                  if (_currentStep > 0)
                    AppButton(
                      title: "Back",
                      borderColor: Colors.black,
                      textColorColor: Colors.black,
                      height: 32,
                      width: 68,
                      onTap: details.onStepCancel,
                    ),
                ],
              ),
            );
          },
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < getSteps().length - 1) {
              setState(() => _currentStep += 1);
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep -= 1);
            }
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: _currentStep >= 0,
          title: const Text("Basic Info"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                    width: 200,
                    child: AppTextFormField(
                      textEditingController: emailController,
                      helperText: "Enter Email",
                    ),
                  ),
                  const Gap(22),
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: AppTextFormField(
                      textEditingController: nameController,
                      helperText: "Full Name",
                      // title: "Full Name",
                    ),
                  ),
                  const Gap(22),
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: AppTextFormField(
                      textEditingController: positionController,
                      helperText: "Employee Position",
                      // title: "Posiion",
                    ),
                  ),
                  const Gap(22),
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: AppTextFormField(
                      textEditingController: cellController,
                      helperText: "Phone Number",
                      // title: "Phone Number",
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: AppTextFormField(
                      textEditingController: passwordController,
                      helperText: "Password",
                      // title: "Phone Number",
                    ),
                  ),
                  const Gap(22),
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: AppTextFormField(
                      isDateField: true,
                      textEditingController: dateController,
                      readOnly: true,
                      helperText: "Applied date",
                    ),
                  ),
                  const Gap(22),
                  InkWell(
                    onTap: () {
                      context.read<UserDetailsBloc>().add(PickImage());
                    },
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 48,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Step(
          isActive: _currentStep >= 1,
          title: const Text("More Details"),
          content: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 250,
                      child: AppTextFormField(
                        textEditingController: eNameController,
                        helperText: "Emergency Contact Name",
                      ),
                    ),
                    const Gap(22),
                    SizedBox(
                      width: 250,
                      height: 70,
                      child: AppTextFormField(
                        textEditingController: eRelationController,
                        helperText: "Emergency Contact Relation",
                        // title: "Full Name",
                      ),
                    ),
                    const Gap(22),
                    SizedBox(
                      width: 250,
                      height: 70,
                      child: AppTextFormField(
                        textEditingController: eNumberController,
                        helperText: "Emergency Contact Number",
                        // title: "Posiion",
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 70,
                      child: AppTextFormField(
                        textEditingController: addressController,
                        helperText: "Address",
                        // title: "Phone Number",
                      ),
                    ),
                    const Gap(22),
                    SizedBox(
                      width: 250,
                      height: 162,
                      child: AppTextFormField(
                        inputType: TextInputType.multiline,
                        maxLines: 10,
                        textEditingController: bioController,
                        helperText: "Bio",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Step(
          isActive: _currentStep >= 2,
          title: const Text("Finish"),
          content: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 250,
                      child: AppTextFormField(
                        textEditingController: githubController,
                        helperText: "Github Profile",
                      ),
                    ),
                    const Gap(12),
                    SizedBox(
                      width: 250,
                      height: 70,
                      child: AppTextFormField(
                        textEditingController: linkedinController,
                        helperText: "linkedIn Profile",
                        // title: "Phone Number",
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                const Divider(),
                Row(
                  children: [
                    Checkbox(
                      value: isAdmin,
                      onChanged: (value) async {
                        if (value == true) {
                          bool? confirm = await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Confirmation"),
                              content: const Text(
                                  "Are you sure you want to make this person an admin?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: const Text("No"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            setState(() {
                              isAdmin = true;
                            });
                          } else {
                            setState(() {
                              isAdmin = false;
                            });
                          }
                        } else {
                          setState(() {
                            isAdmin = false;
                          });
                        }
                      },
                    ),
                    const Text("Admin"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isActive,
                      onChanged: (value) {
                        setState(() {
                          isActive = value ?? false;
                        });
                      },
                    ),
                    const Text("Active"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ];
}
