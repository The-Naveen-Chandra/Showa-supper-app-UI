import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:showa_supper_app/components/custom_app_bar.dart';
import 'package:showa_supper_app/components/gender_selector.dart';
import 'package:showa_supper_app/components/input_method_selector.dart';
import 'package:showa_supper_app/components/occupation_selector.dart';
import 'package:showa_supper_app/components/primary_textfield.dart';
import 'package:showa_supper_app/components/selector_textfield.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/screens/profile_image_screen.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final TextEditingController _firstNameAlphabetController =
      TextEditingController();
  final TextEditingController _lastNameAlphabetController =
      TextEditingController();
  final TextEditingController _firstNameKatakanaController =
      TextEditingController();
  final TextEditingController _lastNameKatakanaController =
      TextEditingController();

  String inputMethod = "";
  String gender = "";
  String occupation = "";
  String dateOfBirth = "";

  bool isActionDisabled = true;

  @override
  void initState() {
    super.initState();
    _firstNameAlphabetController.addListener(_validateForm);
    _lastNameAlphabetController.addListener(_validateForm);
    _firstNameKatakanaController.addListener(_validateForm);
    _lastNameKatakanaController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _firstNameAlphabetController.removeListener(_validateForm);
    _lastNameAlphabetController.removeListener(_validateForm);
    _firstNameKatakanaController.removeListener(_validateForm);
    _lastNameKatakanaController.removeListener(_validateForm);
    _firstNameAlphabetController.dispose();
    _lastNameAlphabetController.dispose();
    _firstNameKatakanaController.dispose();
    _lastNameKatakanaController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      isActionDisabled = _firstNameAlphabetController.text.isEmpty ||
          _lastNameAlphabetController.text.isEmpty ||
          _firstNameKatakanaController.text.isEmpty ||
          _lastNameKatakanaController.text.isEmpty ||
          inputMethod.isEmpty ||
          gender.isEmpty ||
          occupation.isEmpty ||
          dateOfBirth.isEmpty;
    });
  }

  void _selectInputMethod() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputMethodSelector(
          onSelectedMethod: (selectedMethod) {
            setState(() {
              inputMethod = selectedMethod;
            });
            _validateForm();
          },
          initialSelectedMethod: inputMethod,
        ),
      ),
    );
  }

  void _selectGender() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GenderSelector(
          onSelectedGender: (selectedGender) {
            setState(() {
              gender = selectedGender;
            });
            _validateForm();
          },
          initialGender: gender,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dateOfBirth = DateFormat('dd-MM-yyyy').format(picked);
      });
      _validateForm();
    }
  }

  void _selectOccupation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OccupationSelector(
          onSelectedOccupation: (selectedOccupation) {
            setState(() {
              occupation = selectedOccupation;
            });
            _validateForm();
          },
          initialOccupation: occupation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: "Your personal information",
        leadingIcon: Icons.arrow_back_ios,
        isActionVisible: true,
        isActionDisabled: isActionDisabled,
        onActionTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileImageScreen(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please user you most recent information.\nEnter the same name, date of birth, and address as\nthe one son your ID",
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.extraSmall,
                  fontWeight: ConstantFontWeight.normal,
                  color: ConstantColors.secondaryTextColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Personal information",
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.extraSmall,
                  fontWeight: ConstantFontWeight.semiBold,
                  color: ConstantColors.primaryTextColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SelectorTextField(
                title: "Input method",
                hintText: "Select input method",
                inputText: inputMethod,
                onTap: _selectInputMethod,
              ),
              PrimaryTextfield(
                text: "First name (Alphabet)",
                hintText: "Your first name",
                controller: _firstNameAlphabetController,
              ),
              PrimaryTextfield(
                text: "Last name (Alphabet)",
                hintText: "Your last name",
                controller: _lastNameAlphabetController,
              ),
              PrimaryTextfield(
                text: "First name (Katakana)",
                hintText: "チャンドラ",
                controller: _firstNameKatakanaController,
              ),
              PrimaryTextfield(
                text: "Last name (Katakana)",
                hintText: "ハリ",
                controller: _lastNameKatakanaController,
              ),
              SelectorTextField(
                title: "Date of birth",
                hintText: "Select date of birth",
                inputText: dateOfBirth,
                onTap: () {
                  _selectDate(context);
                },
              ),
              SelectorTextField(
                title: "Gender",
                hintText: "Select your gender",
                inputText: gender,
                onTap: _selectGender,
              ),
              SelectorTextField(
                title: "Occupation",
                hintText: "Select your occupation",
                inputText: occupation,
                onTap: _selectOccupation,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
