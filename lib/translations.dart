class Translations {
  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      'welcomeBack': 'welcome back.',
      'userName': 'Olivai',
      'categories': 'Categories',
      'seeAll': 'See all',
      'newArrivals': 'New Arrivals',
      'brands': 'Brands',
      'recommended': 'Recommended for you',
      'blog': 'Blog',
    },
    'km': {
      'welcomeBack': 'សូមស្វាគមន៍វិញ។',
      'userName': 'Olivai',
      'categories': 'ប្រភេទ',
      'seeAll': 'មើល​ទាំងអស់',
      'newArrivals': 'ផលិតផលថ្មី',
      'brands': 'ម៉ាក',
      'recommended': 'ផ្ដល់អនុសាសន៍សម្រាប់អ្នក',
      'blog': 'ប្លុក',
    },
  };

  static String getText(String key, String locale) {
    return localizedValues[locale]?[key] ?? key;
  }
}
