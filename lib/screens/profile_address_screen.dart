import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/custom_app_bar.dart';
import 'package:showa_supper_app/components/postal_code_textfield.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/screens/address_field.dart';
import 'package:showa_supper_app/screens/profile_setup_screen.dart';

class ProfileAddressScreen extends StatefulWidget {
  const ProfileAddressScreen({super.key});

  @override
  State<ProfileAddressScreen> createState() => _ProfileAddressScreenState();
}

class _ProfileAddressScreenState extends State<ProfileAddressScreen> {
  final TextEditingController _postalCodeController = TextEditingController();
  bool _isPostalCodeEmpty = true;

  @override
  void initState() {
    super.initState();
    _postalCodeController.addListener(_onPostalCodeChanged);
  }

  @override
  void dispose() {
    _postalCodeController.removeListener(_onPostalCodeChanged);
    _postalCodeController.dispose();
    super.dispose();
  }

  void _onPostalCodeChanged() {
    setState(() {
      _isPostalCodeEmpty = _postalCodeController.text.isEmpty;
    });
  }

  void _onActionTap() {
    FocusScope.of(context).unfocus(); // Dismiss the keyboard
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileSetupScreen(
            isPersonalInfoCompleted: true,
            isAddressCompleted: true,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: "Address",
        leadingIcon: Icons.arrow_back_ios,
        isActionVisible: true,
        isActionDisabled: _isPostalCodeEmpty,
        onActionTap: _onActionTap,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              Text(
                "Address",
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.extraSmall,
                  fontWeight: ConstantFontWeight.normal,
                  color: ConstantColors.primaryTextColor,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Select “Search” after entering your postal code, then select your city and address",
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.extraSmall,
                  fontWeight: ConstantFontWeight.normal,
                  color: ConstantColors.primaryTextColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PostalCodeTextfield(
                title: "Postal Code",
                hintText: "Post code",
                controller: _postalCodeController,
                disabled: _isPostalCodeEmpty,
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomAddressField(
                titleText: "Prefecture",
                inputText: "OSAKA - 大阪府",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomAddressField(
                titleText: "City and address",
                inputText: "Hakonora - 箱の浦, Hannanshi - 阪南市",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomAddressField(
                titleText:
                    "Street address (Excluding building name and room number)",
                inputText: "208-1294, Kamishingashi",
              ),
              Divider(
                color: ConstantColors.borderColor,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomAddressField(
                titleText: "Building name and room number",
                inputText: "Kamgashi, #879",
              ),
              Divider(
                color: ConstantColors.borderColor,
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
