// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginForm on _LoginForm, Store {
  final _$userNameErrorAtom = Atom(name: '_LoginForm.userNameError');

  @override
  String get userNameError {
    _$userNameErrorAtom.context.enforceReadPolicy(_$userNameErrorAtom);
    _$userNameErrorAtom.reportObserved();
    return super.userNameError;
  }

  @override
  set userNameError(String value) {
    _$userNameErrorAtom.context.conditionallyRunInAction(() {
      super.userNameError = value;
      _$userNameErrorAtom.reportChanged();
    }, _$userNameErrorAtom, name: '${_$userNameErrorAtom.name}_set');
  }

  final _$passwordErrorAtom = Atom(name: '_LoginForm.passwordError');

  @override
  String get passwordError {
    _$passwordErrorAtom.context.enforceReadPolicy(_$passwordErrorAtom);
    _$passwordErrorAtom.reportObserved();
    return super.passwordError;
  }

  @override
  set passwordError(String value) {
    _$passwordErrorAtom.context.conditionallyRunInAction(() {
      super.passwordError = value;
      _$passwordErrorAtom.reportChanged();
    }, _$passwordErrorAtom, name: '${_$passwordErrorAtom.name}_set');
  }

  final _$submitFormAsyncAction = AsyncAction('submitForm');

  @override
  Future<dynamic> submitForm({String userName, String password}) {
    return _$submitFormAsyncAction
        .run(() => super.submitForm(userName: userName, password: password));
  }

  @override
  String toString() {
    final string =
        'userNameError: ${userNameError.toString()},passwordError: ${passwordError.toString()}';
    return '{$string}';
  }
}
