import 'package:build/build.dart';
import 'package:lce_codegen/src/config.dart';
import 'package:source_gen/source_gen.dart';

import 'src/lce_generator.dart';

Builder makeBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [
      LCEGenerator(Config.fromBuilderOptions(options)),
    ],
    'lce_codegen',
  );
}
