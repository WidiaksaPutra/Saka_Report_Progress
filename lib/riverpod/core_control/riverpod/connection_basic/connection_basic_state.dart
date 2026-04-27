class ConnectionBasicState {
  late int latency;
  late bool connection;
  late bool loading;
  late String statusConnection;

  ConnectionBasicState({
    this.latency = 1000,
    this.connection = false,
    required this.loading,
    this.statusConnection = "offline",
  });

  ConnectionBasicState connectionBasicState({
    int? latency,
    bool? connection,
    bool? loading,
    String? statusConnection,
  }) {
    return ConnectionBasicState(
      latency: latency ?? this.latency,
      connection: connection ?? this.connection,
      loading: loading ?? this.loading,
      statusConnection: statusConnection ?? this.statusConnection,
    );
  }
}