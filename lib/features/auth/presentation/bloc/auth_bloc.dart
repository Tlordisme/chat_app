import "package:flutter_bloc/flutter_bloc.dart";
import 'package:chat_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:chat_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final _storage = FlutterSecureStorage();
  
  AuthBloc({required this.registerUsecase, required this.loginUsecase}) : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);

  }
  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
      emit(AuthLoading());
      try{
        // ignore: unused_local_variable
        final user = await registerUsecase.call(event.username, event.email, event.password);       
        emit(AuthSuccess(message: "Success Register"));
      } catch (e){
        emit(AuthFail(error: 'Failed regis'));
      }
    }

    Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
      try{
        // ignore: unused_local_variable
        final user = await loginUsecase.call(event.email, event.password);
        await _storage.write(key: 'token', value: 'user.token');
        emit(AuthSuccess(message: "Success"));
      } catch (e){
        emit(AuthFail(error: 'Failed'));
      }
    }
}