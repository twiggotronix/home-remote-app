import 'package:flutter/material.dart';
import 'package:home_remote/components/device_cards.dart';
import 'package:home_remote/models/device.dart';
import 'package:home_remote/models/home_arguments.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Device> devices = [];

  @override
  Widget build(BuildContext context) {
    HomeArguments? data = ModalRoute.of(context)!.settings.arguments as HomeArguments?;
    setState(() {
      devices = data!.devices;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home remote'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        titleTextStyle: const TextStyle(
            color: Colors.white
        ),
      ),
      body: DeviceCards(devices: devices, updateDeviceState: updateDeviceState,),
    );
  }

  void updateDeviceState(Device device, bool newState) {
    setState(() {
      devices[devices.indexWhere((element)  => element.id == device.id)].isOn = newState;
    });
  }
}
