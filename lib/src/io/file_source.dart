import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

/// Visitor interface for handling different types of [FileSource].
///
/// This follows the [Visitor design pattern]
/// (https://en.wikipedia.org/wiki/Visitor_pattern),
/// allowing specific behavior to be implemented for each kind of
/// [FileSource] without relying on type checks.
///
/// Example:
/// ```dart
/// class FileSourcePrinter implements FileSourceVisitor<void> {
///   @override
///   void visitAssetSource(AssetSource source) =>
///       print('Asset: ${source.path}');
///
///   @override
///   void visitFilepathSource(FilepathSource source) =>
///       print('File: ${source.path}');
///
///   @override
///   void visitNetworkSource(NetworkSource source) =>
///       print('Network: ${source.url}');
///
///   @override
///   void visitBytesSource(FutureBytesAudioSource source) =>
///       print('Future bytes source');
/// }
/// ```
abstract class FileSourceVisitor<T> {
  /// Called when visiting an [AssetSource].
  T visitAssetSource(AssetSource source);

  /// Called when visiting a [FilepathSource].
  T visitFilepathSource(FilepathSource source);

  /// Called when visiting a [NetworkSource].
  T visitNetworkSource(NetworkSource source);

  /// Called when visiting a [FutureBytesSource].
  T visitBytesSource(FutureBytesSource bytesAudioSource);
}

/// Abstract representation of a file source.
///
/// A [FileSource] represents any origin from which binary data can be
/// read, such as an asset, a local file, a network stream, or a
/// future-provided byte array.
@immutable
abstract final class FileSource {
  factory FileSource.asset(String path) => AssetSource(path);

  /// Accepts a visitor that performs an operation on this source type.
  T accept<T>(FileSourceVisitor<T> visitor);
}

/// File source representing a bundled asset.
///
/// Typically used for files packaged within the application's asset
/// bundle.
final class AssetSource implements FileSource {
  const AssetSource(this.path);

  /// Path of the asset inside the application bundle.
  final String path;

  @override
  T accept<T>(FileSourceVisitor<T> visitor) {
    return visitor.visitAssetSource(this);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetSource &&
          runtimeType == other.runtimeType &&
          path == other.path;

  @override
  int get hashCode => path.hashCode;
}

/// File source representing a file on the local file system.
final class FilepathSource implements FileSource {
  const FilepathSource(this.path);

  /// Path to the local file on disk.
  final String path;

  @override
  T accept<T>(FileSourceVisitor<T> visitor) {
    return visitor.visitFilepathSource(this);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilepathSource &&
          runtimeType == other.runtimeType &&
          path == other.path;

  @override
  int get hashCode => path.hashCode;
}

/// File source representing a remote file accessible via a network URL.
final class NetworkSource implements FileSource {
  const NetworkSource(this.url);

  /// URL pointing to the remote resource.
  final String url;

  @override
  T accept<T>(FileSourceVisitor<T> visitor) {
    return visitor.visitNetworkSource(this);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkSource &&
          runtimeType == other.runtimeType &&
          url == other.url;

  @override
  int get hashCode => url.hashCode;
}

/// File source representing data that will be provided asynchronously
/// as bytes.
///
/// This is useful for cases where the data must be loaded or generated
/// at runtime, such as decoding an audio buffer or downloading a file
/// into memory before playback.
final class FutureBytesSource implements FileSource {
  const FutureBytesSource(this.bytesFuture);

  /// Future that resolves to the binary contents of the file.
  final Future<Uint8List> bytesFuture;

  @override
  T accept<T>(FileSourceVisitor<T> visitor) {
    return visitor.visitBytesSource(this);
  }
}
