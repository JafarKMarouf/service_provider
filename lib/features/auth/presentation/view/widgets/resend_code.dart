import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return TextButton(
              onPressed: () async {
                await cubit.resend();
              },
              child: Text(
                cubit.isResendAgain ? "s ${cubit.start}" : "إعادة الإرسال",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
        Text(
          "ألم تتلقى الكود ؟",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
