import 'package:flutter/material.dart';

import '../../config.dart';

class PillarsOfIslamPageWidget extends StatelessWidget {
  const PillarsOfIslamPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().pillarsPageHeading),
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
                '1. Profession Of Faith (Shahada)',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'The belief that "There is no god but God, and Muhammad is the Messenger of God" is central to Islam. This phrase, written in Arabic, is often prominently featured in architecture and a range of objects, including the Qur\'an, Islam\'s holy book of divine revelations. One becomes a Muslim by reciting this phrase with conviction.',
                maxLines: 35,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '2. Prayer (Salat)',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Muslims pray facing Mecca five times a day: at dawn, noon, mid-afternoon, sunset, and after dark. Prayer includes a recitation of the opening chapter (sura) of the Qur\'an, and is sometimes performed on a small rug or mat used expressly for this purpose (see image 24). Muslims can pray individually at any location (fig. 1) or together in a mosque, where a leader in prayer (imam) guides the congregation. Men gather in the mosque for the noonday prayer on Friday; women are welcome but not obliged to participate. After the prayer, a sermon focuses on a passage from the Qur\'an, followed by prayers by the imam and a discussion of a particular religious topic.',
                maxLines: 35,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '3. Alms (Zakat)',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'In accordance with Islamic law, Muslims donate a fixed portion of their income to community members in need. Many rulers and wealthy Muslims build mosques, drinking fountains, hospitals, schools, and other institutions both as a religious duty and to secure the blessings associated with charity.',
                maxLines: 35,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '4. Fasting (Sawm)',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'During the daylight hours of Ramadan, the ninth month of the Islamic calendar, all healthy adult Muslims are required to abstain from food and drink. Through this temporary deprivation, they renew their awareness of and gratitude for everything God has provided in their lives—including the Qur\'an, which was first revealed during this month. During Ramadan they share the hunger and thirst of the needy as a reminder of the religious duty to help those less fortunate.',
                maxLines: 35,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '5. Pilgrimage (Hajj)',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Every Muslim whose health and finances permit it must make at least one visit to the holy city of Mecca, in present-day Saudi Arabia. The Ka\'ba, a cubical structure covered in black embroidered hangings, is at the center of the Haram Mosque in Mecca (fig. 2). Muslims believe that it is the house Abraham (Ibrahim in Arabic) built for God, and face in its direction (qibla) when they pray. Since the time of the Prophet Muhammad, believers from all over the world have gathered around the Ka\'ba in Mecca on the eighth and twelfth days of the final month of the Islamic calendar.',
                maxLines: 35,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
