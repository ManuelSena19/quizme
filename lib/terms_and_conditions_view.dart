import 'package:flutter/material.dart';
import 'package:quizme_app_demo/constants/routes.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String terms = """
APPLICATION TERMS AND CONDITIONS
25 August 2022
In these terms and conditions, “we” “us” and “our” refers to Quizme GH. Your access to and use of all content on this application is provided subject to the following terms and conditions. The information is intended for residents of Ghana only.
We reserve the right to amend this notice at any time and your use of the application following any amendments will represent your agreement to be bound by these terms and conditions as amended. We therefore recommend that each time you use our application you read these terms and conditions.
Application Access
When you use our application, we give you a limited licence to access and use our information for personal use.
You are permitted to download a copy of the information on this application to your computer for your personal use only provided that you do not delete or change any copyright symbol, trade mark or other proprietary notice. Your use of our content in any other way infringes our intellectual property rights.
Except as permitted under the Copyright Act 690, you are not permitted to copy, reproduce, republish, distribute or display any of the information on this application without our prior written permission.
The licence to access and use the information on our application does not include the right to use any data mining robots or other extraction tools. The licence also does not permit you to mirror our application without our prior written permission. We reserve the right to serve you with notice if we become aware of your mirroring of our application.
Links
This application may from time to time contain links to other websites. Such links are provided for convenience only and we take no responsibility for the content and maintenance of or privacy compliance by any linked website. Any link on our application to another website does not imply our endorsement, support, or sponsorship of the operator of that website nor of the information and/or products which they provide.
Intellectual Property Rights
The copyright to all content on this application including applets, graphics, images, layouts and text belongs to us or we have a licence to use those materials.
All trade marks, brands and logos generally identified either with the symbols TM or ® which are used on this application are either owned by us or we have a licence to use them. Your access to our application does not license you to use those marks in any commercial way without our prior written permission.
Disclaimers
The information we provide on this application is of a general nature only. We are not providing professional advice and you should obtain professional or specialist advice that is appropriate to your circumstances and we give no warranty and accept no liability should you use the information without obtaining independent advice.
We give no warranty that the information is free from error or omission and you should use your own care and skill when accessing and using it.
To the extent permitted by law, any condition or warranty which would otherwise be implied into these terms and conditions is excluded.
We take all due care in ensuring that our application is free of any virus, worm, Trojan horse and/or malware, however we are not responsible for any damage to your computer system which arises in connection with your use of our application or any linked website.
From time to time we may host third party content on our website such as advertisements and endorsements belonging to other traders. Responsibility for the content of such material rests with the owner of that material and we are not responsible for any errors or omissions in such material.
Indemnity
By using our application, you agree to indemnify and hold us harmless from all claims, actions, damages, costs and expenses including legal fees arising from or in connection with your use of our application.
Jurisdiction
These terms and conditions are to be governed by and construed in accordance with the laws of Ghana and any claim made by either party against the other which in any way arises out of these terms and conditions will be heard in Ghana and you agree to submit to the jurisdiction of those Courts.
If any provision in these terms and conditions is invalid under any law the provision will be limited, narrowed, construed or altered as necessary to render it valid but only to the extent necessary to achieve such validity. If necessary the invalid provision will be deleted from these terms and conditions and the remaining provisions will remain in full force and effect.
Privacy
We undertake to take all due care with any information including Comments which you may provide to us when using our application. However we do not warrant and cannot ensure the security of any information which you may provide to us. Information you transmit to us is entirely at your own risk although we undertake to take reasonable steps to preserve such information in a secure manner.
    """;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Terms And Conditions'), backgroundColor: Colors.lightBlue),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(terms),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(homepageRoute);
                },
                child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'I Agree',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
