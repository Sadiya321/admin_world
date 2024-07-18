import 'package:admin_world/background_widget.dart';
import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/images.dart';
import 'package:admin_world/const/strings.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // Import the Pinput package

class LoginsScreen extends StatefulWidget {
  const LoginsScreen({Key? key}) : super(key: key);

  @override
  State<LoginsScreen> createState() => _LoginsScreenState();
}

class _LoginsScreenState extends State<LoginsScreen> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  final TextEditingController _phoneController = TextEditingController();
  CountryCode _selectedCountry = CountryCode(
    code: 'IN',
    dialCode: '+91',
    name: 'भारत',
  );
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  final FocusNode _pinPutFocusNode = FocusNode();
  late BoxDecoration _pinPutDecoration;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor),
        color: AppColor.primary.withOpacity(0.3),
      ),
    );

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return bgWidget(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 20.0 : screenWidth * 0.1,
            vertical: screenHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 380,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: AppColor.primary, width: 2.0),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 8),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: TextFormField(
                                  maxLength: 10,
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(128),
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(128),
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                    ),
                                    prefixIcon: CountryCodePicker(
                                      onChanged: (country) {
                                        setState(() {
                                          _selectedCountry = country;
                                        });
                                      },
                                      initialSelection: _selectedCountry.code,
                                      favorite: ['+91', 'IN'],
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      alignLeft: false,
                                    ),
                                    suffixIcon:
                                        _phoneController.text.length > 9
                                            ? Container(
                                                height: 30,
                                                width: 30,
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green,
                                                ),
                                                child: const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              )
                                            : null,
                                    hintText: "Enter Phone number",
                                    labelText: "Enter Phone number",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),const Padding(
                      padding: EdgeInsets.only(right: 15.0, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone number must be 10 digits',
                            style: blacksmallTextStyle,
                          ),
                          // Obx(
                          //   () => Text(
                          //     '${authController.phoneNo.value.length}/10',
                          //     style: const TextStyle(
                          //       fontSize: 12,
                          //       fontFamily: regular,
                          //       fontWeight: FontWeight.normal,
                          //       color: AppColor.textPrimary,
                          //       decoration: TextDecoration.none,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 24),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                ),
                                child: const Text(
                                  "Verify number",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Pinput(
                              length: 6,
                              controller: pinController,
                              focusNode: focusNode,
                              defaultPinTheme: defaultPinTheme,
                              validator: (value) {
                                return value == '222222'
                                    ? null
                                    : 'Pin is incorrect';
                              },
                              hapticFeedbackType: HapticFeedbackType.lightImpact,
                              onCompleted: (pin) {
                                debugPrint('onCompleted: $pin');
                              },
                              onChanged: (value) {
                                debugPrint('onChanged: $value');
                              },
                              cursor: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 9),
                                    width: 22,
                                    height: 1,
                                    color: AppColor.primary,
                                  ),
                                ],
                              ),
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: focusedBorderColor),
                                ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                  color: fillColor,
                                  borderRadius: BorderRadius.circular(19),
                                  border:
                                      Border.all(color: focusedBorderColor),
                                ),
                              ),
                              errorPinTheme: defaultPinTheme.copyBorderWith(
                                border: Border.all(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            // Resend OTP logic
                          },
                          child: const Text(
                            "Didn't Receive OTP? Resend Code",
                            style: normalTextStyle,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Submit OTP logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 110),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (screenWidth > 600)
                Expanded(
                  child: Image.asset(
                    loginImage,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
