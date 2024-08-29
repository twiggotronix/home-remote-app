import 'package:flutter/material.dart';
import 'package:home_remote/models/device.dart';
import 'package:home_remote/components/device_card.dart';

class DeviceCards extends StatelessWidget {
  final List<Device> devices;
  final Function updateDeviceState;

  const DeviceCards(
      {super.key, required this.devices, required this.updateDeviceState});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: devices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          Device device = devices[index];
          return  DeviceCard(
                  device: device,
                  updateDeviceState: (newState) {
                    updateDeviceState(device, newState);
                  },
                );
    });
  }
}
