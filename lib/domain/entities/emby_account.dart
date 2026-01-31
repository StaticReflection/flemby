class EmbyAccount {
  final String name;
  final String accessToken;
  final String id;

  EmbyAccount({
    required this.name,
    required this.accessToken,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmbyAccount &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
