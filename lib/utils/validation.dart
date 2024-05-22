import 'package:flutter/material.dart';

class Validation {
  Validation._();

  static final numbersRegExp = RegExp(r'^[0-9]*$');
  static final numberWithDecimalsRegExp = RegExp(r'^\d*\.?\d*$');
  static final amountRegExp = RegExp(r'^(?!0\.00)\d{1,3}(,\d{3})*(\.\d\d)?$');
  static final charactersRegExp = RegExp(r'^[A-Za-z]*$');
  static final charactersAndNumbersRegExp = RegExp(r'^[A-Za-z0-9]*$');
  static final charactersWithSpacesRegExp = RegExp(r'^[a-zA-Z\s]*$');
  static final charactersAndNumbersWithSpacesRegExp =
      RegExp(r'^[a-zA-Z0-9\s]*$');
  static final oldNicRegExp = RegExp(r'^([456789][0-9]{8}[VvXx])$');
  static final newNicRegExp = RegExp(r'^(((19)|(20))[0-9]{10})$');
  static final passportRegExp = RegExp(r'^[0-9a-zA-Z]{3,30}$');
  static final internationalMobileNumberRegExp = RegExp(
    r'(\+|00)(297|93|244|1264|358|355|376|971|54|374|1684|1268|61|43|994|257|32|229|226|880|359|973|1242|387|590|375|501|1441|591|55|1246|673|975|267|236|1|61|41|56|86|225|237|243|242|682|57|269|238|506|53|5999|61|1345|357|420|49|253|1767|45|1809|1829|1849|213|593|20|291|212|34|372|251|358|679|500|33|298|691|241|44|995|44|233|350|224|590|220|245|240|30|1473|299|502|594|1671|592|852|504|385|509|36|62|44|91|246|353|98|964|354|972|39|1876|44|962|81|76|77|254|996|855|686|1869|82|383|965|856|961|231|218|1758|423|94|266|370|352|371|853|590|212|377|373|261|960|52|692|389|223|356|95|382|976|1670|258|222|1664|596|230|265|60|262|264|687|227|672|234|505|683|31|47|977|674|64|968|92|507|64|51|63|680|675|48|1787|1939|850|351|595|970|689|974|262|40|7|250|966|249|221|65|500|4779|677|232|503|378|252|508|381|211|239|597|421|386|46|268|1721|248|963|1649|235|228|66|992|690|993|670|676|1868|216|90|688|886|255|256|380|598|1|998|3906698|379|1784|58|1284|1340|84|678|681|685|967|27|260|263)(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{4,20}$',
  );
  static final localMobileNumberRegExp =
      RegExp(r'07[0,1,2,3,4,5,6,7,8,9][0-9]+');
  static final sriLankanMobileNumberRegExp =
      RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  static final sriLankanLandlineRegExp = RegExp(r'011[0-9]{7}');
  static final emailAddressRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
  static final addressRegExp = RegExp(r'[0-9a-zA-Z#][0-9a-zA-Z#\/,. ]{0,}');

  static String? emailAddressValidator(
      BuildContext context, String emailAddress) {
    emailAddress = emailAddress.trim();

    String? emailAddressErrorText;

    if (emailAddress.isEmpty) {
      emailAddressErrorText = "Email must be required";
    }
    return emailAddressErrorText;
  }

  static String? passportNumberValidator(
      BuildContext context, String passportNumber) {
    passportNumber = passportNumber.trim();

    String? passportNumberErrorText;

    if (passportNumber.isEmpty) {
      passportNumberErrorText = "Passport number must be required";
    }
    return passportNumberErrorText;
  }

  static String? nicNumberValidator(BuildContext context, String nicNumber) {
    nicNumber = nicNumber.trim();

    String? nicNumberErrorText;

    if (nicNumber.isEmpty) {
      nicNumberErrorText = "NIC number must be required";
    } else if (nicNumber.length < 10) {
      nicNumberErrorText = "NIC number must be incude 10 character";
    }
    return nicNumberErrorText;
  }

  static String? mobileNumberValidator(
      BuildContext context, String mobileNumber) {
    mobileNumber = mobileNumber.trim();

    String? mobileNumberErrorText;

    if (mobileNumber.isEmpty) {
      mobileNumberErrorText = "Mobile number must be required";
    } else if (mobileNumber.length < 10) {
      mobileNumberErrorText = "mobile number must be incude 10 character";
    }
    return mobileNumberErrorText;
  }

  static String? otpValidator(BuildContext context, String otp) {
    otp = otp.trim();

    String? otpErrorText;

    if (otp.isEmpty) {
      otpErrorText = "OTP can't be empty";
    } else if (otp.length < 4) {
      otpErrorText = "OTP must be incude 4 character";
    }
    return otpErrorText;
  }

  static String? firstNameValidator(BuildContext context, String firstName) {
    firstName = firstName.trim();

    String? firstNameErrorText;

    if (firstName.isEmpty) {
      firstNameErrorText = "First name must be required";
    }
    return firstNameErrorText;
  }

  static String? lastNameValidator(BuildContext context, String lastName) {
    lastName = lastName.trim();

    String? lastNameErrorText;

    if (lastName.isEmpty) {
      lastNameErrorText = "Last name must be required";
    }
    return lastNameErrorText;
  }

  static String? houseNumberValidator(
      BuildContext context, String houseNumber) {
    houseNumber = houseNumber.trim();

    String? houseNumberErrorText;

    if (houseNumber.isEmpty) {
      houseNumberErrorText = "House number must be required";
    }
    return houseNumberErrorText;
  }

  static String? streetNameValidator(BuildContext context, String streetName) {
    streetName = streetName.trim();

    String? streetNameErrorText;

    if (streetName.isEmpty) {
      streetNameErrorText = "Street name must be required";
    }
    return streetNameErrorText;
  }

  static String? cityNameValidator(BuildContext context, String cityName) {
    cityName = cityName.trim();

    String? cityNameErrorText;

    if (cityName.isEmpty) {
      cityNameErrorText = "City name must be required";
    }
    return cityNameErrorText;
  }

  static String? countryNameValidator(BuildContext context, String countryName) {
    countryName = countryName.trim();

    String? countryNameErrorText;

    if (countryName.isEmpty) {
      countryNameErrorText = "City name must be required";
    }
    return countryNameErrorText;
  }

  // static String? scanPassportValidator(
  //     BuildContext context, Image scanPassport) {
  //   scanPassport = scanPassport.t;

  //   String? countryNameErrorText;

  //   if (scanPassport.isEmpty) {
  //     countryNameErrorText = "City name must be required";
  //   }
  //   return countryNameErrorText;
  // }
}
