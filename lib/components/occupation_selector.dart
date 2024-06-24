import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/utils.dart';
import 'package:showa_supper_app/components/custom_app_bar.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class OccupationSelector extends StatefulWidget {
  final String initialOccupation;
  final ValueChanged<String> onSelectedOccupation;

  const OccupationSelector({
    super.key,
    required this.initialOccupation,
    required this.onSelectedOccupation,
  });

  @override
  State<OccupationSelector> createState() => _OccupationSelectorState();
}

class _OccupationSelectorState extends State<OccupationSelector> {
  String? _selectedOccupation;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _selectedOccupation = widget.initialOccupation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: "Select your occupation",
        subtitle: "Select one from the list",
        leadingIcon: Icons.close_sharp,
        isActionVisible: false,
        onActionTap: () {},
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.small,
                  fontWeight: ConstantFontWeight.normal,
                  color: ConstantColors.secondaryTextColor,
                ),
                hintText: 'Search occupation',
                prefixIcon: const Icon(CupertinoIcons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: occupationSelector.length,
              itemBuilder: (context, index) {
                final occupation = occupationSelector[index];
                if (_searchText.isNotEmpty &&
                    !occupation
                        .toLowerCase()
                        .contains(_searchText.toLowerCase())) {
                  return Container();
                }
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          occupation,
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.small,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.primaryTextColor,
                          ),
                        ),
                      ),
                      trailing: _selectedOccupation == occupation
                          ? const Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Icon(Icons.check, color: Colors.green),
                            )
                          : null,
                      onTap: () {
                        setState(() {
                          _selectedOccupation = occupation;
                        });
                        widget.onSelectedOccupation(occupation);
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
          ),
        ],
      ),
    );
  }
}
