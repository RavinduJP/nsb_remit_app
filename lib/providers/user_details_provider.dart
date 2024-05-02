import 'package:flutter/material.dart';
import 'package:nsb_remit/models/user_details_model.dart';

class UserDetailsProvider extends ChangeNotifier {
  UserDetails _userDetails = UserDetails.empty();

  UserDetails get userDetails => _userDetails;
  addSignUpDetails({
    required String documentType,
    required String passportNumber,
    required String nicNumber,
    required String selectedCountryCode,
    required String mobileNumber,
    required String emailAddress,
    required String passportImage,
    required String visaImage,
    required String selfieImage,
  }) {
    _userDetails.documentType = documentType;
    _userDetails.passportNumbe = passportNumber;
    _userDetails.nicNumber = nicNumber;
    _userDetails.selectedCountryCode = selectedCountryCode;
    _userDetails.mobileNumber = mobileNumber;
    _userDetails.emailAddress = emailAddress;
    _userDetails.passportImage = passportImage;
    _userDetails.visaImage = visaImage;
    _userDetails.selfieImage = selfieImage;
    notifyListeners();
  }

  addUserRegistrationDetails({
    required String firstName,
    required String lastName,
    required String home,
    required String streetName,
    required String city,
    required String country,
  }) {
    _userDetails.firstName = firstName;
    _userDetails.lastName = lastName;
    _userDetails.house = home;
    _userDetails.streetName = streetName;
    _userDetails.city = city;
    _userDetails.country = country;
    notifyListeners();
  }

  addLoginDetails({
    required String emailAddress,
    required String pin,
  }) {
    _userDetails.emailAddress = emailAddress;
    _userDetails.pin = pin;
    notifyListeners();
  }

  addScaanPassportImage({required String passportImage}) {
    _userDetails.passportImage = passportImage;
    notifyListeners();
  }

  addScaanVisaImage({required String visaImage}) {
    _userDetails.visaImage = visaImage;
    notifyListeners();
  }

  addSelfieImage({required String selfieImage}) {
    _userDetails.selfieImage = selfieImage;
    notifyListeners();
  }

  addProofDocumentationImage({required List<String> proofDocument}) {
    _userDetails.proofDocument = proofDocument;
    notifyListeners();
  }
}
