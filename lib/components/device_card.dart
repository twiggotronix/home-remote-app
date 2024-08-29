import 'package:flutter/material.dart';
import 'package:home_remote/models/device.dart';

typedef MapCallback = void Function(Map<String, dynamic> val);

class DeviceCard extends StatelessWidget {
  final Device device;
  final Function updateDeviceState;

  const DeviceCard(
      {super.key, required this.device, required this.updateDeviceState});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Column(
        children: [
          Icon(device.isOn ? Icons.lightbulb_outlined : Icons.lightbulb),
          Text(
            device.shortName(),
            style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
          ),
          Switch(
            value: device.isOn,
            onChanged: (val) {
              updateDeviceState(val);
            },
          )
        ],
      ),
    );
  }
}
