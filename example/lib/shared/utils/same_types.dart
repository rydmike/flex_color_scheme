/// Check whether two types are the same type in Dart when working with
/// generic types.
///
/// Uses the same definition as the language specification for when two
/// types are the same. Currently the same as mutual sub-typing.
///
/// This is based on this StackOverflow answer:
/// https://stackoverflow.com/questions/67446069/dart-how-to-determine-nullable-generic-type-at-runtime/67456559#67456559
bool sameTypes<S, V>() {
  void func<X extends S>() {}
  // Dart spec says this is only true if S and V are "the same type".
  return func is void Function<X extends V>();
}
