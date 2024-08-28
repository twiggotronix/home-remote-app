import 'package:flutter/material.dart';
import 'package:home_remote/models/device.dart';
import 'package:home_remote/models/home_arguments.dart';
import 'package:home_remote/services/device_service.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late List<Device> devices;
  bool isLoading = true;
  bool isError = false;

  Future<void> loadDevices() async {
    try {
      List<Device> loadedDevices = await DeviceService.getDevices();
      setState(() {
        devices = loadedDevices;
        isLoading = false;
        isError = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadDevices();
  }

  void redirectIfLoaded(BuildContext context) {
    if (!isLoading && !isError) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/home',
          arguments: HomeArguments(devices: devices)));
    }
  }

  @override
  Widget build(BuildContext context) {
    redirectIfLoaded(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Loading...'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
          titleTextStyle: const TextStyle(color: Colors.white),
        ),
        body: isLoading
            ? const Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Loading"),
                ],
              )
            : Text(isError ? "Oh noooo.." : "Devices loaded"));
  }
}
