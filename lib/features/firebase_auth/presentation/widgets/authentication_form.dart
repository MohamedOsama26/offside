import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
   const AuthenticationForm(
      {Key? key,
      required this.emailController,
      required this.passwordController,
        required this.newUser,
        required this.authFunction,
        this.confirmPasswordController,
})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
              color: const Color(0xFF151515),
              borderRadius: BorderRadius.circular(4.0)),
          child: TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: const Color(0xD8111111),
            decoration: const InputDecoration(
              border: InputBorder.none,
              label: Text('Email'),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            style: const TextStyle(color: Color(0xeceeeeff)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: [
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                decoration: BoxDecoration(
                    color: const Color(0xFF151515),
                    borderRadius: BorderRadius.circular(4.0)),
                child: TextFormField(
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: const TextStyle(color: Color(0xeceeeeff)),
                ),
              ),
              if(widget.newUser == false)
              const SizedBox(
                height: 12.0,
              ),
              if(widget.newUser == false)
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
            ],
          ),
        ),
        if(widget.newUser == true)
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
              color: const Color(0xFF151515),
              borderRadius: BorderRadius.circular(4.0)),
          child: TextFormField(
            obscureText: _confirmSecret,

            controller: widget.confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: const Color(0xD8111111),
            decoration:  InputDecoration(
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
              label: Text('Confirm Password'),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            style: const TextStyle(color: Color(0xeceeeeff)),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ],
              )),
          child: TextButton(
            onPressed:
              widget.authFunction
            ,
            child: Text(
              widget.newUser == true? 'SIGN UP' : 'SIGN IN',
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        )
      ],
    );
  }
}
