import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/infrastructure/auth_repository.dart';

import '../../common/logger_provider.dart';

final lineLoginNotifierProvider = StateNotifierProvider(
  (ref) {
    return LineLoginNotifier(
      logger: ref.read(loggerProvider),
      authRepository: ref.read(authRepositoryProvider),
    );
  },
);

class LineLoginNotifier extends StateNotifier<String> {
  final BaseAuthRepository _authRepository;
  final Logger _logger;

  LineLoginNotifier(
      {required Logger logger, required BaseAuthRepository authRepository})
      : _logger = logger,
        _authRepository = authRepository,
        super('');

  void setIdToken(String idToken) {
    state = idToken;
  }

  Future<void> logIn() async {
    try {
      final idToken = await _authRepository.logInWithLine();
      if (idToken != null) {
        setIdToken(idToken);
        _logger.i(idToken);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
