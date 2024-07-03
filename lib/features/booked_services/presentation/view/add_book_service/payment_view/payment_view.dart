import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 14, bottom: 24, right: 14),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(flex: 4, child: SizedBox()),
              const CustomeText(
                text: 'أدخل الرمز وقم بإضافة المبلغ',
                size: 18,
                fontFamily: 'Poppins Medium',
              ),
              const SizedBox(height: 24),
              const CustomeTextFormField(
                type: TextInputType.number,
                hintText: 'أدخل رقم/ رمز',
              ),
              const SizedBox(height: 12),
              const CustomeTextFormField(
                type: TextInputType.number,
                hintText: 'أدخل الرقم/ الرمز مجددا للتأكيد',
              ),
              const SizedBox(height: 12),
              const CustomeTextFormField(
                type: TextInputType.number,
                hintText: 'أدخل المبلغ',
              ),
              const SizedBox(height: 12),
              const CustomeTextFormField(
                type: TextInputType.number,
                hintText: 'أدخل المبلغ مجددا للتأكيد',
              ),
              const Expanded(flex: 3, child: SizedBox()),
              CustomButton(
                title: 'إتمام الدفع',
                width: MediaQuery.sizeOf(context).width,
                color: kPrimaryColor,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
