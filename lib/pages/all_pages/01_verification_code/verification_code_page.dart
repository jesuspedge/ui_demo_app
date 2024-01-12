import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (state.isDesktop) {
                context.read<AppBloc>().add(const ChangePageSelectedEvent(
                    pageSelected: HomeMobilePage()));
              } else {
                Navigator.of(context).pop();
              }
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          );
        },
      ),
      title: const Text('Verification Code'),
    ));
  }
}
