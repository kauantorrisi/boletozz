class AppValidation {
  static String? isEmpty(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? "Campo obrigatório";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email é obrigatório";
    }

    final emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      caseSensitive: false,
    );

    if (!emailRegExp.hasMatch(value)) {
      return "Email inválido";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Senha é obrigatória";
    }

    if (value.length < 6) {
      return "A senha tem que ter mais de 6 caracteres";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "A senha tem que conter uma letra maiúscula";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return "A senha deve conter um número";
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "A senha deve conter um caractere especial";
    }

    return null;
  }
}
