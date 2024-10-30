part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const HTTP = _Paths.HTTP;
  static const REGISTER = _Paths.REGISTER;
  static const CRUD = _Paths.CRUD;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const HTTP = '/http';
  static const REGISTER = '/register';
  static const CRUD = '/crud';
}
