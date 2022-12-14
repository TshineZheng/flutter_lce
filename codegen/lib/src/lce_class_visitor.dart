import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:lce/anotations.dart';
import 'package:lce_codegen/src/aid/mobx_codegen/method.dart';
import 'package:source_gen/source_gen.dart';

import 'aid/mobx_codegen/type_names.dart';
import 'config.dart';
import 'templates/catch_extension.dart';
import 'templates/catch_method.dart';

class LCEClassVisitor extends SimpleElementVisitor {
  final LibraryScopedNameFinder typeFinder;
  final Config config;

  final _template = CatchExtensionTemplate();

  LCEClassVisitor(this.typeFinder, this.config);

  @override
  void visitClassElement(ClassElement element) {
    if (isLCEStoreClass(element)) {
      _template.className = element.name;
    }
  }

  @override
  void visitFieldElement(FieldElement element) {}

  @override
  void visitPropertyAccessorElement(PropertyAccessorElement element) {}

  @override
  void visitMethodElement(MethodElement element) {
    if (_lceCatchChecker.hasAnnotationOf(element)) {
      final anotationList = _lceCatchChecker.annotationsOf(element);
      for (final anotation in anotationList) {
        final lceCatch = _antt2LCECatch(ConstantReader(anotation));
        _template.methodTemplate.add(
          CatchMethodTemplate(
            MethodOverrideTemplate.fromElement(element, typeFinder),
            lceCatch,
            typeFinder,
            element,
            config,
          ),
        );
      }
    }
  }

  LCECatch _antt2LCECatch(ConstantReader antt) {
    final title = antt.peek('title')?.stringValue;
    final message = antt.peek('message')?.stringValue;
    final withCause = antt.peek('withCause')?.boolValue;
    final level = CatchLevel.values[(antt.peek('level')?.objectValue.getField("index")?.toIntValue())!];
    return LCECatch(level: level, title: title, message: message, withCause: withCause ?? true);
  }

  String get source {
    return _template.toString();
  }
}

bool isLCEStoreClass(ClassElement classElement) =>
    classElement.allSupertypes.any((element) => element.getDisplayString(withNullability: false) == 'LCEStore');

const _lceCatchChecker = TypeChecker.fromRuntime(LCECatch);
