enum HttpProtocol {
  http('http://'),
  https('https://');

  final String scheme;

  const HttpProtocol(this.scheme);

  static HttpProtocol fromString(String value) {
    if (value.toLowerCase().startsWith('https')) {
      return HttpProtocol.https;
    }
    return HttpProtocol.http;
  }

  String applyTo(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) return url;

    return '$scheme$url';
  }

  @override
  String toString() => scheme;
}
