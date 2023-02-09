import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_support/src/utils/color_default.dart';

class LoadingModule extends StatefulWidget {
  const LoadingModule({super.key});

  @override
  State<LoadingModule> createState() => _LoadingModuleState();
}

class _LoadingModuleState extends State<LoadingModule> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () => context.go("/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.whiteColor,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: ColorDefault.whiteColor,
          color: ColorDefault.primaryColor,
          strokeWidth: 5,
        ),
      ),
    );
  }
}