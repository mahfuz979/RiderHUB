class S {
  final String lang;
  const S(this.lang);

  String t(String key) => _data[lang]?[key] ?? _data['en']![key] ?? key;

  static const Map<String, Map<String, String>> _data = {
    'en': {
      'appName': 'RIDERHUB',
      'customer': 'Customer',
      'provider': 'Provider',
      'home': 'Home',
      'bookings': 'Bookings',
      'settings': 'Settings',
      'language': 'Language',
      'english': 'English',
      'bangla': 'বাংলা',
      'searchHint': 'Search services',
      'categories': 'Service categories',
      'noResults': 'No services found',
      'demoNotice':
          'Demo data only. No real bookings or payments exist in this build.',
      'availability':
          'Services are available only where approved local providers exist.',
      'comingSoon': 'Coming in a later milestone',
      'bookingsEmpty': 'You have no bookings yet.',
      'verification': 'Verification status',
      'notApproved': 'Not approved',
      'providerLocked':
          'You cannot accept jobs until an admin approves your account.',
      'acceptJobs': 'Accept jobs',
      'version': 'Version 0.1.0 (Milestone 1)',
      'cat_ac': 'AC servicing',
      'cat_electrician': 'Electrician',
      'cat_plumber': 'Plumber',
      'cat_cleaning': 'Cleaning',
      'cat_carpenter': 'Carpenter',
      'cat_painter': 'Painter',
      'cat_appliance': 'Appliance repair',
      'cat_pest': 'Pest control',
    },
    'bn': {
      'appName': 'RIDERHUB',
      'customer': 'গ্রাহক',
      'provider': 'সেবা প্রদানকারী',
      'home': 'হোম',
      'bookings': 'বুকিং',
      'settings': 'সেটিংস',
      'language': 'ভাষা',
      'english': 'English',
      'bangla': 'বাংলা',
      'searchHint': 'সেবা খুঁজুন',
      'categories': 'সেবার ধরন',
      'noResults': 'কোনো সেবা পাওয়া যায়নি',
      'demoNotice':
          'শুধু ডেমো তথ্য। এই সংস্করণে কোনো বাস্তব বুকিং বা পেমেন্ট নেই।',
      'availability':
          'আপনার এলাকায় অনুমোদিত স্থানীয় প্রদানকারী থাকলেই সেবা পাওয়া যাবে।',
      'comingSoon': 'পরবর্তী ধাপে আসছে',
      'bookingsEmpty': 'এখনো কোনো বুকিং নেই।',
      'verification': 'যাচাইকরণের অবস্থা',
      'notApproved': 'অনুমোদিত নয়',
      'providerLocked':
          'অ্যাডমিন অনুমোদন না দেওয়া পর্যন্ত আপনি কোনো কাজ গ্রহণ করতে পারবেন না।',
      'acceptJobs': 'কাজ গ্রহণ করুন',
      'version': 'সংস্করণ ০.১.০ (ধাপ ১)',
      'cat_ac': 'এসি সার্ভিসিং',
      'cat_electrician': 'ইলেকট্রিশিয়ান',
      'cat_plumber': 'প্লাম্বার',
      'cat_cleaning': 'পরিষ্কার-পরিচ্ছন্নতা',
      'cat_carpenter': 'কাঠমিস্ত্রি',
      'cat_painter': 'রং-মিস্ত্রি',
      'cat_appliance': 'যন্ত্রপাতি মেরামত',
      'cat_pest': 'পোকামাকড় নিয়ন্ত্রণ',
    },
  };
}
