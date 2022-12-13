import 'dart:async';

import 'package:build/build.dart';
import 'package:lce_codegen/src/lce_class_visitor.dart';
import 'package:source_gen/source_gen.dart';

import 'aid/mobx_codegen/type_names.dart';
import 'config.dart';

class LCEGenerator extends Generator {
  final Config config;

  LCEGenerator(this.config);

  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) async {
    if (library.allElements.isEmpty) return '';

    final values = <String>{};

    for (var classElement in library.classes) {
      if (isLCEStoreClass(classElement)) {
        final typeNameFinder = LibraryScopedNameFinder(library.element);
        final visitor = LCEClassVisitor(typeNameFinder, config);
        classElement
          ..accept(visitor)
          ..visitChildren(visitor);
        final generatedValue = visitor.source;

        if (generatedValue.isNotEmpty) values.add(generatedValue);
      }
    }

    return values.join('\n\n');
  }
}
