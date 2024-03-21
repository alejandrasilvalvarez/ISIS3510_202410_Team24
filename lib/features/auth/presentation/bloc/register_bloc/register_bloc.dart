import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/register_account.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterAccount>(
        (RegisterAccount event, Emitter<RegisterState> emit) async {
      //
      emit(const RegisterLoading());
      RegisterAccountUseCase usecase = sl<RegisterAccountUseCase>();
      await usecase(email: event.email, password: event.password)
          .then((Either<String, User?> value) {
        value.fold(
          (String l) => emit(
            RegisterError(
              errorMessage: l,
            ),
          ),
          (User? r) {
            Get.toNamed('/dashboard_home');
            emit(RegisterSuccessfull(user: r));
          },
        );
      });
    });
  }
}
