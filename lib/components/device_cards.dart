import 'package:flutter/material.dart';
import 'package:home_remote/models/device.dart';
import 'package:home_remote/components/device_card.dart';

class DeviceCards extends StatelessWidget {
  final List<Device> devices;
  final Function updateDeviceState;

  const DeviceCards({super.key, required this.devices, required this.updateDeviceState});

  @override
  Widget build(BuildContext context) {
    return Column(children: devices.map((device) => DeviceCard(
      device: device,
      updateDeviceState: (newState) {
        updateDeviceState(device, newState);
      },
    )).toList());
  }
}