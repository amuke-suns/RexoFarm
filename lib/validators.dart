class Validators {
  static String? validateFirstName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your first name';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validateRelationship(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validateVehicleType(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your vehicle type';
    }
    return null;
  }

  static String? validateNumberPlate(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your number plate';
    }
    return null;
  }

  static String? validateState(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your state of residence';
    }
    return null;
  }

  static String? validateCity(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your city';
    }
    return null;
  }

  static String? validateHomeAddress(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your home address';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your phone number';
    }
    return null;
  }


  static String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$').hasMatch(value!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter a password';
    }
    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
