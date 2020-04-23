class RegularExpressions {
  static const String email =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)'
      r'|(\".+\"))@((\[[0-9]'
      r'{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])'
      r'|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const Pattern password = r"^(?=.*[0-9])(?=.*[A-Z])(.{8,})$";
  static const Pattern name = r'^$';
  static const Pattern zip = r'^$';
  static const Pattern city = r'^[0-9]$';
  static const Pattern country = r'^$';
  static const Pattern address = r'^$';
  static const Pattern state = r'^$';
  static const Pattern phone = r'\+(374[9643210]\d|1[9643210])\d{1,10}$';
  static const Pattern onlyOneSpace = r'^[^\s]+(\s{1}[^\s]+)*$';
}