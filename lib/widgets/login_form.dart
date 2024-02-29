import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _usernameController.text = "hello world";
    _usernameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _usernameController.text.length);
    _usernameController.addListener(() {
      print(_usernameController.text);
    });

    _passwordController.addListener(() {
      print(_passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              focusNode: focusNode1,
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '用户名不能为空';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              focusNode: focusNode2,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.lock),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '用户名不能为空';
                }
                return null;
              },
            ),
            Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Expanded(child: Builder(builder: (context) {
                  return ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("登录"),
                    ),
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        // if ((_formKey.currentState as FormState).validate()) {
                        print("校验通过");
                      }
                    },
                  );
                }))),
            ElevatedButton(
                onPressed: () {
                  focusScopeNode ??= FocusScope.of(context);
                  focusScopeNode!.requestFocus(focusNode2);
                  // focusNode1.fo
                },
                child: const Text('移动焦点')),
            ElevatedButton(
                onPressed: () {
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
                child: const Text('隐藏键盘'))
          ],
        ));
  }
}
