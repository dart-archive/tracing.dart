# Tracing

This package enable profiling your Dart applications and currently supports two backends:
- [Web Tracing Framework](http://google.github.io/tracing-framework/)
- [Dart Observatory](https://www.dartlang.org/tools/observatory/)

## Installation

Add the `tracing` package as a dependencie to your `pubspec.yaml`

## Usage

Use the tracing API to profile your application.

The Observatory backend is enabled by default and in order to enable the WTF backend, the client
code must call `detectWTF()` with the js context as a parameter:

```dart
import 'dart:js' show context;
import 'package:tracing/tracing.dart';

void main() {
    // Switch to the WTF backend when available
    detectWTF(context);

    // ... your application code to be profiled
}

```

