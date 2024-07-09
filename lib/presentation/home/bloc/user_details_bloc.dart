import 'dart:io';

import 'package:admin_pannel/core/service_locator/service_locator.dart';
import 'package:admin_pannel/data/model/user/user_model.dart';
import 'package:admin_pannel/domain/repository/iuser_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final IUserRepository _userRepository = getIt.get<IUserRepository>();

  UserDetailsBloc() : super(const UserDetailsState()) {
    on<AddUserEvent>((event, emit) async {
      try {
        print('AddUserEvent received'); // Debug statement
        emit(state.copyWith(error: null));

        var imageUrl = await _userRepository.uploadImage(state.imageFile!);
        event.userModel = event.userModel.copyWith(picture: imageUrl);

        await _userRepository.saveUser(event.userModel);
        emit(
            state.copyWith(userDetailsStateEnum: UserDetailsStateEnum.success));
      } on FirebaseException catch (e) {
        print('FirebaseException: ${e.toString()}'); // Debug statement
        emit(state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
            error: e.toString()));
      } catch (e) {
        print('Exception: ${e.toString()}'); // Debug statement
        emit(state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
            error: e.toString()));
      }
    });

    on<GetUserEvent>((event, emit) async {
      try {
        await emit.forEach(_userRepository.getRealTimeStreamData(),
            onData: (data) {
          return state.copyWith(
              userDetailsStateEnum: UserDetailsStateEnum.success,
              userModelList: data);
        }, onError: (e, _) {
          print('GetUserEvent Error: ${e.toString()}'); // Debug statement
          return state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
          );
        });
      } catch (e) {
        print('GetUserEvent Exception: ${e.toString()}'); // Debug statement
        emit(state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
            error: e.toString()));
      }
    });

    on<GetUserByIdEvent>((event, emit) async {
      try {
        print('GetUserByIdEvent received'); // Debug statement
        emit(
            state.copyWith(userDetailsStateEnum: UserDetailsStateEnum.loading));
        var res = await _userRepository.getUserById(event.email);
        emit(state.copyWith(
          userDetailsStateEnum: UserDetailsStateEnum.success,
          userModel: res,
        ));
      } catch (e) {
        print('GetUserByIdEvent Exception: ${e.toString()}'); // Debug statement
        emit(state.copyWith(
          userDetailsStateEnum: UserDetailsStateEnum.failure,
          error: e.toString(),
        ));
      }
    });

    on<PickImage>((event, emit) async {
      try {
        print('PickImage event received'); // Debug statement
        emit(state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.imagePicking));
        var res = await _userRepository.getFileFromPicker();
        emit(state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.imagePicked,
            imageFile: res));
      } catch (e) {
        print('PickImage Exception: ${e.toString()}'); // Debug statement
        emit(state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
            error: e.toString()));
      }
    });
  }
}
