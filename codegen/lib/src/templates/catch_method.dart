import 'package:analyzer/dart/element/element.dart';
import 'package:lce/anotations.dart';

import '../aid/mobx_codegen/method.dart';
import '../aid/mobx_codegen/type_names.dart';

class CatchMethodTemplate {
  final LCECatch lceCatch;
  final MethodOverrideTemplate method;
  final MethodElement element;
  final LibraryScopedNameFinder typeFinder;

  CatchMethodTemplate(this.method, this.lceCatch, this.typeFinder, this.element);

  final methodCatchMap = {
    CatchLevel.weak: '\$catch',
    CatchLevel.strong: '\$\$catch',
    CatchLevel.retry: '\$retry',
  };

  String get methodCatch => methodCatchMap[lceCatch.level]!;

  String get message {
    if (lceCatch.withCause == false) {
      return '"${lceCatch.message ?? ''}"';
    }

    if ((lceCatch.message?.isEmpty ?? true) == true) {
      return 'e.toString()';
    } else {
      return '"${lceCatch.message}\\n\${e.toString()}"';
    }
  }

  String get title {
    if (lceCatch.title == null) return 'null';
    return '"${lceCatch.title}"';
  }

  String get catchedCode {
    switch (lceCatch.level) {
      case CatchLevel.strong:
        return """
          showMessageDialog(
            $message,
            title: $title,
          );
          """;
      case CatchLevel.retry:
        return """
          showRetry(
            $message,
            onRetry: () => ${method.name}$methodCatch${method.typeArgs}(${method.args}),
            title: $title,
          );
          """;
      case CatchLevel.weak:
      default:
        return """
          showMessage($message);
          """;
    }
  }

  @override
  String toString() => element.isAsynchronous
      ? """
      ${method.returnType} ${method.name}$methodCatch${method.typeParams}(${method.params}) async{
        try {
          return await ${method.name}${method.typeArgs}(${method.args});
        } catch (e) {
          $catchedCode
        }
      }
      """
      : """
      ${method.returnType} ${method.name}\$$methodCatch${method.typeParams}(${method.params}) {
        try {
          return ${method.name}${method.typeArgs}(${method.args});
        } catch (e) {
          $catchedCode
        }
      }
      """;
}
