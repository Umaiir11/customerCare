import 'package:customercare/MVVM/View/VwCompany.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';

import '../ViewModel/VmLogin.dart';

class VwLogin extends StatefulWidget {
  @override
  State<VwLogin> createState() => _VwLoginState();
}

class _VwLoginState extends State<VwLogin> {
  @override
  final VmLogin l_vmLogin= Get.put(VmLogin());

  void initState() {
    // TODO: implement initState
    l_vmLogin.l_PrCompanyList?.clear();
    super.initState();
  }


  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passswordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    usernameController.addListener(() {
      l_vmLogin.Pr_txtusername_Text.value = usernameController.text;
    });

    passswordController.addListener(() {
      l_vmLogin.Pr_txtpassword_Text.value = passswordController.text;
    });

    Widget togglepassword() {
      return IconButton(
        onPressed: () {
          setState(() {
            l_vmLogin.Pr_boolSecurePassword_wid.value =
                !l_vmLogin.Pr_boolSecurePassword_wid.value;
          });
        },
        icon: l_vmLogin.Pr_boolSecurePassword_wid.value
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),
        color: Colors.indigo,
      );
    }

    Widget _WidgetportraitMode(double Pr_height, Pr_width) {
      return Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: Pr_height,
          width: Pr_width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFD1FFFF),
                Color(0xFF88ECF8),
                Color(0xFF65DCDC),
              ],
              stops: [0.1, 0.5, 0.7, 0.9],
            ),
          ),
          //color: Colors.black,
          padding: const EdgeInsets.all(16.0),
          // we use child container property and used most important property column that accepts multiple widgets

          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 500,
                ),
                Padding(
                    padding: EdgeInsets.only(top: Pr_height * 0.150),
                    child: Center(
                      child: Image.asset(
                        "assets/aisonr.png",
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: Pr_height * 0.350),
                    child: Center(child: Text("data"))),
                Container(
                  margin: EdgeInsets.only(top: Pr_height * 0.400),
                  child: Center(child: Text("data")),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Pr_height * 0.450),
                  child: Center(
                    child: SizedBox(
                        width: Pr_width * .890,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            hintStyle: const TextStyle(color: Colors.black26),
                            labelText: ' Email',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.white38)),
                            prefixIcon: const Icon(MdiIcons.fingerprint,
                                size: 20, color: Colors.indigo),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Pr_height * 0.525),
                  child: Divider(
                    endIndent: 79,
                    indent: 79,
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Pr_height * 0.550),
                  child: Center(
                    child: SizedBox(
                        width: Pr_width * .890,
                        child: TextFormField(
                          obscureText:
                              l_vmLogin.Pr_boolSecurePassword_wid.value,
                          controller: passswordController,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            hintStyle: const TextStyle(color: Colors.black26),
                            labelText: ' Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.white38)),
                            prefixIcon: const Icon(MdiIcons.fingerprint,
                                size: 20, color: Colors.indigo),
                            suffixIcon: togglepassword(),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Pr_height * 0.625),
                  child: Divider(
                    endIndent: 79,
                    indent: 79,
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Pr_height * 0.650),
                  child: Center(child: Text("Remember me")),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Pr_height * 0.631, left: Pr_width * .570),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Pr_height * 0.680),
                  child: Divider(
                    endIndent: 120,
                    indent: 120,
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Pr_height * 0.710),
                  child: Center(
                    child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () async {
                            await l_vmLogin.Fnc_ValidateLogin();
                            Get.to(() => VwCompany());
                          },
                          child: Text("Login"),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        //when tap anywhere on screen keyboard dismiss
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //Get device's screen height and width.
              double height = constraints.maxHeight;
              double width = constraints.maxWidth;

              if (width >= 300 && width < 500) {
                return _WidgetportraitMode(height, width);
              } else {
                return _WidgetportraitMode(height, width);
              }
            },
          );
        },
      ),
    );
  }
}
