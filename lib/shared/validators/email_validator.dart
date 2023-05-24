class EmailValidator {
  //this method return s message if the email is:
  //null, empty or invalid
  //if the email is valid will return null
  String? validate({String? email}) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email';
    }
    return null;
  }
}
