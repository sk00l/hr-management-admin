import 'package:admin_pannel/core/service_locator/service_locator.dart';
import 'package:admin_pannel/data/model/user/user_model.dart';
import 'package:admin_pannel/domain/repository/iuser_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final IUserRepository _userRepository = getIt.get<IUserRepository>();

  UserDetailsBloc() : super(const UserDetailsState()) {
    on<GetUserEvent>((event, emit) async {
      try {
        await emit.forEach(_userRepository.getRealTimeStreamData(),
            onData: (data) {
          return state.copyWith(
              userDetailsStateEnum: UserDetailsStateEnum.success,
              userModelList: data);
        }, onError: (e, _) {
          return state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
          );
        });
      } catch (e) {
        emit(state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
            error: e.toString()));
      }
    });

    on<GetUserByIdEvent>((event, emit) async {
      try {
        emit(
            state.copyWith(userDetailsStateEnum: UserDetailsStateEnum.loading));
        var res = await _userRepository.getUserById(event.email);
        emit(state.copyWith(
          userDetailsStateEnum: UserDetailsStateEnum.success,
          userModel: res,
        ));
      } catch (e) {
        emit(state.copyWith(
          userDetailsStateEnum: UserDetailsStateEnum.failure,
          error: e.toString(),
        ));
      }
    });
  }
}
