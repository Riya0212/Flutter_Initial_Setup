import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:{{name.lowerCase()}}/bloc/authentication/authentication_bloc.dart';
import 'package:{{name.lowerCase()}}/components/index.dart';
import 'package:{{name.lowerCase()}}/constants/index.dart';
import 'package:{{name.lowerCase()}}/navigation/app_navigation.dart';
import 'package:{{name.lowerCase()}}/constants/i18n/strings.g.dart';
import 'package:{{name.lowerCase()}}/pages/restart/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  AppLocale? selectedLanguage;
  var userBox = Hive.box(HiveKeys.userBox);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedLanguage = LocaleSettings.currentLocale;
  }

  void handleLangugeChange(context) {
    switch (selectedLanguage!) {
      case AppLocale.en:
        LocaleSettings.setLocale(AppLocale.en);
        break;
      case AppLocale.ar:
        LocaleSettings.setLocale(AppLocale.ar);
        break;
    }

    userBox.put(HiveKeys.appLanguage, selectedLanguage!.languageCode);
    Restart.restartApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
      if (state is AuthenticationSuccessState) {
        context.go(NAVIGATION.home);
      } else if (state is AuthenticationLoadingState) {
        setState(() {
          isLoading = state.isLoading;
        });
      } else if (state is AuthenticationFailureState) {
        print(state.errorMessage);
      }
    }, builder: (context, state) {
      final colors = Theme.of(context).colors;
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(t.login),
            backgroundColor: colors.customColor3,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: colors.iconBrightness)),
        body: Stack(children: [
          Column(
            children: [
              Container(
                color: colors.bg,
                child: Center(
                  child: ElevatedButton(
                    child: Text(t.login),
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context).add(
                          const SigninUser(
                              email: 'dhanraj.mahida@aliansoftware.com',
                              password: "Abc@223133"));
                    },
                  ),
                ),
              ),
              TextComponent(
                text: t.appLanguage,
                textStyle: TextStyle(color: colors.blackColor),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedLanguage = AppLocale.en;
                  });
                  handleLangugeChange(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: colors.blackColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextComponent(
                        text: t.english,
                        textStyle: TextStyle(color: colors.blackColor),
                      ),
                      selectedLanguage == AppLocale.en
                          ? Icon(
                              Icons.check,
                              color: colors.blackColor,
                              size: 20,
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedLanguage = AppLocale.ar;
                  });
                  handleLangugeChange(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: colors.blackColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextComponent(
                        text: t.arabic,
                        textStyle: TextStyle(color: colors.blackColor),
                      ),
                      selectedLanguage == AppLocale.ar
                          ? Icon(
                              Icons.check,
                              color: colors.blackColor,
                              size: 20,
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              width:
                  MediaQuery.of(context).size.width, // Full width of the screen
              height: MediaQuery.of(context)
                  .size
                  .height, // Full height of the screen
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ]),
      );
    });
  }
}
