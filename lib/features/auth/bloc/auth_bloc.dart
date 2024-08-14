import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walchain/core/services/auth_service.dart';
import 'package:walchain/features/auth/bloc/auth_event.dart';
import 'package:walchain/features/auth/bloc/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    _checkInitialAuthStatus();

    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        bool success = await _authService.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        if (success) {
          emit(AuthAuthenticated());
        } else {
          emit(AuthError('Login failed'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthLogoutRequested>((event, emit) async {
      await _authService.signOut();
      emit(AuthUnauthenticated());
    });
  }

  Future<void> _checkInitialAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('user_uid');
    if (uid != null) {
      emit( AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }
}
