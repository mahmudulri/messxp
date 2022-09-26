
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:messxp/provider/create_mess_provider.dart';

import '../ui/screens/dashboard.dart';

class CreateMessController extends GetxController {


  GlobalKey<FormState> messFromKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  late TextEditingController messController, addressController,ownerNameController, ownerPasswordController;

  var messName = '';
  var address = ''.obs;
  var ownerName = '';
  var ownerPhone = '';

  late StreamSubscription<Position>? streamSubscription;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addressController = TextEditingController(text: address.value);
    messController = TextEditingController();
    ownerNameController = TextEditingController();
    ownerPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    messController.dispose();
    addressController.dispose();
    ownerNameController.dispose();
    ownerPasswordController.dispose();
    streamSubscription?.cancel();
  }

  String? validateName(String value) {
    if (value.length < 1) {
      return "Enter Mess Name";
    }
    return null;
  }

  // String? validateAddress(String value) {
  //   print("addddddddressssss4444444......."+address.value.toString());
  //   print("addddddddressssss55555555......."+value.toString());
  //   if (value.length < 1) {
  //     return "Enter Address";
  //   }
  //   return null;
  // }
  String? validateOwnerName(String value) {
    if (value.length < 1) {
      return "Enter Owner Name";
    }
    return null;
  }

  String? validateOwnerPhone(String value) {
    if (value.length < 11 || value.length > 11) {
      return "Phone number must be of 11 characters";
    }
    return null;
  }

  Future<void> createNewMess() async {

    print("addddddddressssss3333333......."+address.value.toString());

    String userAddress = "";
    userAddress = address.value;
    final isValid = messFromKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      messFromKey.currentState!.save();
    }

    isLoading.value = true;


    print("addddddddressssss7777777......."+userAddress.toString());




    var status = await CreateMessProvider().createMess(messName,userAddress, ownerName, ownerPhone);
    print("login status ......." +status.toString());

    if ( status== true) {
      isLoading.value = false;
      // Get.offAndToNamed(Routes.HOME);
      Get.to(() => DashBoard());
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Could not Create Mess",
        colorText: Colors.black,
        backgroundColor: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }
  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
          getAddressFromLatLang(position);
          streamSubscription?.pause();
        });


  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.street},${place.administrativeArea},${place.locality},${place.country}';


    print("addddddddressssss1111......."+address.toString());

  }
}