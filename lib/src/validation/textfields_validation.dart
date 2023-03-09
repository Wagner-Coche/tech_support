import 'package:string_validator/string_validator.dart' as validator;

mixin TextFieldsValidation {
  String? emailValidator(String? email) {
    if (email!.isEmpty) return "Campo obrigatório!";
    if (!(validator.isEmail(email.trim()))) return "Informe um email válido!";
    return null;
  }

  String? passwordValidator(String? password) {
    if (password!.isEmpty) return "Campo obrigatório!";
    if (password.trim().length < 8) return "A password precisa ter no mínimo 8 caracteres";
    return null;
  }

  String? fullNameValidator(String? fullName) {
    if (fullName!.isEmpty) return "Campo obrigatório!";
    if (fullName.split(" ").length < 2 || fullName.split(" ")[1].isEmpty) {
      return "Nome completo, por favor!";
    }
    return null;
  }

  String? fieldValidator(String? field) {
    if (field!.isEmpty) return "O campo obrigatório!";
    return null;
  }
}