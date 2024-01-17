import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  List<String> numbersList = ['-1', '-1', '-1', '-1'];

  double progressPercent() {
    var results = numbersList.where((element) => element != '-1');
    return results.length / numbersList.length;
  }

  @override
  Widget build(BuildContext context) {
    double percent = progressPercent();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF005C97),
              Color(0xFF363795),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white),
              );
            },
          ),
          title: const Text(
            'Verification Code',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Confirmation',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text:
                          'Please enter the code we sent to the number ********73.',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white.withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
                width: 250,
                child: CustomProgressIndicator(
                  percent: percent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomNumberForm(
                            onChange: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                setState(() => numbersList[0] = value);
                              } else {
                                setState(() => numbersList[0] = '-1');
                              }
                            },
                          ),
                          CustomNumberForm(
                            onChange: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                setState(() => numbersList[1] = value);
                              } else {
                                setState(() => numbersList[1] = '-1');
                              }
                            },
                          ),
                          CustomNumberForm(
                            onChange: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                setState(() => numbersList[2] = value);
                              } else {
                                setState(() => numbersList[2] = '-1');
                              }
                            },
                          ),
                          CustomNumberForm(
                            onChange: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                setState(() => numbersList[3] = value);
                              } else {
                                setState(() => numbersList[3] = '-1');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'RESEND CODE',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: numbersList.contains('-1') ? null : () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: numbersList.contains('-1')
                          ? Colors.white.withOpacity(0.6)
                          : Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNumberForm extends StatelessWidget {
  final Function(String) onChange;

  const CustomNumberForm({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextField(
        onChanged: onChange,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        cursorColor: Colors.white.withOpacity(0.5),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.05),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.8),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.lightBlue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class CustomProgressIndicator extends StatefulWidget {
  final double percent;
  const CustomProgressIndicator({Key? key, required this.percent})
      : super(key: key);

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.animateTo(widget.percent);
    return Stack(
      children: [
        Positioned.fill(
          child: CircularProgressIndicator(
            value: 1.0,
            color: Colors.white.withOpacity(0.05),
            strokeWidth: 40,
          ),
        ),
        Positioned.fill(
          child: CircularProgressIndicator(
            value: controller.value,
            color: Colors.white.withOpacity(0.9),
            strokeWidth: 40,
          ),
        ),
        Center(
          child: Text(
            '${(widget.percent * 100).toStringAsFixed(0)}%',
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        )
      ],
    );
  }
}
