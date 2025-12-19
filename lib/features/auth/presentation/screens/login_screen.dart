import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/config/routes/app_routes.dart';
import 'package:telecom_support_app/config/routes/routes_names.dart';
import 'package:telecom_support_app/core/extensions/size.dart';
import 'package:telecom_support_app/core/utils/app_colors.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/core/validator/validator_app.dart';
import 'package:telecom_support_app/core/widgets/custom_form_field.dart';
import 'package:telecom_support_app/features/auth/data/models/auth_model.dart';
import 'package:telecom_support_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telecom_support_app/features/auth/presentation/widgets/show_error_dialog.dart';

// ============ Account Login Success :

// pass => Ammar123@@dfdg
// email => ammar33@gmail.com
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            bloc.emailController.clear();
            bloc.passwordController.clear();
            goAndFinish(RoutesNames.layout);
          } else if (state is LoginErrorState) {
            showErrorDialog(context);
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Form(
                key: bloc.keyLogin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Icon(
                        CupertinoIcons.shield_lefthalf_fill,
                        size: 25.r,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 3.h),

                    Text(
                      AppStrings.telecomSupportKey,
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStrings.telecomSupportKeyDescLogin,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    CustomTextFormField(
                      hintText: AppStrings.emailLoginKey,
                      controller: bloc.emailController,
                      prefixIcon: const Icon(CupertinoIcons.mail, size: 22),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (email) =>
                          AppValidator.validateEmailAuth(context, email),
                    ),
                    SizedBox(height: 2.h),

                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (prev, curr) =>
                          curr is AuthChangePasswordVisibility,
                      builder: (context, state) {
                        return CustomTextFormField(
                          hintText: AppStrings.passwordKeyLogin,
                          controller: bloc.passwordController,
                          obscureText: bloc.obscure,
                          prefixIcon: const Icon(CupertinoIcons.lock, size: 22),
                          suffixIcon: IconButton(
                            onPressed: () => bloc.togglePasswordVisibility(),
                            icon: Icon(
                              bloc.obscure
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ),
                          validator: (password) =>
                              AppValidator.validatePasswordAuth(
                                context,
                                password,
                              ),
                        );
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgetPasswordKey,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,

                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 3.h),

                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (prev, curr) =>
                          curr is LoginLoadingState ||
                          curr is LoginErrorState ||
                          curr is LoginSuccessState,
                      builder: (context, state) {
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: state is LoginLoadingState
                                    ? null
                                    : () async {
                                        if (bloc.keyLogin.currentState!
                                            .validate()) {
                                          bloc.loginRequest(
                                            AuthModel(
                                              email: bloc.emailController.text
                                                  .trim(),
                                              password: bloc
                                                  .passwordController
                                                  .text
                                                  .trim(),
                                            ),
                                          );
                                        }
                                      },
                                child: state is LoginLoadingState
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        AppStrings.keyLoginBtn,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
