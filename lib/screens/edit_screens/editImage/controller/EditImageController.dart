import 'package:datingui/models/response/user/User.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/frequent_utils.dart';

class EditImageController extends GetxController{
  RxList<String> images = <String>[].obs;
  late User user;



  EditImageController(this.user);
  imagePicker(int index)async{
    String path = await  FrequentUtils.getInstance().imagerPicker(ImageSource.gallery);
    images.value[index] = path;
    images.refresh();
  }

  @override
  void onInit() {
     images.value.addAll(user.images);
     images.refresh();
    // TODO: implement onInit
    super.onInit();
  }

}