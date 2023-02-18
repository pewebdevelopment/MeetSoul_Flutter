import 'dart:math';

import 'package:get/get.dart';

import '../../../models/dummy.dart';
import '../../../models/response/status_model.dart';
import '../../../models/response/user/User.dart';

class ProfileController extends GetxController{
  Random rnd = Random();
  RxInt selectedStatus = 1.obs;
  RxList<Status> status = <Status>[].obs;
  late User user;

  @override
  void onInit() {
    user = DummyData().getUsers()[0];
    status.value = DummyData().getStatus();
    super.onInit();
  }

  onStatusClick(int i){
    selectedStatus.value = i;
  }

}