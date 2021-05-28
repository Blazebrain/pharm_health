extension DurationMaths on Duration {
  Duration add(int seconds) {
    return Duration(
      seconds: inSeconds + seconds,
    );
  }

  Duration subtract(int seconds) {
    return Duration(
      seconds: inSeconds - seconds,
    );
  }

  Duration fraction(double fraction) {
    return Duration(
      seconds: (inSeconds * fraction).toInt(),
    );
  }


}