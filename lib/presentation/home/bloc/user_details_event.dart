part of 'user_details_bloc.dart';

abstract class UserDetailsEvent{}

class GetUserEvent extends UserDetailsEvent{}

class GetUserByIdEvent extends UserDetailsEvent{
  final String email;
  GetUserByIdEvent(this.email);
}