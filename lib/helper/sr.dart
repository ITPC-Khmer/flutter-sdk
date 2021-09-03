double toDouble(dynamic n) {
  if (n == null) return 0.0;
  if (n.toString() == 'null') return 0.0;

  var r = n ?? 0.0;
  try {
    return double.parse(r.toString());
  } catch (e) {
    return 0.0;
  }
}

int toDoubleRound100(dynamic n) {
  try {
    int nn = toDouble(n).round();
    return 100 * (nn / 100).round();
  } catch (_) {}

  return 0;
}

int toInt(dynamic n) {
  if (n == null) return 0;
  if (n.toString() == 'null') return 0;

  try {
    var r = toDouble(n);
    return r.toInt();
  } catch (e) {
    return 0;
  }
}
