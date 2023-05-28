import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_three/features/auth/auth.dart';
import 'package:task_three/model/user.dart';

class FakeAuthRepository extends Mock implements AuthRepository {}

class MockCallBackFunction extends Mock {
  call();
}

main() {
  group('Test User Controller Notifier Listener', () {
    group('_fetchRegisterUser', () {
      late FakeAuthRepository fakeRepository;

      setUp(() {
        fakeRepository = FakeAuthRepository();
      });

      test('Check registered user call in class constructor', () {
        //Arrange
        const user = User(
          username: 'username',
          email: 'email',
          password: 'password',
        );
        when(() => fakeRepository.getRegisteredUser())
            .thenAnswer((invocation) => user);

        //Act
        final UserController sut = UserController(fakeRepository);
        //Assert
        const expectedUser = user;
        final actualUser = sut.getRegisteredUser;
        expect(expectedUser, actualUser);
      });
    });

    group('signIn', () {
      late FakeAuthRepository fakeRepository;
      late UserController sut;
      final notifyListenerCallback = MockCallBackFunction();

      setUp(() {
        fakeRepository = FakeAuthRepository();
        sut = UserController(fakeRepository)
          ..addListener(notifyListenerCallback);
        reset(notifyListenerCallback);
      });

      test('Check successfully sign in and call listeners and state value',
          () async {
        //Arrange
        const user = User(
          username: 'username',
          email: 'email',
          password: 'password',
        );
        const state = AuthState.login(user);
        when(() => fakeRepository.singIn(any()))
            .thenAnswer((invocation) => Future.value(user));

        //Act
        await sut.signIn(user.username, user.password);

        //Assert
        const expectedUser = user;
        final actualUser = sut.getRegisteredUser;
        const expectedState = state;
        User? expectedStateValue;

        expectedState.whenOrNull(login: (user) => expectedStateValue = user);

        expect(expectedUser, actualUser);
        expect(expectedState, isA<AuthStateLogin>());
        expect(expectedStateValue, expectedUser);
        verify(() => notifyListenerCallback()).called(2);
      });

      test('Sign in with wrong password , check call listeners and state value',
          () async {
        //Arrange
        const username = 'username';
        const password = 'password';
        const userWithWrongPassword = User(
          username: 'user',
          password: 'pass',
          email: 'email@email.com',
        );

        const error = 'User name or password are not valid';
        const state = AuthState.error(error);
        when(() => fakeRepository.singIn(any()))
            .thenAnswer((invocation) => Future.value(userWithWrongPassword));

        //Act
        await sut.signIn(username, password);

        //Assert
        const expectedUser = null;
        final actualUser = sut.getRegisteredUser;
        const expectedState = state;
        const expectedError = error;
        var actualError = '';
        state.whenOrNull(error: (error) => actualError = error);

        expect(expectedUser, actualUser);
        expect(expectedState, isA<AuthStateError>());
        expect(expectedError, actualError);
        verify(() => notifyListenerCallback()).called(2);
      });

      test(
          'Unsuccessful sign in with Exception , '
          'check call listeners and state value', () async {
        //Arrange
        const username = 'username';
        const password = 'password';
        const exceptionMessage = 'This is a custom exception';
        final exception = Exception(exceptionMessage);
        final state = AuthState.error(exception.toString());
        when(() => fakeRepository.singIn(any()))
            .thenAnswer((_) => throw Exception(exceptionMessage));

        //Act
        await sut.signIn(username, password);

        //Assert
        const expectedUser = null;
        final actualUser = sut.getRegisteredUser;

        final expectedState = state;
        var expectedStateValue = exception.toString();

        var actualStateValue = '';
        sut.state.whenOrNull(error: (error) => actualStateValue = error);

        expect(expectedUser, actualUser);
        expect(expectedState, isA<AuthStateError>());
        expect(expectedStateValue, actualStateValue);
        verify(() => notifyListenerCallback()).called(2);
      });
    });

    group('signUp', () {
      late FakeAuthRepository fakeRepository;
      late UserController sut;
      final notifyListenerCallback = MockCallBackFunction();

      setUp(() {
        fakeRepository = FakeAuthRepository();
        sut = UserController(fakeRepository)
          ..addListener(notifyListenerCallback);
        reset(notifyListenerCallback);
      });

      test('Check successfully sign up and call listeners and state value',
          () async {
        //Arrange
        const user = User(
          username: 'username',
          email: 'email',
          password: 'password',
        );
        const state = AuthState.signUp(user);
        when(() => fakeRepository.singUp(user))
            .thenAnswer((_) => Future.value());

        //Act
        await sut.singUp(user);

        //Assert
        const expectedUser = user;
        final actualUser = sut.getRegisteredUser;
        const expectedState = state;
        const expectedStateValue = user;
        User? actualStateValue;

        sut.state.whenOrNull(signUp: (user) => actualStateValue = user);

        expect(expectedUser, actualUser);
        expect(expectedState, isA<AuthStateSignUp>());
        expect(expectedStateValue, actualStateValue);
        verify(() => notifyListenerCallback()).called(2);
      });

      test(
          'Unsuccessful Sign Up with Exception  , '
          'check call listeners and state value', () async {
        //Arrange
        const user = User(
          username: 'username',
          password: 'password',
          email: 'email@email.com',
        );

        const exceptionMessage = 'User Already exists';
        final exception = Exception(exceptionMessage);
        final state = AuthState.error(exception.toString());
        when(() => fakeRepository.singUp(user))
            .thenAnswer((_) => throw Exception(exceptionMessage));

        //Act
        await sut.singUp(user);

        //Assert
        const expectedUser = null;
        final actualUser = sut.getRegisteredUser;

        final expectedState = state;
        var expectedError = exception.toString();
        var actualError = '';
        state.whenOrNull(error: (error) => actualError = error);

        expect(expectedUser, actualUser);
        expect(expectedState, isA<AuthStateError>());
        expect(expectedError, actualError);
        verify(() => notifyListenerCallback()).called(2);
      });
    });
  });
}
