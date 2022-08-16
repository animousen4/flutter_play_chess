abstract class NetworkError {}

class ConnectionError extends NetworkError {}

class NotFoundError extends NetworkError {}

class TokenExpiredError extends NetworkError {}

class RightError extends NetworkError {}

class UnknownError extends NetworkError {}
