import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @Override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Sale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PropertyDetailsPage(),
    );
  }
}

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property for Sale in Ooty'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionTitle(context, '58 Cents Flat Tea Garden in Ooty'),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailItem(context, Icons.landscape, 'Land Size', '58 cents flat tea garden'),
                    _buildDetailItem(context, Icons.location_on, 'Location', '13 km away from Ooty, Nilgiris, Tamilnadu'),
                    _buildDetailItem(context, Icons.price_change, 'Price', '₹90,000 per cent (No negotiation)'),
                    _buildDetailItem(context, Icons.verified, 'Titles', 'Clear titles, single sign'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Key Features'),
            const SizedBox(height: 8),
            _buildFeatureList(),
            const SizedBox(height: 24),
             _buildSectionTitle(context, 'Nearby Amenities (within 1 km)'),
            const SizedBox(height: 8),
            _buildAmenitiesList(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Contact Details'),
            const SizedBox(height: 8),
            _buildContactCard(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Tags'),
            const SizedBox(height: 8),
            _buildHashtags(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDetailItem(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(value, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureList() {
    final features = [
      'Motorable road',
      'Water Source available',
      'High elevation with scenic views',
      'Suitable for Commercial use',
      'Subdivision property',
    ];
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: features.map((feature) => ListTile(
            leading: const Icon(Icons.check_circle, color: Colors.green),
            title: Text(feature),
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildAmenitiesList() {
    final amenities = [
      'Hospitality', 'Banking & ATM', 'Super market', 'Hotels', 'Schools', 'Medicals', 'Temple'
    ];
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: amenities.map((amenity) => Chip(
            avatar: const Icon(Icons.location_pin, size: 16),
            label: Text(amenity),
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mr. Suresh Kumar', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.blue),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('090479 55853'),
                  onPressed: () => _launchUrl('tel:09047955853'),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.phone_android, color: Colors.blue),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('8870855853'),
                  onPressed: () => _launchUrl('tel:8870855853'),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.email, color: Colors.red),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('vsureshkumar6681@gmail.com'),
                  onPressed: () => _launchUrl('mailto:vsureshkumar6681@gmail.com'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHashtags() {
    final hashtags = [
      '#hyderabad', '#bangalore', '#chennai', '#tirupur', '#trichi', 
      '#Coimbatorerealestate', '#ooty', '#mysore', '#pollachi', 
      '#sanjayrealestate', '#mumbai', '#delhi', '#erode', '#karur', 
      '#mettupalayam', '#Tirupati'
    ];
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: hashtags.map((tag) => Chip(label: Text(tag))).toList(),
    );
  }
}
