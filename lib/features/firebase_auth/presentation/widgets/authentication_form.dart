import 'package:flutter/material.dart';
import 'package:offside/constants/gradient_colors.dart';
import 'package:offside/utils/validation.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.newUser,
    required this.authFunction,
    this.confirmPasswordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final bool newUser;
  final VoidCallback authFunction;

  @override
  State<AuthenticationForm> createState() => _AuthenticationForm();
}

class _AuthenticationForm extends State<AuthenticationForm> {
  bool _secret = true;
  bool _confirmSecret = true;
  bool _remember = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //email text form filed
            Container(
              padding: const EdgeInsets.only(bottom: 4),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                  color: const Color(0xFF151515),
                  borderRadius: BorderRadius.circular(4.0)),
              child: TextFormField(
                validator: (value) {
                  return Validation.emailValidation(value);
                },
                controller: widget.emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: const Color(0xD8111111),
                decoration: const InputDecoration(
                  focusedErrorBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  border: InputBorder.none,
                  label: Text('Email'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                style: const TextStyle(color: Color(0xeceeeeff),),
              ),
            ),

            //password part
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                children: [
                  // password text form field
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                        color: const Color(0xFF151515),
                        borderRadius: BorderRadius.circular(4.0)),
                    child: TextFormField(
                      validator: (value) {
                        return Validation.passwordValidation(value);
                      },
                      obscureText: _secret,
                      controller: widget.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: const Color(0xD8111111),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _secret = !_secret;
                            });
                          },
                          child: Icon(_secret
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                        border: InputBorder.none,
                        label: const Text('Password'),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      style: const TextStyle(color: Color(0xeceeeeff)),
                    ),
                  ),

                  //remember checkbox and forget link
                  if (widget.newUser == false) ...{
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _remember = !_remember;
                            });
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                    activeColor: const Color(0xFF656565),
                                    value: _remember,
                                    onChanged: (v) {
                                      setState(() {
                                        _remember = v!;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text('Remeber me',
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), height: 1.5)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              height: 1.5,
                            ),
                          ),
                        )
                      ],
                    ),
                  },
                ],
              ),
            ),

            //password confirmation text field
            if (widget.newUser == true)
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                    color: const Color(0xFF151515),
                    borderRadius: BorderRadius.circular(4.0)),
                child: TextFormField(
                  obscureText: _confirmSecret,
                  controller: widget.confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: const Color(0xD8111111),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _confirmSecret = !_confirmSecret;
                        });
                      },
                      child: Icon(_confirmSecret
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                    ),
                    border: InputBorder.none,
                    label: const Text('Confirm Password'),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: const TextStyle(color: Color(0xeceeeeff)),
                  validator: (value) {
                    return Validation.confirmationValidation(value, widget.passwordController.text);
                  },
                ),
              ),

            //sign in or sign up button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  gradient: multiColorGrad
              ),
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.authFunction();
                  }
                },
                child: Text(
                  widget.newUser == true ? 'SIGN UP' : 'SIGN IN',
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
