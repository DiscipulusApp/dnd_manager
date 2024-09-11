# DND Manager Flutter Plugin

The DND Manager Flutter plugin provides a simple interface to manage Do Not Disturb (DND) settings on Android devices. This plugin allows you to check and modify DND status, request DND access, and check if the device is in silent mode.

## Features

- Set DND mode (silent or normal)
- Check if the app has DND access
- Request DND access
- Check if the device is in silent mode

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  dnd_manager: ^1.0.0
```

## Usage

First, import the package in your Dart code:

```dart
import 'package:dnd_manager/dnd_manager.dart';
```

### Set DND Mode

To set the device to silent (DND) mode or normal mode:

```dart
try {
  await DNDManager.setDNDMode(true); // Set to silent mode
  // or
  await DNDManager.setDNDMode(false); // Set to normal mode
} catch (e) {
  print('Failed to set DND mode: $e');
}
```

### Check DND Access

Before using DND features, check if your app has the necessary permissions:

```dart
bool hasAccess = await DNDManager.hasDNDAccess;
if (hasAccess) {
  print('App has DND access');
} else {
  print('App does not have DND access');
}
```

### Request DND Access

If your app doesn't have DND access, you can request it:

```dart
try {
  await DNDManager.requestDNDAccess();
  print('DND access requested');
} catch (e) {
  print('Failed to request DND access: $e');
}
```

### Check Silent Mode

To check if the device is currently in silent mode:

```dart
bool isSilent = await DNDManager.isSilent;
print('Device is ${isSilent ? 'in' : 'not in'} silent mode');
```

## Example

Here's a complete example demonstrating how to use the DND Manager plugin:

```dart
import 'package:flutter/material.dart';
import 'package:dnd_manager/dnd_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DND Manager Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Set Silent Mode'),
                onPressed: () async {
                  try {
                    await DNDManager.setDNDMode(true);
                    print('Set to silent mode');
                  } catch (e) {
                    print('Failed to set silent mode: $e');
                  }
                },
              ),
              ElevatedButton(
                child: Text('Set Normal Mode'),
                onPressed: () async {
                  try {
                    await DNDManager.setDNDMode(false);
                    print('Set to normal mode');
                  } catch (e) {
                    print('Failed to set normal mode: $e');
                  }
                },
              ),
              ElevatedButton(
                child: Text('Check DND Access'),
                onPressed: () async {
                  bool hasAccess = await DNDManager.hasDNDAccess;
                  print('Has DND access: $hasAccess');
                },
              ),
              ElevatedButton(
                child: Text('Request DND Access'),
                onPressed: () async {
                  try {
                    await DNDManager.requestDNDAccess();
                    print('DND access requested');
                  } catch (e) {
                    print('Failed to request DND access: $e');
                  }
                },
              ),
              ElevatedButton(
                child: Text('Check Silent Mode'),
                onPressed: () async {
                  bool isSilent = await DNDManager.isSilent;
                  print('Device is ${isSilent ? 'in' : 'not in'} silent mode');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Notes

- This plugin only works on Android devices.
- Ensure you have the necessary permissions in your Android app's manifest file.
- The plugin may not work on all Android devices due to manufacturer-specific implementations of DND features.