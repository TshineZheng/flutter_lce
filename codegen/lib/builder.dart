import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/lce_generator.dart';

Builder makeBuilder(BuilderOptions options) {
  return SharedPartBuilder([
    LCEGenerator(),
  ], 'lce_codegen');
}
