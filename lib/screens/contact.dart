import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController _nameController, _emailController, _messageController;
  String name, email, message;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading ? _loading() : _form(),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Your name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Your email',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Enter your message',
            ),
            maxLines: 4,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please write your message';
              }
              return null;
            },
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  name = _nameController.text;
                  email = _emailController.text;
                  message = _messageController.text;

                  setState(() {
                    isLoading = true;
                  });
                  //TODO : loading , sent message
                }
              },
              child: Text(
                'Send Message',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
