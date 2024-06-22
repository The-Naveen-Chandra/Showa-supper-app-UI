import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/utils.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class CountrySelector extends StatefulWidget {
  final ValueChanged<CountryCode> onCountrySelected;
  final CountryCode initialSelectedCountry;

  const CountrySelector({
    super.key,
    required this.onCountrySelected,
    required this.initialSelectedCountry,
  });

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  String _searchText = '';
  late CountryCode? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = widget.initialSelectedCountry;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.small,
                      fontWeight: ConstantFontWeight.normal,
                      color: ConstantColors.secondaryTextColor,
                    ),
                    hintText: 'Search country',
                    prefixIcon: const Icon(Icons.search),
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
                  itemCount: countryCodes.length,
                  itemBuilder: (context, index) {
                    final country = countryCodes[index];
                    if (_searchText.isNotEmpty &&
                        !country.name
                            .toLowerCase()
                            .contains(_searchText.toLowerCase())) {
                      return Container();
                    }
                    return ListTile(
                      leading: Image.asset(country.flagSrc, width: 32),
                      title: Text(
                        country.name,
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.small,
                          fontWeight: ConstantFontWeight.semiBold,
                          color: ConstantColors.primaryTextColor,
                        ),
                      ),
                      subtitle: Text(
                        ("(${country.code})"),
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.extraSmall,
                          fontWeight: ConstantFontWeight.normal,
                          color: ConstantColors.secondaryTextColor,
                        ),
                      ),
                      trailing: _selectedCountry == country
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : null,
                      onTap: () {
                        setState(() {
                          _selectedCountry = country;
                        });
                        widget.onCountrySelected(country);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
