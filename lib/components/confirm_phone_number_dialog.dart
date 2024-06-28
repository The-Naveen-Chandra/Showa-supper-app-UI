import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class ConfirmPhoneNumberDialog extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;

  const ConfirmPhoneNumberDialog({
    super.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  @override
  State<ConfirmPhoneNumberDialog> createState() =>
      _ConfirmPhoneNumberDialogState();
}

class _ConfirmPhoneNumberDialogState extends State<ConfirmPhoneNumberDialog> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late Timer _timer;
  int _remainingTime = 60;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (index) => TextEditingController());
    _focusNodes = List.generate(4, (index) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        setState(() {
          _isButtonEnabled = true;
          _timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1) {
      if (index < _focusNodes.length - 1) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  Widget _buildCodeTextField(int index) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(
            color: ConstantColors.borderColor,
            width: 2.0,
          ),
          shape: BoxShape.circle),
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: ConstantFontSize.extraLarge,
          fontWeight: ConstantFontWeight.bold,
          color: ConstantColors.primaryTextColor,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) => _onChanged(index, value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: ConstantColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Confirm Phone',
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraLarge,
                      fontWeight: ConstantFontWeight.bold,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Please verify your phone',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraSmall,
                      fontWeight: ConstantFontWeight.normal,
                      color: ConstantColors.secondaryTextColor,
                    ),
                  ),
                  Text(
                    '${widget.countryCode} ${widget.phoneNumber}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraSmall,
                      fontWeight: ConstantFontWeight.bold,
                      color: ConstantColors.primaryColor,
                    ),
                  ),
                  Text(
                    'by entering the code sent to.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraSmall,
                      fontWeight: ConstantFontWeight.normal,
                      color: ConstantColors.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        List.generate(4, (index) => _buildCodeTextField(index)),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _isButtonEnabled
                        ? () {
                            // Your resend code logic here
                          }
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh_rounded,
                          size: 20,
                          color: _isButtonEnabled
                              ? ConstantColors.primaryColor
                              : ConstantColors.secondaryTextColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Resend code in $_remainingTime s',
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraExtraSmall,
                            fontWeight: ConstantFontWeight.normal,
                            color: _isButtonEnabled
                                ? ConstantColors.primaryColor
                                : ConstantColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: ConstantColors.primaryTextColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
