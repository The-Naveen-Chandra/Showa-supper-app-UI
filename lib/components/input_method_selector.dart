import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/utils.dart';
import 'package:showa_supper_app/components/custom_app_bar.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class InputMethodSelector extends StatefulWidget {
  final String initialSelectedMethod;

  final ValueChanged<String> onSelectedMethod;
  const InputMethodSelector({
    super.key,
    required this.onSelectedMethod,
    required this.initialSelectedMethod,
  });

  @override
  State<InputMethodSelector> createState() => _InputMethodSelectorState();
}

class _InputMethodSelectorState extends State<InputMethodSelector> {
  String? _selectedMethod;

  @override
  void initState() {
    super.initState();
    _selectedMethod = widget.initialSelectedMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: "Choose input method",
        subtitle: "All the available input methods are listed",
        leadingIcon: Icons.close_sharp,
        isActionVisible: false,
        onActionTap: () {},
      ),
      body: ListView.builder(
        itemCount: inputMethod.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    inputMethod[index],
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.small,
                      fontWeight: ConstantFontWeight.normal,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                ),
                trailing: _selectedMethod == inputMethod[index]
                    ? const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.check, color: Colors.green),
                      )
                    : null,
                onTap: () {
                  setState(() {
                    _selectedMethod = inputMethod[index];
                  });
                  widget.onSelectedMethod(inputMethod[index]);
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
