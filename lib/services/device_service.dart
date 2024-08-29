import 'package:home_remote/exceptions/devices_not_loaded_exception.dart';
import 'package:home_remote/models/device.dart';
import 'package:logger/logger.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class DeviceService {
  static Future<List<Device>> getDevices() async {
    final logger = Logger();
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      if (response.statusCode == 200) {
        List jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        List<Device> devices = jsonResponse.map(fromJsonData).toList();
        return devices;
      } else {
        logger.e('Request failed with status: ${response.statusCode}.');
        throw DevicesNotLoadedException(response.statusCode);
      }
    } catch (e) {
      logger.e(e);
      throw Exception("Could not get devices : ${e.toString()}");
    }
  }

  static Device fromJsonData(toElement) {
    return Device(
        id: toElement['id'].toString(), name: toElement['title'], isOn: false);
  }
}
