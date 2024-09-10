import 'dart:developer';

import 'package:meta/meta.dart';

import 'package:{{name.lowerCase()}}/models/user.dart';
import 'package:{{name.lowerCase()}}/repositories/auth_repository.dart';
import 'package:{{name.lowerCase()}}/repositories/user_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  AuthenticationBloc(this.userRepository, this.authRepository)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SigninUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));

      try {
        final user = await authRepository.login();

        if (user == true) {
          emit(AuthenticationSuccessState(user: userRepository.userDataModel));
        } else {
          emit(AuthenticationFailureState("Error in Login"));
        }
      } on Exception catch (e) {
        emit(AuthenticationFailureState(e.toString()));
      }

      emit(AuthenticationLoadingState(isLoading: false));
    });
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    try {
      final user =
          json['user'] != null ? UserModel.fromJson(json['user']) : null;
      if (user != null) {
        userRepository.saveUserData(user);
      }

      return (AuthenticationSuccessState(user: user));
    } catch (e) {}
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    if (state is AuthenticationSuccessState) {
      final json = <String, dynamic>{};

      json['user'] = state.user ?? userRepository.userDataModel;

      log('Saved state to JSON: ${json.keys} ');
      return json;
    }
    return null;
  }
}
