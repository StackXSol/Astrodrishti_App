class userData {
  userData(
      {required this.phone,
      required this.name,
      required this.dob,
      required this.time,
      required this.sign,
      required this.place,
      required this.email});

  String name, dob, time, sign, place, email;
  int phone;

  String getName() {
    return name;
  }

  String getDob() {
    return dob;
  }

  String getTime() {
    return time;
  }

  String getPlace() {
    return place;
  }

  String getSign() {
    return sign;
  }

  String getEmail() {
    return email;
  }

  int getPhone() {
    return phone;
  }
}
