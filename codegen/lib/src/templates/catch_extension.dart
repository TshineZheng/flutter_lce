import '../aid/mobx_codegen/rows.dart';
import 'catch_method.dart';

class CatchExtensionTemplate {
  late String className;

  Rows<CatchMethodTemplate> methodTemplate = Rows();

  @override
  String toString() {
    if (methodTemplate.isEmpty) return '';

    final ret = '''
      extension ${className}CatchExt on $className{
        
        $methodTemplate

      }
      ''';

    return ret;
  }
}
