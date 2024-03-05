import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesPage extends StatelessWidget {
  ArticlesPage({super.key});

  final List<Map<String, dynamic>> articles = [
    {
      'image': 'assets/Heart_Art.png',
      'title': 'The difference between Meditation and Mindfulness',
      'description': 'What they are and how they can affect your health.',
      'url': 'https://www.6seconds.org/2023/08/15/4-rules-on-remote-work-emotional-intelligence/',
    },
    {
      'image': 'assets/Sleep_Art.png',
      'title': 'Getting a Good Nights Sleep',
      'description': 'If you are having trouble sleeping, these tips may help.',
      'url': 'https://health.ucdavis.edu/blog/cultivating-health/better-sleep-why-its-important-for-your-health-and-tips-to-sleep-soundly/2023/03',
    },
    {
      'image': 'assets/Light_Art.png',
      'title': 'Why Time in Daylight is Important',
      'description': 'How sunlight and being outdoors can impact your health.',
      'url': 'https://www.healthline.com/health/health-benefits-of-being-outdoors#improved-sleep',
    },
    {
      'image': 'assets/Oxygen_Art.png',
      'title': 'Learn About Blood Oxygen Levels',
      'description': 'What they mean and why they are important to your health.', 
      'url': 'https://www.healthline.com/health/blood-oxygen',
    },
    {
      'image': 'assets/Cardio_Fitness_Art.png',
      'title': 'What it Means if Your Cardio Fitness Is Low',
      'description': 'And what you can do about it.',
      'url': 'https://www.healthline.com/health/cardio-fitness',
    },
    {
      'image': 'assets/Glucose_Art.png',
      'title': 'Understanding Blood Glucose',
      'description': 'What is is and how it can affect your body.',
      'url': 'https://www.healthline.com/health/blood-glucose',
    },
    {
      'image': 'assets/Hearing_Health_Art.png',
      'title': 'Why Hearing Health Matters',
      'description': 'Get insights into your hearing and how to look after it.',
      'url': 'https://www.healthline.com/health/hearing-health',
    },
    {
      'image': 'assets/Mood_Art.png',
      'title': 'The Difference Between Emotion and mood',
      'description': 'Learn about how emotions and moods can affect you.',
      'url': 'https://www.healthline.com/health/mood',
    },
    {
      'image': 'assets/Hand_Art.png',
      'title': 'Handwashing Can Protect Your Health',
      'description': 'Why it matters and tips for how to do it well.', 
      'url': 'https://www.healthline.com/health/hand-washing',
    },
  ];
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Articles'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        shadowColor: Colors.black87,
        surfaceTintColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return InkWell( // Use InkWell for tap detection
            onTap: () => _launchURL(articles[index]['url']), // Call _launchURL when tapped
            child: Card(
              margin: const EdgeInsets.all(8),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(articles[index]['image']!, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      articles[index]['title']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Text(
                      articles[index]['description']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}