import 'package:analyzer/dart/element/element.dart';

import 'params.dart';
import 'type_names.dart';

/// Removes leading underscores.
extension NonPrivateNameExtension on String {
  /// e.g.: from `_foo_bar` to `foo_bar`
  String get nonPrivateName => replaceAll(RegExp(r'^_*'), '');
}


TypeParamTemplate typeParamTemplate(
  TypeParameterElement param,
  LibraryScopedNameFinder typeNameFinder,
) =>
    TypeParamTemplate(
        name: param.name,
        bound: param.bound != null
            ? typeNameFinder.findTypeParameterBoundsTypeName(param)
            : null);
            
// ignore: avoid_annotating_with_dynamic
String surroundNonEmpty(String prefix, String suffix, dynamic content) {
  final contentStr = content.toString();
  return contentStr.isEmpty ? '' : '$prefix$contentStr$suffix';
}