import 'package:astrodrishti/backend.dart';
import 'package:astrodrishti/main.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'astrodrishti_cubit_state.dart';

class AstrodrishtiCubitCubit extends Cubit<AstrodrishtiCubitState> {
  AstrodrishtiCubitCubit()
      : super(
          AstrodrishtiCubitState(
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
              currentUserWallet: Wallet(balance: 0, transactions: {})),
        );

  Future<void> getUserData(uid, context) async {
    dynamic key =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();

    userData cur_user = userData(
        phone: int.parse(key.data()["Phone"]),
        name: key.data()["Name"],
        dob: key.data()["DOB"],
        time: key.data()["TOB"],
        sign: "Virgo",
        lat: double.parse(key.data()["Lat"].toString()),
        lon: double.parse(key.data()["Lon"].toString()),
        place: key.data()["Place"],
        email: key.data()["Email"]);

    emit(AstrodrishtiCubitState(
        currentUser: cur_user,
        currentUserWallet: BlocProvider.of<AstrodrishtiCubitCubit>(context)
            .state
            .currentUserWallet));
  }

  getUserWallet(uid, context) async {
    dynamic key =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();

    Wallet _wallet = Wallet(
        balance: key.data()["Wallet"]["Balance"],
        transactions: key.data()["Wallet"]["Transactions"]);

    emit(AstrodrishtiCubitState(
        currentUser:
            BlocProvider.of<AstrodrishtiCubitCubit>(context).state.currentUser,
        currentUserWallet: _wallet));
  }

  Future<void> reset() async {
    userData cur_user = userData(
        phone: 0,
        name: "",
        dob: "",
        time: "",
        sign: "",
        lat: 0.0,
        lon: 0.0,
        place: "",
        email: "");

    emit(AstrodrishtiCubitState(
        currentUser: cur_user,
        currentUserWallet: Wallet(balance: 0, transactions: {})));
  }
}
