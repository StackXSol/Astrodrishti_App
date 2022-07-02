import 'dart:convert';

import 'package:astrodrishti/cubit/astrodrishti_cubit_cubit.dart';
import 'package:astrodrishti/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

Future<String> getSign(context, dob, tob, lat, lon, tz) async {
  var res = await http.get(Uri.parse(
      "https://api.vedicastroapi.com/json/horoscope/findsunsign?dob=${dob}&tob=${tob}&lat=${lat}&lon=${lon}&tz=${tz}&api_key=$key"));
  try {
    return jsonDecode(res.body)["response"]["sun_sign"]
        .toString()
        .toLowerCase();
  } catch (e) {
    return "";
  }
}
