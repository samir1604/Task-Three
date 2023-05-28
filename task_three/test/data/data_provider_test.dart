import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_three/data/data_provider.dart';

main() {
  group('Test Data Provider', () {
    group('read', () {
      test('return null if not value stored', () async {
        //Arrange
        SharedPreferences.setMockInitialValues({});

        final preferences = await SharedPreferences.getInstance();
        final dataProvider = DataProvider(preferences);

        //Act
        const String? expectedString = null;
        final actualString = dataProvider.read('');

        //Assert
        expect(expectedString, actualString);
      });

      test('return the correct store value', () async {
        //Arrange
        const storedValue = 'username';
        const storedKey = 'registeredUser';

        SharedPreferences.setMockInitialValues({
          storedKey: storedValue,
        });

        final preferences = await SharedPreferences.getInstance();
        final dataProvider = DataProvider(preferences);

        //Act
        const String expectedString = storedValue;
        final actualString = dataProvider.read(storedKey);

        //Assert
        expect(expectedString, actualString);
      });
    });

    group('register', () {
      test('store a value ', () async {
        //Arrange
        const storedValue = 'username';
        const storedKey = 'registeredUser';

        SharedPreferences.setMockInitialValues({});
        final preferences = await SharedPreferences.getInstance();
        final dataProvider = DataProvider(preferences);

        //Act
        await dataProvider.register(storedKey, storedValue);

        //Assert
        const String expectedString = storedValue;
        final actualString = dataProvider.read(storedKey);

        expect(expectedString, actualString);
      });
    });

    group('containsKey', () {
      test('return true finding a key', () async {
        //Arrange
        const storedValue = 'username';
        const storedKey = 'registeredUser';
        SharedPreferences.setMockInitialValues({storedKey: storedValue});

        final preferences = await SharedPreferences.getInstance();
        final dataProvider = DataProvider(preferences);

        //Act
        const expectedValue = true;
        final actualValue = dataProvider.containsKey(storedKey);

        //Assert
        expect(expectedValue, actualValue);
      });

      test('return false with not present key', () async {
        //Arrange
        const storedValue = 'username';
        const storedKey = 'registeredUser';
        const notStoredKey = 'notStoredKey';
        SharedPreferences.setMockInitialValues({storedKey: storedValue});
        final preferences = await SharedPreferences.getInstance();
        final dataProvider = DataProvider(preferences);

        //Act
        const expectedValue = false;
        final actualValue = dataProvider.containsKey(notStoredKey);

        //Assert
        expect(expectedValue, actualValue);
      });
    });

    group('clearRegister', () {
      test('Clear all stored data', () async {
        //Arrange
        const storedValue = 'username';
        const storedKey = 'registeredUser';

        SharedPreferences.setMockInitialValues({storedKey: storedValue});

        final preferences = await SharedPreferences.getInstance();
        final dataProvider = DataProvider(preferences);

        //Act
        dataProvider.clearRegister();

        const expectedKey = false;
        final actualKey = dataProvider.containsKey(storedKey);

        const expectedValue = null;
        final actualValue = dataProvider.read(storedKey);

        //Assert
        expect(expectedKey, actualKey);
        expect(expectedValue, actualValue);
      });
    });
  });
}
