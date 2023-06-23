part of 'internet_connection_check_cubit.dart';

@immutable
abstract class InternetConnectionCheckState {}

class InternetConnectionCheckInitial extends InternetConnectionCheckState {}


class InternetConnectionSuccess extends InternetConnectionCheckState {}
class InternetConnectionError extends InternetConnectionCheckState {}
class ResultChanged extends InternetConnectionCheckState {}