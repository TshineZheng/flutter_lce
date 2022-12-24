enum CatchLevel {
  weak, // Use toast to show errors
  strong, // Use Dialog to show errors
  retry, // Use Dialog with retry button to show errors
}

class LCECatch {
  final CatchLevel level;
  final String? title;
  final String? message;
  final bool withCause;

  const LCECatch(
      {this.level = CatchLevel.weak,
      this.title,
      this.message,
      this.withCause = true});
}

class WeakCatch extends LCECatch {
  const WeakCatch({super.message, super.withCause = true})
      : super(level: CatchLevel.weak);
}

class StrongCatch extends LCECatch {
  const StrongCatch({super.title, super.message, super.withCause = true})
      : super(level: CatchLevel.strong);
}

class RetryCatch extends LCECatch {
  const RetryCatch({super.title, super.message, super.withCause = true})
      : super(level: CatchLevel.retry);
}

const weakCatch = WeakCatch();

const strongCatch = StrongCatch();

const retryCatch = RetryCatch();
