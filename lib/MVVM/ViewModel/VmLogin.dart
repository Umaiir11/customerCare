import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../ClassModules/cmGlobalVariables.dart';
import '../../ServiceLayer/Sl_UserLogin.dart';
import '../../ServiceLayer/Sl_WLogin.dart';
import '../Model/ApiModels/ModCompanySettingQuery.dart';
import '../Model/ApiModels/ModUserProfile.dart';
import '../Model/MmoLogin.dart';

class VmLogin extends GetxController {
  MmoLoginModel l_MmoLoginModel = new MmoLoginModel();

  RxList<ModCompanySettingQuery>? l_PrCompanyList =
      <ModCompanySettingQuery>[].obs;

  late RxString l_PrUsername =''.obs;
  RxString get Pr_txtusername_Text {
    return l_PrUsername;
  }
  set Pr_txtusername_Text(RxString value) {
    l_PrUsername = value;
  }

  late RxString l_PrPassword = ''.obs;
  RxString get Pr_txtpassword_Text {
    return l_PrPassword;
  }
  set Pr_txtpassword_Text(RxString value) {
    l_PrPassword = value;
  }

  RxBool l_PrisSecurePassword = false.obs;

  RxBool get Pr_boolSecurePassword_wid {
    return l_PrisSecurePassword;
  }

  set Pr_boolSecurePassword_wid(RxBool value) {
    l_PrisSecurePassword = value;
  }

  bool l_PrisLoading = false;

  bool get Pr_bool_isLoading_wid {
    return l_PrisLoading;
  }

  Fnc_SetModelFields() {
    l_MmoLoginModel.username = l_PrUsername.value.trim();
    l_MmoLoginModel.password = l_PrPassword.value;
    //l_MmoLoginModel.companyList = l_PrCompanyList.;
  }

  bool get isValid {
    return l_PrUsername == null && l_PrPassword == null;
  }

  Future<void> Fnc_ValidateLogin() async {
    Fnc_SetModelFields();
    if (l_PrUsername == null) {
      print("Email req");
    } else if (l_PrPassword == null) {
      print("Pass req");
    } else {
      if (await Fnc_WValidateUser() == true) {
        if (await Fnc_OnlineProcedures() == true) {
          // Pr_bool_isLoading_wid = true;
          print("Done");
        }
      } else {}
    }
  }

  Future<bool> Fnc_WValidateUser() async {
    ModUserProfile? l_ModUserProfile =
        await SlwUserLogin().Fnc_UserProfile(l_MmoLoginModel);
    if (l_ModUserProfile == null) {
      return false;
    }

    cmGlobalVariables.Pb_UserDID = l_ModUserProfile.Pr_PKGUID;
    cmGlobalVariables.Pb_UserName = l_ModUserProfile.Pr_FullName;
    cmGlobalVariables.Pb_UserEmail = l_ModUserProfile.Pr_EmailID;
    cmGlobalVariables.Pb_UserNumber = l_ModUserProfile.Pr_ContactNo;
    cmGlobalVariables.Pb_UserImage = l_ModUserProfile.Pr_Image;
    return true;
  }

  Future<bool> Fnc_OnlineProcedures() async {
    Fnc_SetModelFields();
    List<ModCompanySettingQuery>? l_listcompany =
        new List<ModCompanySettingQuery>.empty(growable: true);

    l_listcompany = await SlwLogin().Fnc_WLogin(l_MmoLoginModel);
    l_PrCompanyList?.addAll(l_listcompany!);

    if (l_PrCompanyList == null) {
      return false;
    }
    return true;
  }
}
