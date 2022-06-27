import 'package:astrodrishti/backend.dart';
import 'package:astrodrishti/main.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'astrodrishti_cubit_state.dart';

class AstrodrishtiCubitCubit extends Cubit<AstrodrishtiCubitState> {
  AstrodrishtiCubitCubit()
      : super(
          AstrodrishtiCubitInitial(
            currentUser: userData(
                phone: 0,
                name: "",
                dob: "",
                lat: 0.0,
                lon: 0.0,
                time: "",
                sign: "",
                place: "",
                email: ""),
          ),
        );

  Future<void> getUserData(uid) async {
    dynamic key =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();

    userData cur = userData(
        phone: key.data()["Phone"],
        name: key.data()["Name"],
        dob: key.data()["DOB"],
        time: key.data()["TOB"],
        sign: "Virgo",
        lat: key.data()["Lat"],
        lon: key.data()["Lon"],
        place: key.data()["Place"],
        email: key.data()["Email"]);

    emit(AstrodrishtiCubitInitial(currentUser: cur));
  }
}
