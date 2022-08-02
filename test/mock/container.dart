import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:picbook/infrastructure/user_repository.dart';

import 'container.mocks.dart';

@GenerateMocks([UserRepository])
final mockUserRepository = MockUserRepository();

ProviderContainer overrideUserRepository() {
  return ProviderContainer(overrides: [
    userRepository.overrideWithProvider(
      Provider((ref) => mockUserRepository),
    )
  ]);
}
