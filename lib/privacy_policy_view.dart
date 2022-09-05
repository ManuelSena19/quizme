import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String policy = """
This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.
If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.
The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at our terms and conditions page unless otherwise defined in this Privacy Policy.
Information Collection and Use
For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Quizme collecting your basic information and connection.. The information that I request will be retained on your device and is not collected by me in any way.
    """;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Privacy Policy'), backgroundColor: Colors.lightBlue),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(policy),
          ),
        ),
      ),
    );
  }
}
