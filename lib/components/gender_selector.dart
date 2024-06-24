import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/utils.dart';
import 'package:showa_supper_app/components/custom_app_bar.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class GenderSelector extends StatefulWidget {
  final ValueChanged<String> onSelectedGender;
  final String initialGender;

  const GenderSelector({
    super.key,
    required this.initialGender,
    required this.onSelectedGender,
  });

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: "Select your gender",
        subtitle: "Select one from the list",
        leadingIcon: Icons.close_sharp,
        isActionVisible: false,
        onActionTap: () {},
      ),
      body: ListView.builder(
        itemCount: genderSelector.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    genderSelector[index],
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.small,
                      fontWeight: ConstantFontWeight.normal,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                ),
                trailing: _selectedGender == genderSelector[index]
                    ? const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.check, color: Colors.green),
                      )
                    : null,
                onTap: () {
                  setState(() {
                    _selectedGender = genderSelector[index];
                  });
                  widget.onSelectedGender(genderSelector[index]);
                  Navigator.pop(context);
                },
              ),
              Divider(
                thickness: 2,
                color: ConstantColors.borderColor,
                indent: 0,
                endIndent: 0,
              ),
            ],
          );
        },
      ),
    );
  }
}
