class Regex {
  static RegExp emailRegex =
      RegExp(r"\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+");

  static RegExp passwordRegex = RegExp(
    r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
  );
}
