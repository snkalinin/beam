/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:playground/modules/examples/models/example_model.dart';
import 'package:playground/modules/examples/repositories/example_repository.dart';
import 'package:playground/pages/playground/states/example_dropdown_state.dart';
import 'package:playground/pages/playground/states/examples_state.dart';

import 'mocks/categories_mock.dart';

void main() {
  test(
      'ExampleDropdown state should notify all listeners about filter type change',
      () {
    final exampleState = ExampleState(ExampleRepository());
    final state = ExampleDropdownState(exampleState, []);
    state.addListener(() {
      expect(state.selectedFilterType, ExampleType.example);
    });
    state.setSelectedFilterType(ExampleType.example);
  });

  test(
      'ExampleDropdown state should notify all listeners about categories change',
      () {
    final exampleState = ExampleState(ExampleRepository());
    final state = ExampleDropdownState(exampleState, []);
    state.addListener(() {
      expect(state.categories, []);
    });
    state.setCategories([]);
  });

  test(
      'ExampleDropdown state sortExamplesByType should:'
      '- update categories,'
      '- notify all listeners,'
      'but should NOT:'
      '- affect Example state categories', () {
    final exampleState = ExampleState(ExampleRepository());
    final state = ExampleDropdownState(exampleState, exampleState.categories!);
    state.addListener(() {
      expect(state.categories, categoriesSortedByTypeMock);
      expect(exampleState.categories, exampleState.categories);
    });
    state.sortExamplesByType(ExampleType.kata);
  });

  test(
      'ExampleDropdown state sortExamplesByName should:'
      '- update categories and notify all listeners,'
      'but should NOT:'
      '- wait for full name of example,'
      '- be sensitive for register,'
      '- affect Example state categories', () {
    final exampleState = ExampleState(ExampleRepository());
    final state = ExampleDropdownState(exampleState, exampleState.categories!);
    state.addListener(() {
      expect(state.categories, categoriesSortedByNameMock);
      expect(exampleState.categories, exampleState.categories);
    });
    state.sortExamplesByName('eLLoWoRl');
  });
}
