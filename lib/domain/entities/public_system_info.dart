class PublicSystemInfo {
  final String? localAddress;
  final List<String> localAddresses;
  final String? wanAddress;
  final List<String> remoteAddresses;
  final String serverName;
  final String version;
  final String id;

  PublicSystemInfo({
    required this.localAddress,
    required this.localAddresses,
    required this.wanAddress,
    required this.remoteAddresses,
    required this.serverName,
    required this.version,
    required this.id,
  });
}
