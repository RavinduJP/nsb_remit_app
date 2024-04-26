import 'package:flutter/material.dart';
import 'package:nsb_remit/models/user_details.dart';

class UserDetailsProvider extends ChangeNotifier {
  UserDetails? _userDetails;
  addSignUpDetails(
      {required String documentType,
      required String passportNumber,
      required String nicNumber,
      required String selectedCountryCode,
      required String mobileNumber,
      required String emailAddress}) {
    _userDetails!.documentType = documentType;
    _userDetails!.passportNumbe = passportNumber;
    _userDetails!.nicNumber = nicNumber;
    _userDetails!.selectedCountryCode = selectedCountryCode;
    _userDetails!.mobileNumber = mobileNumber;
    _userDetails!.emailAddress = emailAddress;
    notifyListeners();
  }
}
