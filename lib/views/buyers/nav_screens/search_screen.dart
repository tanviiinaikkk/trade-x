import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'FAQs',
          style: TextStyle(
            color: Colors.yellow.shade900,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              cursorColor: Colors.yellow.shade900,

              onChanged: (value) {
                setState(() {
                  _searchText = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search FAQs',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(color: Colors.yellow.shade900),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildFAQs(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFAQs() {
    List<Widget> faqWidgets = [];

    for (var faq in faqsList) {
      if (_searchText.isEmpty ||
          faq.question.toLowerCase().contains(_searchText)) {
        faqWidgets.add(
          FAQItem(
            question: faq.question,
            answer: faq.answer,
          ),
        );
        faqWidgets.add(const SizedBox(height: 20));
      }
    }

    if (faqWidgets.isEmpty) {
      faqWidgets.add(
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'No FAQs found for "$_searchText"',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return faqWidgets;
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style:  TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.yellow.shade900,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}

// FAQ data model
class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}

// List of FAQs
List<FAQ> faqsList = [
  FAQ(
    question: 'How do I create an account?',
    answer:
    'Typically, theres a "Sign Up" or "Register" option on the apps main screen. Users can click on it and provide necessary information like email, name, and password to create an account.',
  ),
  FAQ(
    question: 'Is my payment information secure?',
    answer:'Yes, most eCommerce apps use secure payment gateways and encryption methods to protect users payment information. You can trust the apps security measures for safe transactions.' ),
  FAQ(
    question: 'How can I track my order?',
    answer: 'After placing an order, you can usually track its status by going to the "Orders" or "My Account" section of the app. There, you will find information about your orders processing, shipping, and delivery status.'
    ),
  FAQ(
    question: 'What if I want to return an item?',
    answer: 'eCommerce apps typically have a return policy outlined in their terms and conditions. If you are unsatisfied with your purchase, you can initiate a return request through the app within a specified time frame.',
  ),
  FAQ(
    question: 'Are there any discounts or promotions available?',
    answer:
    'Yes, eCommerce apps often run promotions, discounts, and sales events. You can check the apps homepage, subscribe to newsletters, or follow their social media channels to stay updated on current offers.'),
  FAQ(
    question: 'How do I contact customer support?',
    answer:
   'Most eCommerce apps have a "Contact Us" or "Support" section where you can find options to reach out for assistance. This may include email, phone support, live chat, or a help center.'),
  FAQ(
    question: 'Can I save items for later?',
    answer: 'Yes, you can usually add items to your wishlist or save them to your cart for later purchase. This allows you to keep track of items you are interested in without immediately making a purchase.',
  ),
  FAQ(
    question: 'Do you offer international shipping?',
    answer:
    'Some eCommerce apps provide international shipping options, while others may only ship within certain regions or countries. You can check the apps shipping policy or contact support for specific information.',
  ),
  FAQ(
    question: 'How do I update my account information?',
    answer:
    'You can usually update your account information, such as shipping address or payment methods, in the "My Account" or "Profile" section of the app. Look for options to edit your details there.'),
  FAQ(
    question: 'Is there a loyalty program or rewards system?',
    answer: 'Some eCommerce apps offer loyalty programs where you can earn points or rewards for making purchases. These rewards can often be redeemed for discounts or special offers on future purchases.'),
];