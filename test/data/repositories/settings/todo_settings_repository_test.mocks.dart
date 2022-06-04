// Mocks generated by Mockito 5.2.0 from annotations
// in manabie_todo/test/data/repositories/settings/todo_settings_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:hive/hive.dart' as _i2;
import 'package:manabie_todo/todo_app/data/datasources/local/todo_settings_local_datasource.dart'
    as _i3;
import 'package:manabie_todo/todo_app/data/model/settings/todo_settings_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeBox_0<E> extends _i1.Fake implements _i2.Box<E> {}

/// A class which mocks [TodoSettingsLocalDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoSettingsLocalDataSourceImpl extends _i1.Mock
    implements _i3.TodoSettingsLocalDataSourceImpl {
  MockTodoSettingsLocalDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Box<_i4.TodoSettingsModel> get box =>
      (super.noSuchMethod(Invocation.getter(#box),
              returnValue: _FakeBox_0<_i4.TodoSettingsModel>())
          as _i2.Box<_i4.TodoSettingsModel>);
  @override
  _i5.Future<List<String>> get keys => (super.noSuchMethod(
          Invocation.getter(#keys),
          returnValue: Future<List<String>>.value(<String>[]))
      as _i5.Future<List<String>>);
  @override
  _i5.Future<_i4.TodoSettingsModel?> get(String? key) =>
      (super.noSuchMethod(Invocation.method(#get, [key]),
              returnValue: Future<_i4.TodoSettingsModel?>.value())
          as _i5.Future<_i4.TodoSettingsModel?>);
  @override
  _i5.Future<List<_i4.TodoSettingsModel>> getAll() =>
      (super.noSuchMethod(Invocation.method(#getAll, []),
              returnValue: Future<List<_i4.TodoSettingsModel>>.value(
                  <_i4.TodoSettingsModel>[]))
          as _i5.Future<List<_i4.TodoSettingsModel>>);
  @override
  _i5.Future<void> put(String? key, _i4.TodoSettingsModel? value) =>
      (super.noSuchMethod(Invocation.method(#put, [key, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> putAll(Map<String, _i4.TodoSettingsModel>? items) =>
      (super.noSuchMethod(Invocation.method(#putAll, [items]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> delete(String? key) =>
      (super.noSuchMethod(Invocation.method(#delete, [key]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> deleteAll() =>
      (super.noSuchMethod(Invocation.method(#deleteAll, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<int> add(_i4.TodoSettingsModel? settingsModel) =>
      (super.noSuchMethod(Invocation.method(#add, [settingsModel]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<void> deleteAtIndex(int? index) =>
      (super.noSuchMethod(Invocation.method(#deleteAtIndex, [index]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> putAt(int? index, _i4.TodoSettingsModel? value) =>
      (super.noSuchMethod(Invocation.method(#putAt, [index, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}
