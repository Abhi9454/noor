import 'package:flutter/material.dart';

import '../../config.dart';

class AboutPageWidget extends StatelessWidget {
  const AboutPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().aboutPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Bismillah Al-Rahman Al-Rahim',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
                color: Colors.black45,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'The Holy Quran Puts The Highest Emphasis On The Importance Of Acquiring Knowledge. Knowledge Is A Prerequisite For The Creation Of A Just World In Which Authentic Peace Can Prevail. It Remains A Duty On All Muslims To Strive For Knowledge – Islam Encourages And Promotes The Idea Of Learning, Asking Questions, And Striving To Better Oneself Through Acquiring Knowledge. The Prophet Muhammad (Saws) Is Famously Reported To Have Said “You Must Seek Knowledge From Birth Till Death”. To Be On The Right Path One Requires The Right Guidance. We Must Actively Learn And Obtain Knowledge To Truly Understand The Greatness And Oneness Of Allah – Which Will Help Us Stand Firm On The Path Of Righteousness.Noor-E-Mahdavia Is An Application Which Aims To Provide Authenticate Religious Knowledge And Guidance To All The Mahdavi Brothers And Sisters Residing In India And All Over The World. To Keep Everyone Connected With Mahdaviyat, Our Team Has Focused On Providing Our Community With The Best Of Features Which Are Helpful In Completing The Daily Islamic Activities Such As Reminders For The Timings Of Namaz And Zikr, Location Access Of The Various Mahdaviyah Dairah’s And Masajid’s With A GPS Navigation Followed By All The Mahdaviyah Events And Much More.',
                maxLines: 40,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Now Let Us Explore The Features Of Our Application',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Following Below Are The Various Features That Are Available To The Users On Their Laptops And Smartphones To Ease Their Tasks And Provide A Better Understanding Of Mahdaviyat.',
                maxLines: 20,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'Namaz And Zikr Timings With Reminders.',
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'A Qibla Locator Is Always Ready To Help The Users Face The Right Direction For Namaz.',
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'A Calendar That Shows Community Events Such As Bahr-E-Aam And Urs Of Buzurgaan-E-Deen With Event Reminder Notification.',
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'A Dedicated Feature That Offers Users To Add Personal Events In The Calendar With Reminder Notifications.',
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'An Interactive Map Showing Locations Of Mahdavia Dairah\'s And Masjids Along With Gps Navigations For All Locations.',
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'A Section To Find The Best Books, Quotes, Photos, And Videos Related To The Community.',
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'A Separate Section With Details Of Other Mahdavia Organisations To Stay Connected.',
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'A Dedicated Ask Us Section For The Users To Clarify Any Doubts Related To Islam And Mahdaviyat.',
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: MyBullet(),
                title: Text(
                  'An Exclusive Mahdavia E-Store For Purchasing Mahdavia Books, Calenders , Taqweem , Tasbeeh Frames And Other Related Items.',
                  maxLines: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.02,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
