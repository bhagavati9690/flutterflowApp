import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? esText = '',
  }) =>
      [enText, hiText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // VenueDetails
  {
    'tz07g3fc': {
      'en': 'Photo',
      'es': 'Foto',
      'hi': 'तस्वीर',
    },
    'ou3iysdx': {
      'en': 'Video',
      'es': 'Video',
      'hi': 'वीडियो',
    },
    '5rpx7iu5': {
      'en': 'Map',
      'es': 'Mapa',
      'hi': 'नक्शा',
    },
    '4fj1qov3': {
      'en': 'Inquiry to Book',
      'es': 'Consulta para reservar',
      'hi': 'बुक करने के लिए पूछताछ',
    },
    'ri2t8769': {
      'en': 'Start a conversation',
      'es': 'Consulta para reservar',
      'hi': 'बुक करने के लिए पूछताछ',
    },
    'g6bet4uk': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'hi': 'ईमेल',
    },
    'd6zbo7m7': {
      'en': 'Call',
      'es': 'Llamar',
      'hi': 'पुकारना',
    },
    'wld6se15': {
      'en': 'Website',
      'es': 'Sitio web',
      'hi': 'वेबसाइट',
    },
    'jyncwfhp': {
      'en': 'About this Venue',
      'es': 'Descripción',
      'hi': 'विवरण',
    },
    'h8952zzu': {
      'en': 'Available On : ',
      'es': '',
      'hi': '',
    },
    '8lgz6rw0': {
      'en': 'Category : ',
      'es': '',
      'hi': '',
    },
    '2kgcxe1b': {
      'en': 'Activities : ',
      'es': '',
      'hi': '',
    },
    't4bgy6lj': {
      'en': 'Accomodates  ',
      'es': '',
      'hi': '',
    },
    'oue0fcsm': {
      'en': 'Suitable For ',
      'es': '',
      'hi': '',
    },
    '00kr092q': {
      'en': '....',
      'es': '',
      'hi': '',
    },
    'g9noqt5e': {
      'en': 'Package',
      'es': 'Paquete',
      'hi': 'पैकेट',
    },
    'mo9ce7pl': {
      'en': ' People',
      'es': '',
      'hi': '',
    },
    'urc08pom': {
      'en': 'View  Package',
      'es': 'Seleccionar paquete',
      'hi': 'पैकेज चुनें',
    },
    'mgnc8ota': {
      'en': 'Hall/Space',
      'es': 'Pasillo/Espacio',
      'hi': 'हॉल/स्पेस',
    },
    'gzuo7jhk': {
      'en': 'View  Space',
      'es': 'Seleccionar espacio/sala',
      'hi': 'स्थान/हॉल चुनें',
    },
    'unaq1nbv': {
      'en': 'Amenities',
      'es': 'Comodidades',
      'hi': 'सुविधाएं',
    },
    'jcwc5kzn': {
      'en': 'Hours',
      'es': 'Horas',
      'hi': 'घंटे',
    },
    'ahcpn0fk': {
      'en': 'Regular Hours',
      'es': 'Horario regular',
      'hi': 'नियमित घंटे',
    },
    'zuh9i37z': {
      'en': 'Celebration Hours',
      'es': 'Horas de celebración',
      'hi': 'उत्सव के घंटे',
    },
    'gb5rb2h9': {
      'en': 'Payment',
      'es': 'Pago',
      'hi': 'भुगतान',
    },
    '4rpodpsk': {
      'en': 'Delivery Info',
      'es': 'Comodidades',
      'hi': 'सुविधाएं',
    },
    'moowkiiv': {
      'en': 'Review & Rating',
      'es': 'Reseña y calificación',
      'hi': 'समीक्षा और रेटिंग',
    },
    '3xtz8037': {
      'en': 'Booking Policies',
      'es': 'Políticas de reserva',
      'hi': 'बुकिंग नीतियाँ',
    },
    'ebx7xjby': {
      'en': 'Documents',
      'es': 'Documentos',
      'hi': 'दस्तावेज़',
    },
    'phxukwyb': {
      'en': 'Frequently Asked Questions',
      'es': 'Preguntas frecuentes',
      'hi': 'अक्सर पूछे जाने वाले प्रश्नों',
    },
    '1yy9xdto': {
      'en': 'Awards',
      'es': 'Premios',
      'hi': 'पुरस्कार',
    },
    'kiwp8b0o': {
      'en': 'Similar',
      'es': 'Similar',
      'hi': 'समान',
    },
    'w3x6ciwf': {
      'en': 'Similar',
      'es': 'Similar',
      'hi': 'समान',
    },
    '21igywad': {
      'en': 'Error: Failed to load data ',
      'es': '',
      'hi': '',
    },
    'ra837h5t': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // allVenue
  {
    'awh4mr7s': {
      'en': 'Search',
      'es': 'Buscar',
      'hi': 'खोज',
    },
    'etyu5c0t': {
      'en': 'Search for venues...',
      'es': 'Buscar lugares...',
      'hi': 'स्थानों की खोज करें...',
    },
    'vtld1taw': {
      'en': 'Place/Activity',
      'es': 'Lugar/Actividad',
      'hi': 'स्थान/गतिविधि',
    },
    'p9ak7f59': {
      'en': 'Sort By',
      'es': 'Ordenar por',
      'hi': 'इसके अनुसार क्रमबद्ध करें',
    },
    'nsjoltf1': {
      'en': 'Filters',
      'es': '',
      'hi': '',
    },
    'wvoz2au3': {
      'en': 'Venues',
      'es': 'Lugares',
      'hi': 'स्थानों',
    },
  },
  // mapPOC
  {
    '8q5dglsd': {
      'en': 'Page Title',
      'es': '',
      'hi': 'पृष्ठ शीर्षक',
    },
    'byml9dwi': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // locationSerchbarPOC
  {
    'qn349zjb': {
      'en': '   Country:',
      'es': '',
      'hi': 'देश:',
    },
    'u0c15qdl': {
      'en': 'Place: ',
      'es': '',
      'hi': 'जगह:',
    },
    'zafqwat1': {
      'en': 'PinCode :',
      'es': '',
      'hi': 'पिन कोड :',
    },
    '6wrsmq5d': {
      'en': 'Label here...',
      'es': '',
      'hi': 'यहां लेबल करें...',
    },
    'uyzueiio': {
      'en': 'Location Test',
      'es': '',
      'hi': 'स्थान परीक्षण',
    },
    'izqscdyd': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // singleMapPOC
  {
    'qjaabiz5': {
      'en': 'Page Title',
      'es': '',
      'hi': 'पृष्ठ शीर्षक',
    },
    'w7z7dm8z': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // venuePackageDetails
  {
    '5mp10rho': {
      'en': 'No of People',
      'es': '',
      'hi': 'लोगों की संख्या',
    },
    '0x8qx2hb': {
      'en': 'Duration',
      'es': '',
      'hi': 'अवधि',
    },
    'aazjmutd': {
      'en': 'Activites',
      'es': '',
      'hi': 'गतिविधियों',
    },
    'grj2gwma': {
      'en': 'About this package',
      'es': '',
      'hi': 'विवरण',
    },
    'm7kbul5m': {
      'en': 'This is Packge for ',
      'es': '',
      'hi': 'यह पैकेज है',
    },
    'kc8kf467': {
      'en': 'Min Deposite',
      'es': '',
      'hi': 'न्यूनतम जमा',
    },
    'ogafqw13': {
      'en': 'Max Persons',
      'es': '',
      'hi': 'अधिकतम व्यक्ति',
    },
    '8mh12j86': {
      'en': 'Max Duration',
      'es': '',
      'hi': 'अधिकतम अवधि',
    },
    'p7odjlqb': {
      'en': 'Min Duration',
      'es': '',
      'hi': 'न्यूनतम अवधि',
    },
    'aau30g6l': {
      'en': 'Suitable for',
      'es': '',
      'hi': 'के लिए उपयुक्त',
    },
    'vkc0315b': {
      'en': 'Age range',
      'es': '',
      'hi': 'के लिए उपयुक्त',
    },
    'wesbe7g2': {
      'en': 'Add on',
      'es': '',
      'hi': 'ऐड ऑन',
    },
    'xlmwbmz7': {
      'en': 'Favors',
      'es': '',
      'hi': 'एहसान',
    },
    'ehf46v3p': {
      'en': 'Variation',
      'es': '',
      'hi': 'उतार-चढ़ाव',
    },
    '0x586o19': {
      'en': 'Available Hours',
      'es': '',
      'hi': 'परिचालन घंटे',
    },
    '7160tr9d': {
      'en': 'Add to Cart',
      'es': '',
      'hi': 'कार्ट में जोड़ें',
    },
    'ggy55j44': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // Login
  {
    '98gl2j1x': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // venueSpaceDetails
  {
    't4qvadfk': {
      'en': 'Capacity',
      'es': '',
      'hi': 'क्षमता',
    },
    'dls2hu5u': {
      'en': 'Seating Capacity',
      'es': '',
      'hi': 'बैठने की क्षमता',
    },
    'qmlsrc5f': {
      'en': 'Time',
      'es': '',
      'hi': 'समय',
    },
    '53i9a5uz': {
      'en': 'Standing Capacity',
      'es': '',
      'hi': 'खड़े होने की क्षमता',
    },
    'gugzgy9z': {
      'en': 'Minimum Person',
      'es': '',
      'hi': 'न्यूनतम व्यक्ति',
    },
    '1im9d2hd': {
      'en': 'Minimum Time',
      'es': '',
      'hi': 'न्यूनतम समय',
    },
    '9zlsrsnv': {
      'en': 'Maximum Time',
      'es': '',
      'hi': 'अधिकतम समय',
    },
    '4bxh8jj4': {
      'en': 'About this space',
      'es': '',
      'hi': 'विवरण',
    },
    'gcfn1dwb': {
      'en': 'Amenities',
      'es': '',
      'hi': 'सुविधाएं',
    },
    'pv7l6iz7': {
      'en': 'Features',
      'es': '',
      'hi': 'सुविधाएँ',
    },
    'x8cs872e': {
      'en': 'Stove/Oven Use',
      'es': '',
      'hi': 'स्टोव/ओवन का उपयोग',
    },
    'iq9die6z': {
      'en': 'Available Hours',
      'es': '',
      'hi': 'परिचालन घंटे',
    },
    '6uyeuglu': {
      'en': 'Days and available Time',
      'es': '',
      'hi': '',
    },
    'k0slxgvk': {
      'en': 'Configration',
      'es': '',
      'hi': 'परिचालन घंटे',
    },
    'eyvqxmdu': {
      'en': 'Days and available Time',
      'es': '',
      'hi': '',
    },
    'fif222mg': {
      'en': 'Minimum Capacity :',
      'es': '',
      'hi': '',
    },
    'g71sg9d7': {
      'en': 'Maximum Capacity :',
      'es': '',
      'hi': '',
    },
    'ta2ot8xq': {
      'en': 'Maximum Teables :',
      'es': '',
      'hi': '',
    },
    '2plkqh66': {
      'en': 'Person per table :',
      'es': '',
      'hi': '',
    },
    'pe3e5ne6': {
      'en': 'Variation',
      'es': '',
      'hi': 'उतार-चढ़ाव',
    },
    'dny3z5tk': {
      'en': 'Add to Cart',
      'es': '',
      'hi': 'कार्ट में जोड़ें',
    },
    'h4ium7xd': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // ForgotPassword
  {
    'mouccr9f': {
      'en': 'Forgot Password',
      'es': '',
      'hi': 'पासवर्ड भूल गए',
    },
    'dx8goma3': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'es': '',
      'hi':
          'हम आपको अपना पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबद्ध ईमेल दर्ज करें।',
    },
    'e25uc9da': {
      'en': '',
      'es': '',
      'hi': 'आपका ईमेल पता...',
    },
    'ibdmat1l': {
      'en': 'Enter your Email...',
      'es': '',
      'hi': 'अपना ईमेल दर्ज करें...',
    },
    '3twfcy9p': {
      'en': 'Send Link',
      'es': '',
      'hi': 'लिंक भेजें',
    },
    'jfu32tfj': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // myProfile
  {
    't4sgo31a': {
      'en': 'Edit',
      'es': '',
      'hi': '',
    },
    '5uhk9gjk': {
      'en': 'Change Password',
      'es': '',
      'hi': '',
    },
    '8yuw1sn0': {
      'en': 'More Information',
      'es': '',
      'hi': '',
    },
    'k7yraapf': {
      'en': 'Alternate Email',
      'es': '',
      'hi': '',
    },
    '1igtwq9x': {
      'en': 'Alternate Phone',
      'es': '',
      'hi': '',
    },
    'i95mjivz': {
      'en': 'website',
      'es': '',
      'hi': '',
    },
    'w7rmhhvw': {
      'en': 'Education',
      'es': '',
      'hi': '',
    },
    'sw8thb1a': {
      'en': 'Interests',
      'es': '',
      'hi': '',
    },
    'kww405vr': {
      'en': 'Comment',
      'es': '',
      'hi': '',
    },
    'smuy6un3': {
      'en': 'Edit Profile',
      'es': '',
      'hi': '',
    },
    '55ep9s5d': {
      'en': 'Family',
      'es': '',
      'hi': '',
    },
    '386jmdul': {
      'en': 'Friends',
      'es': '',
      'hi': '',
    },
    'v5brh2t7': {
      'en': 'Profile Details',
      'es': '',
      'hi': '',
    },
    'wwocylv5': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // myAccount
  {
    'wh6fp6vk': {
      'en': 'Account',
      'es': '',
      'hi': 'खाता',
    },
  },
  // ResetPassword
  {
    'ypzwridp': {
      'en': 'Reset Password',
      'es': '',
      'hi': 'पासवर्ड रीसेट',
    },
    'ew9nhahz': {
      'en': 'New Password',
      'es': '',
      'hi': 'नया पासवर्ड',
    },
    'n8wdacqr': {
      'en': 'Enter password',
      'es': '',
      'hi': 'पास वर्ड दर्ज करें',
    },
    'tmhw2r5y': {
      'en': 'Retype Password',
      'es': '',
      'hi': 'पासवर्ड फिर से लिखें',
    },
    'z8koeo0t': {
      'en': 'Enter password',
      'es': '',
      'hi': 'पास वर्ड दर्ज करें',
    },
    'ywqtced9': {
      'en': 'Reset',
      'es': '',
      'hi': 'रीसेट करें',
    },
    '7max7ckj': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // myEvents
  {
    '4rslytqk': {
      'en': 'My Events',
      'es': '',
      'hi': 'मेरी घटनाएँ',
    },
    'axj2xhqb': {
      'en': 'Basic ',
      'es': '',
      'hi': '',
    },
    'xyvj29ek': {
      'en': 'Create',
      'es': '',
      'hi': '',
    },
    'noz35pxv': {
      'en': 'Celebratee Information',
      'es': '',
      'hi': '',
    },
    'gnpbigsr': {
      'en': 'Event Details',
      'es': '',
      'hi': '',
    },
    'nmtpd8sq': {
      'en': 'Theme:',
      'es': '',
      'hi': '',
    },
    'qaxxujio': {
      'en': 'Theme Category:',
      'es': '',
      'hi': '',
    },
    'b6na3d1t': {
      'en': 'Event Status:',
      'es': '',
      'hi': '',
    },
    'f5jbw2s0': {
      'en': 'Budget Details',
      'es': 'Detalles financieros',
      'hi': 'वित्तीय विवरण',
    },
    '84ibd60q': {
      'en': 'Budget:',
      'es': '',
      'hi': '',
    },
    '9vmaykt4': {
      'en': 'Total Cost:',
      'es': '',
      'hi': '',
    },
    'uorcsty8': {
      'en': 'Alternative Dates',
      'es': '',
      'hi': '',
    },
    '3mbgvpg3': {
      'en': 'Date 1:',
      'es': '',
      'hi': '',
    },
    'qx1mcarh': {
      'en': 'Date 2:',
      'es': '',
      'hi': '',
    },
    'fbnxrzft': {
      'en': 'Description',
      'es': '',
      'hi': 'विवरण',
    },
    'v02xduyk': {
      'en': 'Add New Event',
      'es': '',
      'hi': '',
    },
    'g2ktetqn': {
      'en': 'Guests',
      'es': '',
      'hi': '',
    },
    'mu74a1r3': {
      'en': 'Add Guest',
      'es': '',
      'hi': '',
    },
    'cxz0qabj': {
      'en': 'Add from Contacts',
      'es': '',
      'hi': '',
    },
    'mo1t1nmj': {
      'en': 'Add New Event',
      'es': '',
      'hi': '',
    },
    'yvciijdt': {
      'en': 'Requests',
      'es': '',
      'hi': '',
    },
    '83u2txfz': {
      'en': 'Loading .....',
      'es': '',
      'hi': '',
    },
    'huuz1k6z': {
      'en': 'Package ',
      'es': '',
      'hi': '',
    },
    '9s2l280i': {
      'en': '(',
      'es': '',
      'hi': '',
    },
    '6wf69mtk': {
      'en': ')',
      'es': '',
      'hi': '',
    },
    'ew8h457q': {
      'en': 'Halls / Rooms ',
      'es': '',
      'hi': '',
    },
    '6u4vck9j': {
      'en': ' (',
      'es': '',
      'hi': '',
    },
    'y5ob7ke8': {
      'en': ')',
      'es': '',
      'hi': '',
    },
    'kpt7x268': {
      'en': 'Rental',
      'es': '',
      'hi': '',
    },
    'biesbxip': {
      'en': ' (',
      'es': '',
      'hi': '',
    },
    '07g0vkhe': {
      'en': ')',
      'es': '',
      'hi': '',
    },
    'eq1mp4kv': {
      'en': 'Service',
      'es': '',
      'hi': '',
    },
    'fnka7fh3': {
      'en': ' (',
      'es': '',
      'hi': '',
    },
    'f9ehzf9x': {
      'en': ')',
      'es': '',
      'hi': '',
    },
    'bo11agx4': {
      'en': 'Cake',
      'es': '',
      'hi': '',
    },
    '5723e3u0': {
      'en': ' (',
      'es': '',
      'hi': '',
    },
    'c9tqgxo5': {
      'en': ')',
      'es': '',
      'hi': '',
    },
    'xxxyvs5w': {
      'en': 'Food',
      'es': '',
      'hi': '',
    },
    'd0vbwcfk': {
      'en': ' (',
      'es': '',
      'hi': '',
    },
    '7q8cepy2': {
      'en': ')',
      'es': '',
      'hi': '',
    },
    '199dhhax': {
      'en': 'Activity',
      'es': '',
      'hi': '',
    },
    'mxncw5io': {
      'en': ' (',
      'es': '',
      'hi': '',
    },
    '7zqi8snk': {
      'en': ')',
      'es': '',
      'hi': '',
    },
    'h30lrim0': {
      'en': 'Product',
      'es': '',
      'hi': '',
    },
    'zarsbz21': {
      'en': ' (',
      'es': '',
      'hi': '',
    },
    '6q44z3pd': {
      'en': ')',
      'es': '',
      'hi': '',
    },
    't582cdop': {
      'en': 'Add New Event',
      'es': '',
      'hi': '',
    },
    'k9fgx7b5': {
      'en': 'Sign in to see information related to event',
      'es': '',
      'hi': '',
    },
    '2z2bczfe': {
      'en': 'LogIn',
      'es': '',
      'hi': '',
    },
    'lhbgbiht': {
      'en': 'Events',
      'es': '',
      'hi': 'घटनाक्रम',
    },
  },
  // venueSearch
  {
    'ria3w4ak': {
      'en': 'Search Party Venues',
      'es': '',
      'hi': 'अपना स्थान खोजें',
    },
    'p8bn7csm': {
      'en': 'Search',
      'es': '',
      'hi': 'खोज',
    },
  },
  // AllSearch
  {
    '19seuxap': {
      'en': '   Venue   ',
      'es': '',
      'hi': 'कार्यक्रम का स्थान',
    },
    'q5h2cfda': {
      'en': '   Rental   ',
      'es': '',
      'hi': 'किराये',
    },
    '1vxth40r': {
      'en': 'Entertainer',
      'es': '',
      'hi': 'मनोरंजन',
    },
    'o67c0wog': {
      'en': '    Cake    ',
      'es': '',
      'hi': 'केक',
    },
    'ya63k1ut': {
      'en': 'Search',
      'es': '',
      'hi': 'खोज',
    },
    'lm9ptm88': {
      'en': 'Search',
      'es': '',
      'hi': 'खोज',
    },
  },
  // anonymousLoginGuestUI
  {
    'ilb0jwzy': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // GuestForm
  {
    '4lkldghl': {
      'en': '*',
      'es': '',
      'hi': '',
    },
    'xjsjh6ph': {
      'en': 'Guest Type',
      'es': '',
      'hi': '',
    },
    'go0ttsu2': {
      'en': 'First Name',
      'es': '',
      'hi': '',
    },
    'jhk5ki40': {
      'en': '*',
      'es': '',
      'hi': '',
    },
    '7mv7bzkt': {
      'en': 'Last Name',
      'es': '',
      'hi': '',
    },
    'h0yhul87': {
      'en': 'Gender',
      'es': '',
      'hi': '',
    },
    '6pn7yjyz': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'xznv6q00': {
      'en': 'Male',
      'es': '',
      'hi': '',
    },
    'q6bh20br': {
      'en': 'Female',
      'es': '',
      'hi': '',
    },
    't5cmo78i': {
      'en': 'mobile Number',
      'es': '',
      'hi': '',
    },
    'zlkc2k4h': {
      'en': 'your Email',
      'es': '',
      'hi': '',
    },
    'fa7gk2sj': {
      'en': 'More Details',
      'es': '',
      'hi': '',
    },
    'j7a9ms0j': {
      'en': 'Friend of',
      'es': '',
      'hi': '',
    },
    'qabonzrk': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    '0rx5u1a6': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '464bmxzy': {
      'en': 'Relation',
      'es': '',
      'hi': '',
    },
    'uev4jvdg': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    'kh391bcy': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '93hma5bo': {
      'en': 'Education',
      'es': '',
      'hi': '',
    },
    't56s46c9': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    '57t616eu': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '6wj7ra6m': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'x2kdex5e': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'tjf0x0nk': {
      'en': 'Alternate Contact Number',
      'es': '',
      'hi': '',
    },
    'g73xbr5l': {
      'en': 'Contact Number',
      'es': '',
      'hi': '',
    },
    '861zophb': {
      'en': 'Age',
      'es': '',
      'hi': '',
    },
    'n0cb3hze': {
      'en': 'Date of Birth',
      'es': '',
      'hi': '',
    },
    '6tsre6p7': {
      'en': 'Date of Birth',
      'es': '',
      'hi': '',
    },
    't2s1mqnl': {
      'en': 'Street Address',
      'es': '',
      'hi': '',
    },
    'j8pyn9hq': {
      'en': 'Building Number',
      'es': '',
      'hi': '',
    },
    '1epdljlp': {
      'en': 'Postal Code',
      'es': '',
      'hi': '',
    },
    '0fbsu90e': {
      'en': 'Floor/Section',
      'es': '',
      'hi': '',
    },
    'xujn94av': {
      'en': 'Street Name',
      'es': '',
      'hi': '',
    },
    '1n8228bh': {
      'en': 'City/Town',
      'es': '',
      'hi': '',
    },
    'sgv2177a': {
      'en': 'State',
      'es': '',
      'hi': '',
    },
    'jo0x4e7t': {
      'en': 'Country',
      'es': '',
      'hi': '',
    },
    'w9tsezpd': {
      'en': 'Local Area',
      'es': '',
      'hi': '',
    },
    'jjvmm3vy': {
      'en': 'Interest',
      'es': '',
      'hi': '',
    },
    'q7jheyn6': {
      'en': 'Special Needs',
      'es': '',
      'hi': '',
    },
    'v0glm4ka': {
      'en': 'Allergy',
      'es': '',
      'hi': '',
    },
    'brv7kn18': {
      'en': 'RSVP',
      'es': '',
      'hi': '',
    },
    'xzi8n0s0': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    '3t4n3voe': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'bnq8smst': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    '98for0ns': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'ws294nv7': {
      'en': 'Keep It',
      'es': '',
      'hi': '',
    },
    'hipzc0jm': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    '58y7gr80': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'q3axtikt': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    '3m4ea925': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'n1d737jn': {
      'en': 'RSVP Comments',
      'es': '',
      'hi': '',
    },
    '65fu66gs': {
      'en': 'Name is required',
      'es': '',
      'hi': '',
    },
    'jyf5thcy': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'dip907fo': {
      'en': 'Last Name is required',
      'es': '',
      'hi': '',
    },
    '8kzsf0bh': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'cinjevce': {
      'en': '(555) 123-4567 is required',
      'es': '',
      'hi': '',
    },
    'sqlyj9dz': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'q9ovjfg7': {
      'en': 'your.email@domain.com is required',
      'es': '',
      'hi': '',
    },
    '08jbtwm7': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'l9b7q7kt': {
      'en': '(555) 987-6543 is required',
      'es': '',
      'hi': '',
    },
    'j46i4app': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'c7bqwzkc': {
      'en': 'Age is required',
      'es': '',
      'hi': '',
    },
    'djd3gsth': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '970rxrf0': {
      'en': 'Date of Birth is required',
      'es': '',
      'hi': '',
    },
    'u24dlv6s': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '8hn9xc70': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'u1gr6blf': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '7zzob067': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'ihkmpzij': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'els1axuq': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'w893dk4a': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '6sxsdljr': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '3hj4ci6l': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'p0bxum87': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'fxooitvn': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'gigse606': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '9yz2lvgb': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'a7x8quhl': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'jfpjw8jv': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '8j184kmo': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'kxxsqxpn': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'lzkzygvn': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'bywr87kd': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'lduifx50': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '79fdndwo': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'fvbg8neh': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'ke9mamkt': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'x3ytipon': {
      'en': 'Save',
      'es': '',
      'hi': '',
    },
    '6dco44b4': {
      'en': 'Guest Information',
      'es': '',
      'hi': '',
    },
  },
  // GuestDetails
  {
    '4isq3gav': {
      'en': 'Guest Details',
      'es': '',
      'hi': '',
    },
    'd8hb3j1x': {
      'en': 'Edit Details',
      'es': '',
      'hi': '',
    },
    'dbiklt8f': {
      'en': 'Dietary Preferences',
      'es': '',
      'hi': '',
    },
    'iei3rxrl': {
      'en': 'Special Needs',
      'es': '',
      'hi': '',
    },
    'fp6rqu6v': {
      'en': 'Allergy',
      'es': '',
      'hi': '',
    },
    '7whhkjp9': {
      'en': 'RSVP Status',
      'es': '',
      'hi': '',
    },
    '82ur931l': {
      'en': 'RSVP',
      'es': '',
      'hi': '',
    },
    'lucl0osn': {
      'en': 'Keep It',
      'es': '',
      'hi': '',
    },
    'xvbnzm2g': {
      'en': 'Comments',
      'es': '',
      'hi': '',
    },
    '1f263qif': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
  },
  // contactList
  {
    'fgd7t9kx': {
      'en': 'Contacts',
      'es': '',
      'hi': '',
    },
    '0yfwamsz': {
      'en': 'Search contacts...',
      'es': '',
      'hi': '',
    },
    'ubo3n0ma': {
      'en': 'Add Guests',
      'es': '',
      'hi': '',
    },
  },
  // EventReadOnlyPage
  {
    '2s5g2ort': {
      'en': 'Event Details',
      'es': '',
      'hi': 'मेरी घटनाएँ',
    },
    'vmcb342m': {
      'en': 'Celebratee',
      'es': '',
      'hi': '',
    },
    'v97jibzm': {
      'en': 'Guest Count',
      'es': '',
      'hi': '',
    },
    'd9ezhava': {
      'en': 'Kids:',
      'es': '',
      'hi': '',
    },
    'gikho8i5': {
      'en': '12',
      'es': '',
      'hi': '',
    },
    't40uh32t': {
      'en': 'Adults:',
      'es': '',
      'hi': '',
    },
    'cpjt7dji': {
      'en': '8',
      'es': '',
      'hi': '',
    },
    'j2eq5124': {
      'en': 'Total Guests:',
      'es': '',
      'hi': '',
    },
    'f7dqw3g7': {
      'en': '20',
      'es': '',
      'hi': '',
    },
    '5pqv3cme': {
      'en': 'Other Details',
      'es': 'Detalles financieros',
      'hi': 'वित्तीय विवरण',
    },
    'ig197xvn': {
      'en': 'Theme:',
      'es': '',
      'hi': '',
    },
    'objq67rj': {
      'en': 'Total Cost:',
      'es': '',
      'hi': '',
    },
    'ojjo6wca': {
      'en': 'Alternative Dates',
      'es': '',
      'hi': '',
    },
    'udz6vnmt': {
      'en': 'Date 1:',
      'es': '',
      'hi': '',
    },
    'zgks85b0': {
      'en': 'Date 2:',
      'es': '',
      'hi': '',
    },
    'nu5ekgrg': {
      'en': 'Description',
      'es': '',
      'hi': 'विवरण',
    },
    'rm1wa4q1': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'b1yfm37s': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // DateAndTimeTab1
  {
    'qeojhdzg': {
      'en': 'Date and Time Selection',
      'es': '',
      'hi': 'मेरी घटनाएँ',
    },
    'o2gfcs0v': {
      'en': 'Select variation...',
      'es': '',
      'hi': '',
    },
    'kbnrdybn': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'pb80dju4': {
      'en': 'Start Time : ',
      'es': '',
      'hi': '',
    },
    '6oyereof': {
      'en': 'AM',
      'es': '',
      'hi': '',
    },
    'qcqop6sb': {
      'en': 'PM',
      'es': '',
      'hi': '',
    },
    'ovbnvndd': {
      'en': 'Days : ',
      'es': '',
      'hi': '',
    },
    'nuax45fn': {
      'en': 'Select number of days',
      'es': '',
      'hi': '',
    },
    'ue9kez8y': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'wsjisx8v': {
      'en': '1  day',
      'es': '',
      'hi': '',
    },
    'n8epye7e': {
      'en': '2 days',
      'es': '',
      'hi': '',
    },
    'oyhht0g7': {
      'en': '3 days',
      'es': '',
      'hi': '',
    },
    'caiwt31q': {
      'en': '4 days',
      'es': '',
      'hi': '',
    },
    'fagw53tp': {
      'en': '5 days',
      'es': '',
      'hi': '',
    },
    'uzn97ejz': {
      'en': '6 days',
      'es': '',
      'hi': '',
    },
    '1f9aklzz': {
      'en': '7 days',
      'es': '',
      'hi': '',
    },
    '5og3kwet': {
      'en': '8 days',
      'es': '',
      'hi': '',
    },
    'akyir34g': {
      'en': '9  days',
      'es': '',
      'hi': '',
    },
    '0hum9puq': {
      'en': '10 days',
      'es': '',
      'hi': '',
    },
    'h5wsyb72': {
      'en': '11 days',
      'es': '',
      'hi': '',
    },
    '1uuijb1v': {
      'en': 'Duration : ',
      'es': '',
      'hi': '',
    },
    '64otnv30': {
      'en': 'Select number of hours',
      'es': '',
      'hi': '',
    },
    'z252ldsl': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'spsufljk': {
      'en': '1 hr',
      'es': '',
      'hi': '',
    },
    'qqkcukih': {
      'en': '2 hr',
      'es': '',
      'hi': '',
    },
    'jv9h3unl': {
      'en': '3 hr',
      'es': '',
      'hi': '',
    },
    'w47wlbt3': {
      'en': '4 hr',
      'es': '',
      'hi': '',
    },
    'ih8zetn2': {
      'en': '5 hr',
      'es': '',
      'hi': '',
    },
    'lkmhrk6b': {
      'en': '6 hr',
      'es': '',
      'hi': '',
    },
    'khy7qhnb': {
      'en': '7 hr',
      'es': '',
      'hi': '',
    },
    'z8pxxb1t': {
      'en': '8 hr',
      'es': '',
      'hi': '',
    },
    'c0qeb0zc': {
      'en': '9  hr',
      'es': '',
      'hi': '',
    },
    '685plcs2': {
      'en': '10 hr',
      'es': '',
      'hi': '',
    },
    '9uvg2y87': {
      'en': '11 hr',
      'es': '',
      'hi': '',
    },
    '4spr68ro': {
      'en': 'Start Time :  ',
      'es': '',
      'hi': '',
    },
    'h2jd58vm': {
      'en': 'AM',
      'es': '',
      'hi': '',
    },
    'j5z2awuj': {
      'en': 'PM',
      'es': '',
      'hi': '',
    },
    'roa8eb83': {
      'en': 'Kids',
      'es': '',
      'hi': '',
    },
    '9xtgjg6a': {
      'en': 'Adults',
      'es': '',
      'hi': '',
    },
    '2t8rghy6': {
      'en': 'Total Invitees',
      'es': '',
      'hi': '',
    },
    'ojk66amf': {
      'en': 'Cake message',
      'es': '',
      'hi': '',
    },
    'hsscllfq': {
      'en': 'Enter cake message',
      'es': '',
      'hi': '',
    },
    'f6kqlo2f': {
      'en': 'Cake message color',
      'es': '',
      'hi': '',
    },
    'hyhk3xka': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    'cokhwpjt': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '7f37e12f': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'wptsdfg1': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'fx9twlye': {
      'en': 'Option 3',
      'es': '',
      'hi': '',
    },
    'k40f099q': {
      'en': 'Alternate Date',
      'es': '',
      'hi': '',
    },
    'ysm0jb3a': {
      'en': 'Alternate date 1 ',
      'es': '',
      'hi': '',
    },
    'jwyvfc56': {
      'en': 'Alternate date 2',
      'es': '',
      'hi': '',
    },
    'n96nujbk': {
      'en': 'Next',
      'es': '',
      'hi': 'कार्ट में जोड़ें',
    },
    '6bt446sm': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // signup
  {
    'telbz9td': {
      'en': 'Create Account',
      'es': '',
      'hi': '',
    },
    '6bnrt7is': {
      'en': 'Fill in your details to get started with planning amazing events.',
      'es': '',
      'hi': '',
    },
    'c0b3xegm': {
      'en': 'FirstName',
      'es': '',
      'hi': '',
    },
    'tp8p1a57': {
      'en': 'LastName',
      'es': '',
      'hi': '',
    },
    'smkskm9e': {
      'en': 'Email Address',
      'es': '',
      'hi': '',
    },
    '5e3trrlu': {
      'en': 'Password',
      'es': '',
      'hi': '',
    },
    'zqbfbuhe': {
      'en': 'Retype Password',
      'es': '',
      'hi': '',
    },
    'i6cwyisf': {
      'en': 'Phone Number',
      'es': '',
      'hi': '',
    },
    'igownrua': {
      'en':
          'I am 18 years of age or older and agree to Terms and Conditions and Privacy policies of Celebratix',
      'es': '',
      'hi': '',
    },
    '2l9rdkzq': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'w9qlluis': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'rhm1p9ll': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '4sfvo31f': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '8aelhojn': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '46wrlpe6': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'r4unhm5s': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'cufnt1yl': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ea8onq8q': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '0f2i7q4f': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '2jjpf8sr': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'nsmursnh': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'dfniodxa': {
      'en': 'By creating an account, you agree to our ',
      'es': '',
      'hi': '',
    },
    'ehfimmuh': {
      'en': 'Terms of Service',
      'es': '',
      'hi': '',
    },
    '244b73p5': {
      'en': ' and ',
      'es': '',
      'hi': '',
    },
    'hhdevoyh': {
      'en': 'Privacy Policy',
      'es': '',
      'hi': '',
    },
    'x005swo1': {
      'en': 'Create Account',
      'es': '',
      'hi': '',
    },
    '6ogk0iwz': {
      'en': 'Already have an account? ',
      'es': '',
      'hi': '',
    },
    '0o73gulk': {
      'en': 'Sign in',
      'es': '',
      'hi': '',
    },
  },
  // PackageVariationPage
  {
    'u2sispha': {
      'en': 'Select Variation',
      'es': '',
      'hi': '',
    },
    '68868xe3': {
      'en': 'Next',
      'es': '',
      'hi': 'कार्ट में जोड़ें',
    },
    'ynei3gxp': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // addOnPageInWizard
  {
    'twnfwkaz': {
      'en': 'Addons',
      'es': '',
      'hi': '',
    },
    'sn2xxdt1': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'bwm24ies': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // AddOnGroupInWizard
  {
    '7cp2i4f3': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'g84oftk3': {
      'en': 'Addons Group',
      'es': '',
      'hi': '',
    },
    'ma41f096': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // GreetingPage
  {
    'dtamamyh': {
      'en': 'Greetings',
      'es': '',
      'hi': '',
    },
    'kj8x7548': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
    'ewnpsf1u': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // AnonymousInfoForShoppingCart
  {
    'krnx5qsi': {
      'en': 'Event Details',
      'es': '',
      'hi': '',
    },
    'ns49iizk': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'r8h4vzkg': {
      'en': 'Enter Event Name',
      'es': '',
      'hi': '',
    },
    '9qyg22uj': {
      'en': 'Celebration Type...',
      'es': '',
      'hi': '',
    },
    '4i6748si': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'q6k6t7au': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '3dgurq2q': {
      'en': 'Enter First Name',
      'es': '',
      'hi': '',
    },
    'johb0gdy': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'geowcl3h': {
      'en': 'Enter Last Name',
      'es': '',
      'hi': '',
    },
    'etjkj64p': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'i49mufy4': {
      'en': 'Enter Email',
      'es': '',
      'hi': '',
    },
    'gzjx56yr': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'k1mv0g16': {
      'en': 'Enter Phone number',
      'es': '',
      'hi': '',
    },
    'xkcexyed': {
      'en': 'Inquiry',
      'es': '',
      'hi': '',
    },
    'zuhodt97': {
      'en': 'Enter your inquiry here',
      'es': '',
      'hi': '',
    },
    'us7fmr03': {
      'en': 'Guests',
      'es': '',
      'hi': '',
    },
    'sa0p3n5w': {
      'en': 'Kids',
      'es': '',
      'hi': '',
    },
    'b7grwbrc': {
      'en': 'Adults',
      'es': '',
      'hi': '',
    },
    '60lexh8t': {
      'en': 'Total Invitees',
      'es': '',
      'hi': '',
    },
    'qqmw1fhz': {
      'en': ' Event Name is required',
      'es': '',
      'hi': '',
    },
    '7u910ues': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'g4wkp0z9': {
      'en': ' First Name is required',
      'es': '',
      'hi': '',
    },
    'drrffwwu': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '8eyefs92': {
      'en': ' Last Name is required',
      'es': '',
      'hi': '',
    },
    'jjqtxvyw': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ta2lvhns': {
      'en': ' Email is required',
      'es': '',
      'hi': '',
    },
    'w54g1myy': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '868eoamh': {
      'en': ' Phone number is required',
      'es': '',
      'hi': '',
    },
    '2fv66rr4': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '87jrwhio': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    '0236228d': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'eu303z0v': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'i412zzs2': {
      'en': 'Celebratee ',
      'es': '',
      'hi': '',
    },
    'gezf057j': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'uybqvx4a': {
      'en': 'Enter Celebratee Name',
      'es': '',
      'hi': '',
    },
    'uinnlltn': {
      'en': 'Gender',
      'es': '',
      'hi': '',
    },
    'ukfhi6my': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'xzr9rmd1': {
      'en': 'opt',
      'es': '',
      'hi': '',
    },
    'wfri7cqy': {
      'en': 'Celebratee Age',
      'es': '',
      'hi': '',
    },
    'hr0b5ufs': {
      'en': 'Theme',
      'es': '',
      'hi': '',
    },
    'e3ahkxok': {
      'en': 'Theme Category',
      'es': '',
      'hi': '',
    },
    'n66n9u5m': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'n5qoba25': {
      'en': 'Enter Theme',
      'es': '',
      'hi': '',
    },
    '2vyg3gu8': {
      'en': 'Alternate Date',
      'es': '',
      'hi': '',
    },
    '5bzz18iv': {
      'en': 'Alternate date 1 ',
      'es': '',
      'hi': '',
    },
    '62gv6xjo': {
      'en': 'Alternate date 2',
      'es': '',
      'hi': '',
    },
    'l8wm25pp': {
      'en': 'OtherDetails',
      'es': '',
      'hi': '',
    },
    'ne6vtkkn': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
    '6c5ls101': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'pxwfhfyr': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'ub840uau': {
      'en': 'Skip',
      'es': '',
      'hi': '',
    },
    'uh3mp29k': {
      'en': 'Address',
      'es': '',
      'hi': '',
    },
    'ohxemr8f': {
      'en': 'Type Street Address ....',
      'es': '',
      'hi': '',
    },
    'z4uo20zd': {
      'en': 'Building Number',
      'es': '',
      'hi': '',
    },
    'gsad43f2': {
      'en': 'Postal Code',
      'es': '',
      'hi': '',
    },
    '0o748scl': {
      'en': 'Floor/Section',
      'es': '',
      'hi': '',
    },
    'cpysqp0h': {
      'en': 'Street Name',
      'es': '',
      'hi': '',
    },
    'itsrr8o7': {
      'en': 'City/Town',
      'es': '',
      'hi': '',
    },
    '5x7w3i9x': {
      'en': 'State',
      'es': '',
      'hi': '',
    },
    '4er4lpwh': {
      'en': 'Country',
      'es': '',
      'hi': '',
    },
    'v1rbzqsz': {
      'en': 'Local Area',
      'es': '',
      'hi': '',
    },
    'n0vc4gfv': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'i05f83i2': {
      'en': 'next',
      'es': '',
      'hi': '',
    },
    '7oylwszo': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // RentalDetails
  {
    'by0qkzr4': {
      'en': 'Photo',
      'es': 'Foto',
      'hi': 'तस्वीर',
    },
    'mkf0tby3': {
      'en': 'Map',
      'es': 'Mapa',
      'hi': 'नक्शा',
    },
    'av8qptfz': {
      'en': 'Inquiry to Book',
      'es': 'Consulta para reservar',
      'hi': 'बुक करने के लिए पूछताछ',
    },
    'wr4bj2tq': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'hi': 'ईमेल',
    },
    'ioi839qq': {
      'en': 'Call',
      'es': 'Llamar',
      'hi': 'पुकारना',
    },
    'g62g36jc': {
      'en': 'Website',
      'es': 'Sitio web',
      'hi': 'वेबसाइट',
    },
    'xfos8vks': {
      'en': 'About this Party Rental',
      'es': 'Descripción',
      'hi': 'विवरण',
    },
    'h0opdf4b': {
      'en': 'Minimum time to Book :',
      'es': '',
      'hi': '',
    },
    'pfur83l2': {
      'en': 'Full amount to be paid :',
      'es': '',
      'hi': '',
    },
    'aq3njgyr': {
      'en': 'Minimum Deposite :',
      'es': '',
      'hi': '',
    },
    'd7yc40w6': {
      'en': 'Package',
      'es': 'Paquete',
      'hi': 'पैकेट',
    },
    'oyfuq1k9': {
      'en': 'Rental Items',
      'es': 'Pasillo/Espacio',
      'hi': 'हॉल/स्पेस',
    },
    'sb2gabod': {
      'en': 'Delivery Info',
      'es': 'Comodidades',
      'hi': 'सुविधाएं',
    },
    '2gc2lcpo': {
      'en': 'Hours',
      'es': 'Horas',
      'hi': 'घंटे',
    },
    '0p8h47p0': {
      'en': 'Regular Hours',
      'es': 'Horario regular',
      'hi': 'नियमित घंटे',
    },
    'oi9sdq11': {
      'en': 'Celebration Hours',
      'es': 'Horas de celebración',
      'hi': 'उत्सव के घंटे',
    },
    'o3e9n7x6': {
      'en': 'Payment',
      'es': 'Pago',
      'hi': 'भुगतान',
    },
    '22tewtx9': {
      'en': 'Review & Rating',
      'es': 'Reseña y calificación',
      'hi': 'समीक्षा और रेटिंग',
    },
    'zem1ec1o': {
      'en': 'Booking Policies',
      'es': 'Políticas de reserva',
      'hi': 'बुकिंग नीतियाँ',
    },
    'k1vh6zg6': {
      'en': 'Frequently Asked Questions',
      'es': 'Preguntas frecuentes',
      'hi': 'अक्सर पूछे जाने वाले प्रश्नों',
    },
    'qo7pmyq2': {
      'en': 'Awards',
      'es': 'Premios',
      'hi': 'पुरस्कार',
    },
    'shs3h3bn': {
      'en': 'Similar',
      'es': 'Similar',
      'hi': 'समान',
    },
    'rg3gllto': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // RentalItem
  {
    '29i57fdr': {
      'en': 'Rental Items',
      'es': '',
      'hi': '',
    },
    'ivgutx5y': {
      'en': 'Select Item',
      'es': '',
      'hi': '',
    },
    'kub93hon': {
      'en': 'Select   Item',
      'es': 'Seleccionar espacio/sala',
      'hi': 'स्थान/हॉल चुनें',
    },
  },
  // RentaPackage
  {
    'g753io3i': {
      'en': 'Rental Package',
      'es': '',
      'hi': '',
    },
    'usjvdckk': {
      'en': 'Description : ',
      'es': '',
      'hi': '',
    },
  },
  // RentalSearch
  {
    '7o4jdaje': {
      'en': 'Search Party Rentals',
      'es': '',
      'hi': '',
    },
    '2asri2i5': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // foodSinglePageCartDetails
  {
    'cp5f15rg': {
      'en': 'Variations',
      'es': '',
      'hi': '',
    },
    'zpuhd0j9': {
      'en': 'TotalPrice',
      'es': '',
      'hi': 'आयु सीमा',
    },
    '1zj1ngsx': {
      'en': 'unitprice',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'r5igeg10': {
      'en': 'persons',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'z3fsj0sg': {
      'en': 'persons',
      'es': '',
      'hi': 'आयु सीमा',
    },
    '0gc68rga': {
      'en': 'accomodates',
      'es': '',
      'hi': 'आयु सीमा',
    },
    't07gruzw': {
      'en': 'calorie',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'jfcedczo': {
      'en': 'Description : ',
      'es': '',
      'hi': '',
    },
    '5qbiurmr': {
      'en': 'Add to Cart',
      'es': '',
      'hi': 'कार्ट में जोड़ें',
    },
    'jc6j0j8u': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // RentalItemDetails
  {
    'bz3lw58f': {
      'en': 'Variations',
      'es': '',
      'hi': '',
    },
    'ilkec20o': {
      'en': 'Installlation Fee',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'psqzubdu': {
      'en': 'delivery Fee',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'sgmq1e7b': {
      'en': 'weekDay Price',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'rj2fqc05': {
      'en': 'Weekend price',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'd2rfjme6': {
      'en': 'Capacity',
      'es': '',
      'hi': 'अवधि',
    },
    'aeg8x699': {
      'en': 'length',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'y371bn19': {
      'en': 'width',
      'es': '',
      'hi': 'आयु सीमा',
    },
    'vbctq240': {
      'en': 'Depth',
      'es': '',
      'hi': 'गतिविधियों',
    },
    'q3tidjlu': {
      'en': 'Hight',
      'es': '',
      'hi': 'गतिविधियों',
    },
    'rpmr7qpy': {
      'en': 'Hight',
      'es': '',
      'hi': 'गतिविधियों',
    },
    'rnnkovd6': {
      'en': 'Brand',
      'es': '',
      'hi': 'गतिविधियों',
    },
    'k0sf2rww': {
      'en': 'Power',
      'es': '',
      'hi': 'गतिविधियों',
    },
    'vynnmrxv': {
      'en': 'Material',
      'es': '',
      'hi': 'गतिविधियों',
    },
    '6775yxod': {
      'en': 'Description : ',
      'es': '',
      'hi': '',
    },
    'ws9jw8xi': {
      'en': 'Add to Cart',
      'es': '',
      'hi': 'कार्ट में जोड़ें',
    },
    '7z0yabl4': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // ShoppingCartDeliveryPage
  {
    '15ri8739': {
      'en': 'Delivery',
      'es': '',
      'hi': '',
    },
    '3hex499t': {
      'en': 'Item Details',
      'es': '',
      'hi': 'आदेश सारांश',
    },
    'ody5rphj': {
      'en': 'Delivery Details',
      'es': '',
      'hi': 'आदेश सारांश',
    },
    'rkur7jms': {
      'en': 'Delivery Type',
      'es': '',
      'hi': '',
    },
    'vgeto7j1': {
      'en': 'Delivery',
      'es': '',
      'hi': '',
    },
    'x4vuh6ss': {
      'en': 'Pick up',
      'es': '',
      'hi': '',
    },
    'maugqz4x': {
      'en': 'Type Street Address ....',
      'es': '',
      'hi': '',
    },
    'r445xh3u': {
      'en': 'Standard Distance ',
      'es': '',
      'hi': '',
    },
    'yccqj9fh': {
      'en': 'Standard Rate ',
      'es': '',
      'hi': '',
    },
    'peb3ivs3': {
      'en': 'Current Travel Distance ',
      'es': '',
      'hi': '',
    },
    'mrv9g8bw': {
      'en': 'Travel Delivery Rate ',
      'es': '',
      'hi': '',
    },
    'v89wir48': {
      'en': 'Travel Fees',
      'es': '',
      'hi': '',
    },
    'ork48e5s': {
      'en': 'Total Price ',
      'es': '',
      'hi': '',
    },
    'fvsaylt9': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'dix7abes': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // allEntertainer
  {
    'm4zv4y3r': {
      'en': 'Search',
      'es': 'Buscar',
      'hi': 'खोज',
    },
    'zvq13n8m': {
      'en': 'Search for entertainer',
      'es': 'Buscar lugares...',
      'hi': 'स्थानों की खोज करें...',
    },
    'b6f5lt4a': {
      'en': 'Category',
      'es': 'Lugar/Actividad',
      'hi': 'स्थान/गतिविधि',
    },
    'bezydjtu': {
      'en': 'Sort By',
      'es': 'Ordenar por',
      'hi': 'इसके अनुसार क्रमबद्ध करें',
    },
    'hxafejzb': {
      'en': 'Entertainer',
      'es': 'Lugares',
      'hi': 'स्थानों',
    },
    '9tw0ldu2': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // EntertainerDetails
  {
    '744iwywf': {
      'en': 'Photo',
      'es': 'Foto',
      'hi': 'तस्वीर',
    },
    '55dt7ab3': {
      'en': 'Map',
      'es': 'Mapa',
      'hi': 'नक्शा',
    },
    '4utf89he': {
      'en': 'Inquiry to Book',
      'es': 'Consulta para reservar',
      'hi': 'बुक करने के लिए पूछताछ',
    },
    'g1q381cr': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'hi': 'ईमेल',
    },
    'n3h3jn0g': {
      'en': 'Call',
      'es': 'Llamar',
      'hi': 'पुकारना',
    },
    'gjino9sc': {
      'en': 'Website',
      'es': 'Sitio web',
      'hi': 'वेबसाइट',
    },
    'scocf1p2': {
      'en': 'About this Entertainer',
      'es': 'Descripción',
      'hi': 'विवरण',
    },
    's84p3u3y': {
      'en': 'Minimum time to book :',
      'es': '',
      'hi': '',
    },
    '30fb7zt2': {
      'en': 'Activities',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    '5cug9mfx': {
      'en': 'AddOns',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    'oj4vzb5f': {
      'en': 'Package',
      'es': 'Paquete',
      'hi': 'पैकेट',
    },
    'h1fdb9lw': {
      'en': 'Entertainer Items',
      'es': 'Pasillo/Espacio',
      'hi': 'हॉल/स्पेस',
    },
    'p5zrk144': {
      'en': 'Delivery Info',
      'es': 'Comodidades',
      'hi': 'सुविधाएं',
    },
    'mi6vb4ya': {
      'en': 'Traval Info',
      'es': 'Comodidades',
      'hi': 'सुविधाएं',
    },
    'ztts1fz3': {
      'en': 'Hours',
      'es': 'Horas',
      'hi': 'घंटे',
    },
    'tgtf4o46': {
      'en': 'Regular Hours',
      'es': 'Horario regular',
      'hi': 'नियमित घंटे',
    },
    '51c0l2ia': {
      'en': 'Celebration Hours',
      'es': 'Horas de celebración',
      'hi': 'उत्सव के घंटे',
    },
    'm81ny16t': {
      'en': 'Payment',
      'es': 'Pago',
      'hi': 'भुगतान',
    },
    'k052u5td': {
      'en': 'Review & Rating',
      'es': 'Reseña y calificación',
      'hi': 'समीक्षा और रेटिंग',
    },
    'h7luix9h': {
      'en': 'Booking Policies',
      'es': 'Políticas de reserva',
      'hi': 'बुकिंग नीतियाँ',
    },
    'fmeinjh8': {
      'en': 'Frequently Asked Questions',
      'es': 'Preguntas frecuentes',
      'hi': 'अक्सर पूछे जाने वाले प्रश्नों',
    },
    'r86dd30s': {
      'en': 'Awards',
      'es': 'Premios',
      'hi': 'पुरस्कार',
    },
    '2pr9ungn': {
      'en': 'Similar',
      'es': 'Similar',
      'hi': 'समान',
    },
    'd59k0zll': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // customCakeDNT
  {
    'yp28hk4g': {
      'en': 'Menu Section Selection',
      'es': '',
      'hi': '',
    },
    'ymrgvlic': {
      'en': 'Variety',
      'es': '',
      'hi': '',
    },
    'uyf34wp8': {
      'en': 'Date Time Selection',
      'es': '',
      'hi': '',
    },
    'ttoikc0b': {
      'en': 'Start time',
      'es': '',
      'hi': '',
    },
    'oajwqcki': {
      'en': 'AM',
      'es': '',
      'hi': '',
    },
    'f8vcdgze': {
      'en': 'PM',
      'es': '',
      'hi': '',
    },
    '817dc66z': {
      'en': 'Total Price',
      'es': '',
      'hi': '',
    },
    '6bzv1w0e': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    '93nvdkub': {
      'en': 'Custom Cake',
      'es': '',
      'hi': '',
    },
    'rb1j544q': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // EntertainerSearch
  {
    'cm68wwaw': {
      'en': 'Search Entertainers',
      'es': '',
      'hi': '',
    },
    '0721zlqm': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // flavoursPage
  {
    'qkpjela4': {
      'en': 'Flavours ',
      'es': '',
      'hi': '',
    },
    '5k82natq': {
      'en': 'Choose maximum 3',
      'es': '',
      'hi': '',
    },
    'b9ommwnn': {
      'en': 'Selection Price',
      'es': '',
      'hi': '',
    },
    '1prz07k1': {
      'en': 'Total Price',
      'es': '',
      'hi': '',
    },
    'k6gucoeu': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'tlrx4qia': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // fillingsPage
  {
    'obczc0xw': {
      'en': 'Fillings',
      'es': '',
      'hi': '',
    },
    '4m5jzl4h': {
      'en': 'Choose maximum 3',
      'es': '',
      'hi': '',
    },
    'orukj266': {
      'en': 'Selection Price',
      'es': '',
      'hi': '',
    },
    'u7jqkdei': {
      'en': 'Total Price',
      'es': '',
      'hi': '',
    },
    'ylgsbn3k': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    '1ehkc8w4': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // shapesPage
  {
    'ez0ggdl1': {
      'en': 'Shapes',
      'es': '',
      'hi': '',
    },
    '76o32uxa': {
      'en': 'Choose  any 1',
      'es': '',
      'hi': '',
    },
    '9c97dxj8': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'c27sjen2': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // icingPage
  {
    'eqie8jt2': {
      'en': 'Icing',
      'es': '',
      'hi': '',
    },
    '88yaraxs': {
      'en': 'Choose maximum 2',
      'es': '',
      'hi': '',
    },
    'bj6wojdi': {
      'en': 'Selection Price',
      'es': '',
      'hi': '',
    },
    'l2t6z2wh': {
      'en': 'Total Price',
      'es': '',
      'hi': '',
    },
    'vu8696nc': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'azn4to0j': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // colorPage
  {
    'th9v7es0': {
      'en': 'Color',
      'es': '',
      'hi': '',
    },
    '5zoor5pg': {
      'en': 'Choose  any 1',
      'es': '',
      'hi': '',
    },
    '4ws9uace': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'u1osv6vh': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // layerPage
  {
    '0ogog7s4': {
      'en': 'Layer',
      'es': '',
      'hi': '',
    },
    'edgcqdyn': {
      'en': 'Choose  any 1',
      'es': '',
      'hi': '',
    },
    '2idk1rnk': {
      'en': 'Selection Price',
      'es': '',
      'hi': '',
    },
    '83284i8w': {
      'en': 'Total Price',
      'es': '',
      'hi': '',
    },
    'qkni7for': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'qg552dx9': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // decorPage
  {
    'pxivnbny': {
      'en': 'Decor',
      'es': '',
      'hi': '',
    },
    'ofzcdz7e': {
      'en': 'Choose  any 1',
      'es': '',
      'hi': '',
    },
    'if4y7yls': {
      'en': 'Selection Price',
      'es': '',
      'hi': '',
    },
    'o2xwetfq': {
      'en': 'Total Price',
      'es': '',
      'hi': '',
    },
    'hn9i2usu': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'lbrfnrl7': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // borderPage
  {
    'l0yhl8y8': {
      'en': 'Border',
      'es': '',
      'hi': '',
    },
    '9v6kx3kl': {
      'en': 'Choose  any 1',
      'es': '',
      'hi': '',
    },
    'mf1ud8dr': {
      'en': 'Selection Price',
      'es': '',
      'hi': '',
    },
    '185hk1o0': {
      'en': 'Total Price',
      'es': '',
      'hi': '',
    },
    'n848iif1': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'c7snkzkt': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // allCakes
  {
    'usx4wj21': {
      'en': 'Search',
      'es': 'Buscar',
      'hi': 'खोज',
    },
    'txhp2t2n': {
      'en': 'Search for cake',
      'es': 'Buscar lugares...',
      'hi': 'स्थानों की खोज करें...',
    },
    'z6lnhoof': {
      'en': 'Themes',
      'es': 'Lugar/Actividad',
      'hi': 'स्थान/गतिविधि',
    },
    'oyc84ohv': {
      'en': 'Sort By',
      'es': 'Ordenar por',
      'hi': 'इसके अनुसार क्रमबद्ध करें',
    },
    't87f52pk': {
      'en': 'Cakes',
      'es': 'Lugares',
      'hi': 'स्थानों',
    },
    'rk0z79qz': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // EntertainerItem
  {
    'g3xjs0r6': {
      'en': 'Entertainer Items',
      'es': '',
      'hi': '',
    },
    'bomptk9h': {
      'en': 'Select Item',
      'es': '',
      'hi': '',
    },
    '59379n6l': {
      'en': 'Select   Item',
      'es': 'Seleccionar espacio/sala',
      'hi': 'स्थान/हॉल चुनें',
    },
  },
  // EntertainerPackage
  {
    'q1pm5ah0': {
      'en': 'Entertainer Package',
      'es': '',
      'hi': '',
    },
    '3h3gu1dl': {
      'en': 'Description : ',
      'es': '',
      'hi': '',
    },
  },
  // CakeSearch
  {
    '6b13yj3h': {
      'en': 'Search Bakeries',
      'es': '',
      'hi': '',
    },
    'q2u4j1r4': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // readyMadeCustomizationPage
  {
    'bqpxvm7m': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'yu3em43y': {
      'en': 'Customization',
      'es': '',
      'hi': '',
    },
    '4577kkb3': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // CakeDetails
  {
    'drs5zpts': {
      'en': 'Photo',
      'es': 'Foto',
      'hi': 'तस्वीर',
    },
    'gw44l32u': {
      'en': 'Map',
      'es': 'Mapa',
      'hi': 'नक्शा',
    },
    '9xln80l7': {
      'en': 'Inquiry to Book',
      'es': 'Consulta para reservar',
      'hi': 'बुक करने के लिए पूछताछ',
    },
    'iyf26uj5': {
      'en': 'Order Custom Cake',
      'es': 'Consulta para reservar',
      'hi': 'बुक करने के लिए पूछताछ',
    },
    'q4grti7g': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'hi': 'ईमेल',
    },
    'deh2pxt3': {
      'en': 'Call',
      'es': 'Llamar',
      'hi': 'पुकारना',
    },
    'mhtaz1nm': {
      'en': 'Website',
      'es': 'Sitio web',
      'hi': 'वेबसाइट',
    },
    '0mudicib': {
      'en': 'About this Bakery',
      'es': 'Descripción',
      'hi': 'विवरण',
    },
    'hp0frn46': {
      'en': 'Minimum time for booking requires : ',
      'es': '',
      'hi': '',
    },
    'zh66shx5': {
      'en': 'Available Theme :',
      'es': '',
      'hi': '',
    },
    '5p1fyqjf': {
      'en': 'Bakery Type : ',
      'es': '',
      'hi': '',
    },
    'xrnrg4lt': {
      'en': 'Menu Section Names : ',
      'es': '',
      'hi': '',
    },
    'ml819x9c': {
      'en': 'Speciality : ',
      'es': '',
      'hi': '',
    },
    '2ymh8yl2': {
      'en': 'Cake Items',
      'es': 'Pasillo/Espacio',
      'hi': 'हॉल/स्पेस',
    },
    '9ov4laze': {
      'en': 'Flavors',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    'by4o4ucx': {
      'en': 'Filling',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    '9bfsfebg': {
      'en': 'Shape',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    'extt0t9e': {
      'en': 'Icing',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    '9f59bonb': {
      'en': 'Sizes',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    'e59pc7e9': {
      'en': 'Colors',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    '4doty6xo': {
      'en': 'Custom',
      'es': 'Más detalles',
      'hi': 'अधिक जानकारी',
    },
    'n99inxl7': {
      'en': 'Delivery Info',
      'es': 'Comodidades',
      'hi': 'सुविधाएं',
    },
    'mooowoww': {
      'en': 'Hours',
      'es': 'Horas',
      'hi': 'घंटे',
    },
    '8hyz8gph': {
      'en': 'Regular Hours',
      'es': 'Horario regular',
      'hi': 'नियमित घंटे',
    },
    '5kz7ivdu': {
      'en': 'Celebration Hours',
      'es': 'Horas de celebración',
      'hi': 'उत्सव के घंटे',
    },
    'nv0y0bpe': {
      'en': 'Payment',
      'es': 'Pago',
      'hi': 'भुगतान',
    },
    '97gpuazb': {
      'en': 'Review & Rating',
      'es': 'Reseña y calificación',
      'hi': 'समीक्षा और रेटिंग',
    },
    'ad2m9va5': {
      'en': 'Booking Policies',
      'es': 'Políticas de reserva',
      'hi': 'बुकिंग नीतियाँ',
    },
    '2i29dc9j': {
      'en': 'Frequently Asked Questions',
      'es': 'Preguntas frecuentes',
      'hi': 'अक्सर पूछे जाने वाले प्रश्नों',
    },
    '57mqjixh': {
      'en': 'Similar',
      'es': 'Similar',
      'hi': 'समान',
    },
    'mmvh4x05': {
      'en': 'Awards',
      'es': 'Premios',
      'hi': 'पुरस्कार',
    },
    'p64au264': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // CakeItem
  {
    '1t5o8l2j': {
      'en': 'Cake Items',
      'es': '',
      'hi': '',
    },
    'qmmvyu8a': {
      'en': 'Select Item',
      'es': '',
      'hi': '',
    },
    'a2w2b406': {
      'en': 'Select   Item',
      'es': 'Seleccionar espacio/sala',
      'hi': 'स्थान/हॉल चुनें',
    },
  },
  // ChangePassword
  {
    'jk60v367': {
      'en': 'Change Password',
      'es': '',
      'hi': 'पासवर्ड रीसेट',
    },
    'aypph8vy': {
      'en': 'New Password',
      'es': '',
      'hi': 'नया पासवर्ड',
    },
    '21a67c47': {
      'en': 'Enter password',
      'es': '',
      'hi': 'पास वर्ड दर्ज करें',
    },
    'oi9iabmn': {
      'en': 'Retype Password',
      'es': '',
      'hi': 'पासवर्ड फिर से लिखें',
    },
    'seufmxdb': {
      'en': 'Enter password',
      'es': '',
      'hi': 'पास वर्ड दर्ज करें',
    },
    'k2lva0p0': {
      'en': 'Save',
      'es': '',
      'hi': 'रीसेट करें',
    },
    'nn7mcltr': {
      'en': 'Home',
      'es': '',
      'hi': 'घर',
    },
  },
  // DateAndTimeTab1Copy
  {
    'fh9j0mra': {
      'en': 'Date and Time Selection',
      'es': '',
      'hi': 'मेरी घटनाएँ',
    },
    '1vp4r666': {
      'en': 'Select variation...',
      'es': '',
      'hi': '',
    },
    'om0gni1v': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '2lul3l2k': {
      'en': 'Start Time : ',
      'es': '',
      'hi': '',
    },
    'bpl9r0qf': {
      'en': 'AM',
      'es': '',
      'hi': '',
    },
    'bprwd6qv': {
      'en': 'PM',
      'es': '',
      'hi': '',
    },
    'r6xt6851': {
      'en': 'Days : ',
      'es': '',
      'hi': '',
    },
    'x7krh5s5': {
      'en': 'Select number of days',
      'es': '',
      'hi': '',
    },
    '4ht90140': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'diwaubmx': {
      'en': '1  day',
      'es': '',
      'hi': '',
    },
    '2xhpqhca': {
      'en': '2 days',
      'es': '',
      'hi': '',
    },
    '7tt7dvks': {
      'en': '3 days',
      'es': '',
      'hi': '',
    },
    'wuytf6b4': {
      'en': '4 days',
      'es': '',
      'hi': '',
    },
    '9mz2aerq': {
      'en': '5 days',
      'es': '',
      'hi': '',
    },
    'k3c1cfqd': {
      'en': '6 days',
      'es': '',
      'hi': '',
    },
    'esy300yi': {
      'en': '7 days',
      'es': '',
      'hi': '',
    },
    '0tretr0b': {
      'en': '8 days',
      'es': '',
      'hi': '',
    },
    '3tatwa97': {
      'en': '9  days',
      'es': '',
      'hi': '',
    },
    'cd3wnlhw': {
      'en': '10 days',
      'es': '',
      'hi': '',
    },
    '2hgntch0': {
      'en': '11 days',
      'es': '',
      'hi': '',
    },
    '0nzyd9ii': {
      'en': 'Duration : ',
      'es': '',
      'hi': '',
    },
    'whfx3h5h': {
      'en': 'Select number of hours',
      'es': '',
      'hi': '',
    },
    'i7oj45tm': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '1trtjln9': {
      'en': '1 hr',
      'es': '',
      'hi': '',
    },
    '519ew8ii': {
      'en': '2 hr',
      'es': '',
      'hi': '',
    },
    'wjp8o2bk': {
      'en': '3 hr',
      'es': '',
      'hi': '',
    },
    '5scmb81v': {
      'en': '4 hr',
      'es': '',
      'hi': '',
    },
    'dbepgma1': {
      'en': '5 hr',
      'es': '',
      'hi': '',
    },
    '32eiaxca': {
      'en': '6 hr',
      'es': '',
      'hi': '',
    },
    'q0for9h6': {
      'en': '7 hr',
      'es': '',
      'hi': '',
    },
    'rtqekz06': {
      'en': '8 hr',
      'es': '',
      'hi': '',
    },
    'fnwfc19g': {
      'en': '9  hr',
      'es': '',
      'hi': '',
    },
    'x9gecav0': {
      'en': '10 hr',
      'es': '',
      'hi': '',
    },
    'anob3dda': {
      'en': '11 hr',
      'es': '',
      'hi': '',
    },
    't67eh2gb': {
      'en': 'Start Time :  ',
      'es': '',
      'hi': '',
    },
    'kxm4lnkp': {
      'en': 'AM',
      'es': '',
      'hi': '',
    },
    '563ree54': {
      'en': 'PM',
      'es': '',
      'hi': '',
    },
    'rrei70dr': {
      'en': 'Kids',
      'es': '',
      'hi': '',
    },
    '147hqsgh': {
      'en': 'Adults',
      'es': '',
      'hi': '',
    },
    'qdxoromp': {
      'en': 'Total Invitees',
      'es': '',
      'hi': '',
    },
    'glrxis2i': {
      'en': 'Cake message',
      'es': '',
      'hi': '',
    },
    'rx39b7zp': {
      'en': 'Enter cake message',
      'es': '',
      'hi': '',
    },
    '28b63j33': {
      'en': 'Cake message color',
      'es': '',
      'hi': '',
    },
    '1o75v4mr': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    'rc7k8pg9': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '2z1ea4v1': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'ia05ewz7': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'lkeaafws': {
      'en': 'Option 3',
      'es': '',
      'hi': '',
    },
    'lkybo1f6': {
      'en': 'Alternate Date',
      'es': '',
      'hi': '',
    },
    '7fzmxx6f': {
      'en': 'Alternate date 1 ',
      'es': '',
      'hi': '',
    },
    '8lfp3558': {
      'en': 'Alternate date 2',
      'es': '',
      'hi': '',
    },
    'tysb9txo': {
      'en': 'Next',
      'es': '',
      'hi': 'कार्ट में जोड़ें',
    },
    'crqmlv6i': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // MyForm
  {
    'ttuvzjqa': {
      'en': 'Suffix',
      'es': '',
      'hi': '',
    },
    'f0g1hwt3': {
      'en': 'Select suffix',
      'es': '',
      'hi': '',
    },
    'jhv7ugtz': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'anerldmr': {
      'en': 'Gender',
      'es': '',
      'hi': '',
    },
    'lrsu7kiw': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'wldo08k3': {
      'en': 'Male',
      'es': '',
      'hi': '',
    },
    'x2yyu53w': {
      'en': 'Female',
      'es': '',
      'hi': '',
    },
    '8a5lw70r': {
      'en': 'Date of Birth',
      'es': '',
      'hi': '',
    },
    'rutx4n95': {
      'en': 'Date of Birth',
      'es': '',
      'hi': '',
    },
    '9uadt071': {
      'en': 'First Name',
      'es': '',
      'hi': '',
    },
    'ew4925fo': {
      'en': '*',
      'es': '',
      'hi': '',
    },
    '9fv78xnq': {
      'en': 'Middle Name',
      'es': '',
      'hi': '',
    },
    'uni2ushs': {
      'en': 'Last Name',
      'es': '',
      'hi': '',
    },
    'au5hjjpk': {
      'en': 'Email',
      'es': '',
      'hi': '',
    },
    'fzf1ukgg': {
      'en': '*',
      'es': '',
      'hi': '',
    },
    'v14e1wa2': {
      'en': 'Mobile Number',
      'es': '',
      'hi': '',
    },
    'c4tgzzw2': {
      'en': 'More Details',
      'es': '',
      'hi': '',
    },
    '1o9jf7zq': {
      'en': ' Contact Number',
      'es': '',
      'hi': '',
    },
    'lj2luj8c': {
      'en': 'Contact Number',
      'es': '',
      'hi': '',
    },
    'oj4pqq29': {
      'en': 'Alt Contact Number',
      'es': '',
      'hi': '',
    },
    'or2v2gnl': {
      'en': 'Contact Number',
      'es': '',
      'hi': '',
    },
    '5bs99tqn': {
      'en': 'Alternate Email',
      'es': '',
      'hi': '',
    },
    'utcw5dm1': {
      'en': 'Email',
      'es': '',
      'hi': '',
    },
    'ae74toh7': {
      'en': 'Twitter',
      'es': '',
      'hi': '',
    },
    'w4vxtdi3': {
      'en': 'Fax',
      'es': '',
      'hi': '',
    },
    'ao5222cl': {
      'en': 'Google+',
      'es': '',
      'hi': '',
    },
    '05hnn9vt': {
      'en': 'Website',
      'es': '',
      'hi': '',
    },
    'ay3dyww2': {
      'en': 'Street Address',
      'es': '',
      'hi': '',
    },
    '5vr2041r': {
      'en': 'Building Number',
      'es': '',
      'hi': '',
    },
    'to9qeb5e': {
      'en': 'Postal Code',
      'es': '',
      'hi': '',
    },
    'cvz2kgwq': {
      'en': 'Floor/Section',
      'es': '',
      'hi': '',
    },
    'b798u209': {
      'en': 'Street Name',
      'es': '',
      'hi': '',
    },
    'u8tynax5': {
      'en': 'City/Town',
      'es': '',
      'hi': '',
    },
    'f207nzpc': {
      'en': 'State',
      'es': '',
      'hi': '',
    },
    'd6wl6eca': {
      'en': 'Country',
      'es': '',
      'hi': '',
    },
    'p5oq46cc': {
      'en': 'Local Area',
      'es': '',
      'hi': '',
    },
    'f8akcel5': {
      'en': 'Special Needs',
      'es': '',
      'hi': '',
    },
    'etzg91d7': {
      'en': 'Education',
      'es': '',
      'hi': '',
    },
    'alqtvz5r': {
      'en': 'Select Education.....',
      'es': '',
      'hi': '',
    },
    'lqhy871y': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '63s43lp4': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'gicyk0gd': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    '5pa4idml': {
      'en': 'Interest',
      'es': '',
      'hi': '',
    },
    'wd23hvov': {
      'en': 'Comments',
      'es': '',
      'hi': '',
    },
    'ckg68auh': {
      'en': 'Date of Birth is required',
      'es': '',
      'hi': '',
    },
    'm2vwrnyl': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'psyw5uvu': {
      'en': 'FirstName is  required',
      'es': '',
      'hi': '',
    },
    '0qjet1e0': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'q8f6w9c0': {
      'en': 'Last Name is required',
      'es': '',
      'hi': '',
    },
    '04qeaxgz': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'nmvhwpbi': {
      'en': 'Last Name is required',
      'es': '',
      'hi': '',
    },
    '7pt3645k': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'tapcx184': {
      'en': 'Email is required',
      'es': '',
      'hi': '',
    },
    'zwtoftj5': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'uojt77ty': {
      'en': 'Mobile Number is required',
      'es': '',
      'hi': '',
    },
    'mytewlgq': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'usz4hcto': {
      'en': '(555) 987-6543 is required',
      'es': '',
      'hi': '',
    },
    'ry8cf497': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'our811f9': {
      'en': 'Contact Number is required',
      'es': '',
      'hi': '',
    },
    'fj8j1amj': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '9sj6bov5': {
      'en': 'Email is required',
      'es': '',
      'hi': '',
    },
    '97eaxx15': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '0mybhp24': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'o3op66gc': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '1mng1hqj': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'pa4kja6j': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '6clzrtow': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '1ukqemio': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'vm6na882': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'ybjh5y9m': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '66bpkvob': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'emz30ql2': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '1ibop90g': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'zzl4t05p': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ur7k5t2r': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'p77ibzi9': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'be92a6zu': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '3xg2vbov': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'aei85wqh': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '18945s0m': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '0upphj6t': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'tvoo5k9o': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'an2b6yss': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '5fc0rh96': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '5szvhzug': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'bfq42nfi': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'z8k5krdy': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'ymagbs6l': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'y156egjf': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '3wnd7q1m': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'zmzfb3s2': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '8j46ccyx': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'f4di7nen': {
      'en': 'Save',
      'es': '',
      'hi': '',
    },
    'wxjima4z': {
      'en': 'My  Information',
      'es': '',
      'hi': '',
    },
  },
  // FamilyMemberList
  {
    'inlgxep1': {
      'en': 'Family Members',
      'es': '',
      'hi': '',
    },
    'gbp2dthn': {
      'en': 'Add family members to share your plan',
      'es': '',
      'hi': '',
    },
    'qv6pe37a': {
      'en': 'Add Member',
      'es': '',
      'hi': '',
    },
    'yddtadvk': {
      'en': 'Add from contact',
      'es': '',
      'hi': '',
    },
  },
  // HomePage
  {
    'xj5cdeo8': {
      'en': 'Welcome Bhagavati',
      'es': 'Bienvenida Bhagavati',
      'hi': 'स्वागत है भगवती',
    },
    'hmpfxi0g': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'hi': 'दाखिल करना',
    },
    'uxozoy3f': {
      'en': 'Venue',
      'es': 'Evento',
      'hi': 'कार्यक्रम का स्थान',
    },
    'qifsyye2': {
      'en': 'Rental',
      'es': 'Alquilergg',
      'hi': 'किराये',
    },
    'wdndqbla': {
      'en': 'Entertainer',
      'es': 'Artista',
      'hi': 'मनोरंजन',
    },
    '7465lqfn': {
      'en': 'Cake',
      'es': 'Pastel',
      'hi': 'केक',
    },
    'ctgcrqe8': {
      'en': 'Food',
      'es': 'Alimento',
      'hi': 'खाना',
    },
    'dki02tyh': {
      'en': 'Discover  Venues',
      'es': 'Descubra los lugares',
      'hi': 'स्थानों की खोज करें',
    },
    'j6mbssdo': {
      'en': 'See All',
      'es': 'Ver todo',
      'hi': 'सभी देखें',
    },
    '9la7rozv': {
      'en': 'Discover Rentals',
      'es': 'Descubra los alquileres',
      'hi': 'किराये की जगह खोजें',
    },
    'drcy6q6z': {
      'en': 'See All',
      'es': 'Ver todo',
      'hi': 'सभी देखें',
    },
    'ktso0bgl': {
      'en': 'Discover Entertainers',
      'es': 'Descubra a los artistas',
      'hi': 'मनोरंजन करने वालों की खोज करें',
    },
    'r1wmxhme': {
      'en': 'See All',
      'es': 'Ver todo',
      'hi': 'सभी देखें',
    },
    '0sp3dp19': {
      'en': 'Discover Cakes',
      'es': 'Descubre las tartas',
      'hi': 'केक खोजें',
    },
    'd2rkmayo': {
      'en': 'See All',
      'es': 'Ver todo',
      'hi': 'सभी देखें',
    },
    '3nl1v21j': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // EventForm
  {
    'fkev5i5y': {
      'en': 'Event Information',
      'es': '',
      'hi': '',
    },
    'yw5nuynq': {
      'en': 'Basic Information',
      'es': '',
      'hi': '',
    },
    'nsltfich': {
      'en': '*',
      'es': '',
      'hi': '',
    },
    'aucanwn7': {
      'en': 'Event Name',
      'es': '',
      'hi': '',
    },
    '97vhqtss': {
      'en': 'Select Celebration Type',
      'es': '',
      'hi': '',
    },
    'mlp0ckzl': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '3aj5k3vj': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    '3f9smpnz': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'sdb0p0s6': {
      'en': 'Kids',
      'es': '',
      'hi': '',
    },
    'gkqt8su2': {
      'en': 'Adults',
      'es': '',
      'hi': '',
    },
    'e8nkonm5': {
      'en': 'Total Invitees           ',
      'es': '',
      'hi': '',
    },
    'ib71d2xo': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'kzyst87o': {
      'en': '1',
      'es': '',
      'hi': '',
    },
    '20s9sesc': {
      'en': 'Celebratee Information',
      'es': '',
      'hi': '',
    },
    'mj6zftp6': {
      'en': 'FirstName',
      'es': '',
      'hi': '',
    },
    'qrfy45zw': {
      'en': 'Last Name',
      'es': '',
      'hi': '',
    },
    '5j0ak739': {
      'en': 'Gender',
      'es': '',
      'hi': '',
    },
    'zj42qsty': {
      'en': 'Male',
      'es': '',
      'hi': '',
    },
    '58xswmwk': {
      'en': 'Female',
      'es': '',
      'hi': '',
    },
    '6vxrd72m': {
      'en': 'Age',
      'es': '',
      'hi': '',
    },
    'bwfv02yv': {
      'en': 'Event Name is required',
      'es': '',
      'hi': '',
    },
    'bh9hauac': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '6sfz7sxs': {
      'en': '1 is required',
      'es': '',
      'hi': '',
    },
    '2iuiv28p': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'yepedemk': {
      'en': 'FirstName is required',
      'es': '',
      'hi': '',
    },
    'o6znmsxl': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ejdrqem7': {
      'en': 'Last Name is required',
      'es': '',
      'hi': '',
    },
    'xlooz47x': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'fbhcf78f': {
      'en': 'Age is required',
      'es': '',
      'hi': '',
    },
    '9pk47fwm': {
      'en': 'Invalid Input',
      'es': '',
      'hi': '',
    },
    '7hym29jo': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'l2tqlozu': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    '7v2hvg1i': {
      'en': 'Date And Time',
      'es': '',
      'hi': '',
    },
    'glvv82ar': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    '9cbunmu7': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'w6adiqtk': {
      'en': 'Skip',
      'es': '',
      'hi': '',
    },
    'dycgh7wu': {
      'en': 'Address',
      'es': '',
      'hi': '',
    },
    'nf0m1yt0': {
      'en': 'Type Street Address ....',
      'es': '',
      'hi': '',
    },
    'bu28qv4m': {
      'en': 'Building Number',
      'es': '',
      'hi': '',
    },
    'w4c198u3': {
      'en': 'Postal Code',
      'es': '',
      'hi': '',
    },
    'urwwl4tx': {
      'en': 'Floor/Section',
      'es': '',
      'hi': '',
    },
    'u0y2shk5': {
      'en': 'Street Name',
      'es': '',
      'hi': '',
    },
    'nuu6vkut': {
      'en': 'City/Town',
      'es': '',
      'hi': '',
    },
    '8gumovgo': {
      'en': 'State',
      'es': '',
      'hi': '',
    },
    'dhr82o77': {
      'en': 'Country',
      'es': '',
      'hi': '',
    },
    'pbsr4ttd': {
      'en': 'Local Area',
      'es': '',
      'hi': '',
    },
    '5wibzghc': {
      'en': 'Alternate Date 1',
      'es': '',
      'hi': '',
    },
    'bj34crta': {
      'en': 'Alternate Date 2',
      'es': '',
      'hi': '',
    },
    'o2jeux0s': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'y86zqmyj': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'wo66neck': {
      'en': 'Additional Details',
      'es': '',
      'hi': '',
    },
    'e0mbgizs': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
    '9v5gb8c4': {
      'en': 'Theme Category :',
      'es': '',
      'hi': '',
    },
    'me221c5r': {
      'en': 'Select Theme Category',
      'es': '',
      'hi': '',
    },
    'qa3iww95': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'vs2qn9fi': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'pqms444l': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'gp4tbqam': {
      'en': 'Enter Theme Name',
      'es': '',
      'hi': '',
    },
    'k2d7oc8y': {
      'en': 'Select Event Status',
      'es': '',
      'hi': '',
    },
    '40m0bev5': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'kr6y80ir': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'jvf6qlvq': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    't8cyl6vy': {
      'en': 'TotalCost',
      'es': '',
      'hi': '',
    },
    's068ohzs': {
      'en': 'TotalCost',
      'es': '',
      'hi': '',
    },
    'wh7m69vo': {
      'en': 'Budget',
      'es': '',
      'hi': '',
    },
    'yds73gvl': {
      'en': 'Budget',
      'es': '',
      'hi': '',
    },
    'xoqj4b5h': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'v8wxi5xi': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
  },
  // ShoppingCartSummaryCopy
  {
    'hpykbrx4': {
      'en': 'Shopping Cart',
      'es': '',
      'hi': '',
    },
    'vq68bv2i': {
      'en': 'Event Summary',
      'es': '',
      'hi': 'आदेश सारांश',
    },
    'wvaicbk4': {
      'en': 'Total Price',
      'es': '',
      'hi': 'कुल',
    },
    'yax69cst': {
      'en': 'Clear cart',
      'es': '',
      'hi': 'निकालना',
    },
    'o3g1e24q': {
      'en': 'Venue',
      'es': '',
      'hi': 'आपका कार्ट',
    },
    '1m4hl339': {
      'en': 'Rental',
      'es': '',
      'hi': 'आपका कार्ट',
    },
    'o3os3df2': {
      'en': 'Entertainer',
      'es': '',
      'hi': 'आपका कार्ट',
    },
    'kz1fuicj': {
      'en': 'Custom Cake',
      'es': '',
      'hi': 'आपका कार्ट',
    },
    'rhaodcmd': {
      'en': 'Cake',
      'es': '',
      'hi': 'आपका कार्ट',
    },
    'klwz39q8': {
      'en': 'Price Breakdown',
      'es': '',
      'hi': 'आदेश सारांश',
    },
    'hvkc92fq': {
      'en': 'Email ',
      'es': '',
      'hi': '',
    },
    'd48y2j6y': {
      'en': 'TextField',
      'es': '',
      'hi': '',
    },
    '6kxmxr2t': {
      'en': 'Phone',
      'es': '',
      'hi': '',
    },
    '8n8ua184': {
      'en': 'TextField',
      'es': '',
      'hi': '',
    },
    'kzlz8lsc': {
      'en': 'Pay only minimum deposit for available requests',
      'es': '',
      'hi': '',
    },
    '1amjgswt': {
      'en': 'Send confirmation via SMS',
      'es': '',
      'hi': '',
    },
    'd33gd8fd': {
      'en': 'Email  is required',
      'es': '',
      'hi': '',
    },
    'vnqeo8y9': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'sjhp1sqr': {
      'en': 'Phone is required',
      'es': '',
      'hi': '',
    },
    '98eur114': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '0onbrkuu': {
      'en': 'Checkout',
      'es': '',
      'hi': 'चेकआउट जारी रखें',
    },
    'p3d01ipe': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // EventInfoForShoppingCart
  {
    '1ts7xg4h': {
      'en': 'Event Details',
      'es': '',
      'hi': '',
    },
    'a75tx7rp': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'yog334fv': {
      'en': 'Enter Event Name',
      'es': '',
      'hi': '',
    },
    '15xsf4nb': {
      'en': 'Celebration Type...',
      'es': '',
      'hi': '',
    },
    'i8fo3qg6': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'rdd00j1o': {
      'en': 'Inquiry',
      'es': '',
      'hi': '',
    },
    'nsfydpfm': {
      'en': 'Enter your inquiry here',
      'es': '',
      'hi': '',
    },
    'd4t144rk': {
      'en': 'Guests',
      'es': '',
      'hi': '',
    },
    'bpkzd0x6': {
      'en': 'Kids',
      'es': '',
      'hi': '',
    },
    'oo67fcd7': {
      'en': 'Adults',
      'es': '',
      'hi': '',
    },
    'lcp6c774': {
      'en': 'Total Invitees',
      'es': '',
      'hi': '',
    },
    'hc8vrx3b': {
      'en': 'Celebratee ',
      'es': '',
      'hi': '',
    },
    'l0p4zhsu': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'kjj79e31': {
      'en': 'Enter Celebratee Name',
      'es': '',
      'hi': '',
    },
    'fl8wxjvx': {
      'en': 'Enter Celebratee Last Name',
      'es': '',
      'hi': '',
    },
    'ypt2tup7': {
      'en': 'Gender',
      'es': '',
      'hi': '',
    },
    'j762h6o2': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'y7czdbhj': {
      'en': 'Celebratee Age',
      'es': '',
      'hi': '',
    },
    'f68p2j2f': {
      'en': 'Enter Event Name is required',
      'es': '',
      'hi': '',
    },
    '6bqab83g': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'i69slgg3': {
      'en': 'Enter your inquiry here is required',
      'es': '',
      'hi': '',
    },
    'egokwzbs': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'zdxhlsoi': {
      'en': 'Enter Celebratee Name is required',
      'es': '',
      'hi': '',
    },
    'ur9qwwk3': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'fln04szv': {
      'en': 'Enter Celebratee Last Name is required',
      'es': '',
      'hi': '',
    },
    'lig1nbh8': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'j3k6isby': {
      'en': 'Celebratee Age is required',
      'es': '',
      'hi': '',
    },
    'ljpe1u9d': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'tkw2fsiy': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'objhvpcs': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'mo547pii': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'spzsftk1': {
      'en': 'Theme',
      'es': '',
      'hi': '',
    },
    '6gmvfafs': {
      'en': 'Has Theme :',
      'es': '',
      'hi': '',
    },
    'iszmzk1u': {
      'en': 'Theme Category',
      'es': '',
      'hi': '',
    },
    'n2yoxsdr': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'okva6e55': {
      'en': 'Enter Theme',
      'es': '',
      'hi': '',
    },
    'rnmea9os': {
      'en': 'Alternate Date',
      'es': '',
      'hi': '',
    },
    'v5mrve5q': {
      'en': 'Alternate date 1 ',
      'es': '',
      'hi': '',
    },
    'how3kjm5': {
      'en': 'Alternate date 2',
      'es': '',
      'hi': '',
    },
    'gq14x713': {
      'en': 'Alternate Date 1',
      'es': '',
      'hi': '',
    },
    'jiv9oi2s': {
      'en': 'Alternate Date 2',
      'es': '',
      'hi': '',
    },
    'q76i13bg': {
      'en': 'OtherDetails',
      'es': '',
      'hi': '',
    },
    '64u4j34f': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
    'ioztfr0p': {
      'en': 'Event Status',
      'es': '',
      'hi': '',
    },
    'x1ixlvrx': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '8jqhyzdg': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    '8vlnpzf8': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    'j2b24yg5': {
      'en': 'Skip',
      'es': '',
      'hi': '',
    },
    'xf63u505': {
      'en': 'Address',
      'es': '',
      'hi': '',
    },
    'ozd98cqj': {
      'en': 'Type Street Address ....',
      'es': '',
      'hi': '',
    },
    'y39wm9f1': {
      'en': 'Building Number',
      'es': '',
      'hi': '',
    },
    'cet20nrx': {
      'en': 'Postal Code',
      'es': '',
      'hi': '',
    },
    'wo3igxf5': {
      'en': 'Floor/Section',
      'es': '',
      'hi': '',
    },
    'ndj00ybk': {
      'en': 'Street Name',
      'es': '',
      'hi': '',
    },
    '9umg2isn': {
      'en': 'City/Town',
      'es': '',
      'hi': '',
    },
    'doq9c9xj': {
      'en': 'State',
      'es': '',
      'hi': '',
    },
    'hq5fa0sn': {
      'en': 'Country',
      'es': '',
      'hi': '',
    },
    'nwoib6zc': {
      'en': 'Local Area',
      'es': '',
      'hi': '',
    },
    '4a5mefx8': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'cssv9i0q': {
      'en': 'next',
      'es': '',
      'hi': '',
    },
    'gmim3jq2': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // allRental
  {
    '092vf2km': {
      'en': 'Search',
      'es': 'Buscar',
      'hi': 'खोज',
    },
    '9d5xygxc': {
      'en': 'Search for rental Item',
      'es': 'Buscar lugares...',
      'hi': 'स्थानों की खोज करें...',
    },
    'oo8ean5e': {
      'en': 'Category',
      'es': 'Lugar/Actividad',
      'hi': 'स्थान/गतिविधि',
    },
    'oypdki2f': {
      'en': 'Sort By',
      'es': 'Ordenar por',
      'hi': 'इसके अनुसार क्रमबद्ध करें',
    },
    's46brnhx': {
      'en': 'Rental',
      'es': 'Lugares',
      'hi': 'स्थानों',
    },
    'lq1j42uf': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // customCakeDeliveryTab
  {
    'lo0p1whz': {
      'en': 'Price',
      'es': '',
      'hi': '',
    },
    'l7vj7ey4': {
      'en': 'Quantity',
      'es': '',
      'hi': '',
    },
    '7t4ks2t9': {
      'en': 'Cake Message',
      'es': '',
      'hi': '',
    },
    'csh6cnto': {
      'en': 'Enter Cake Message here',
      'es': '',
      'hi': '',
    },
    'hidtz7i5': {
      'en': 'Cake message Color ',
      'es': '',
      'hi': '',
    },
    'b9euyc1d': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    'deawq2tz': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '5gm42kh7': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'ksqnv7ls': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'qgfewomm': {
      'en': 'Option 3',
      'es': '',
      'hi': '',
    },
    'i5agzqtn': {
      'en': 'Delivery Details',
      'es': '',
      'hi': 'आदेश सारांश',
    },
    'hzqy70ka': {
      'en': 'Delivery Type',
      'es': '',
      'hi': '',
    },
    '5ucijkbm': {
      'en': 'Delivery',
      'es': '',
      'hi': '',
    },
    'x815hdwa': {
      'en': 'Pick up',
      'es': '',
      'hi': '',
    },
    'bpr8u0j2': {
      'en': 'Type Street Address ....',
      'es': '',
      'hi': '',
    },
    'fz9hgg9s': {
      'en': 'Standard Distance ',
      'es': '',
      'hi': '',
    },
    'mr9lbfp7': {
      'en': 'Standard Rate ',
      'es': '',
      'hi': '',
    },
    'xpab1kof': {
      'en': 'Current Travel Distance ',
      'es': '',
      'hi': '',
    },
    'mhzl9sn9': {
      'en': 'Travel Delivery Rate ',
      'es': '',
      'hi': '',
    },
    'ub1010qi': {
      'en': 'Travel Fees',
      'es': '',
      'hi': '',
    },
    'd7p3icce': {
      'en': 'Total Price ',
      'es': '',
      'hi': '',
    },
    'monasvvj': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    '32ryc7ld': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // FamilyMemberForm
  {
    'sr4zf4ye': {
      'en': 'Relation',
      'es': '',
      'hi': '',
    },
    'xxfcrf51': {
      'en': 'Select Relation...',
      'es': '',
      'hi': '',
    },
    'dnv72kth': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'x1y2b30q': {
      'en': 'Gender',
      'es': '',
      'hi': '',
    },
    'm2df277t': {
      'en': 'Select Gender ...',
      'es': '',
      'hi': '',
    },
    'a9j9wymi': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '0l3n47sg': {
      'en': 'Male',
      'es': '',
      'hi': '',
    },
    '057ddnhs': {
      'en': 'Female',
      'es': '',
      'hi': '',
    },
    '2rpxlmka': {
      'en': 'Date of Birth',
      'es': '',
      'hi': '',
    },
    'u8hhh2jg': {
      'en': 'Date of Birth',
      'es': '',
      'hi': '',
    },
    'l0j3pb4i': {
      'en': 'First Name',
      'es': '',
      'hi': '',
    },
    'pgavg6za': {
      'en': '*',
      'es': '',
      'hi': '',
    },
    'x1i5wi1v': {
      'en': 'Middle Name',
      'es': '',
      'hi': '',
    },
    'l56rgwi2': {
      'en': 'Last Name',
      'es': '',
      'hi': '',
    },
    'p5b8i1kv': {
      'en': 'Email',
      'es': '',
      'hi': '',
    },
    'wtszf6bo': {
      'en': 'Mobile Number',
      'es': '',
      'hi': '',
    },
    'yrorvkrn': {
      'en': 'Phone Number',
      'es': '',
      'hi': '',
    },
    'uzn5f5pr': {
      'en': 'More Details',
      'es': '',
      'hi': '',
    },
    'zcwy0h72': {
      'en': 'Street Address',
      'es': '',
      'hi': '',
    },
    '0wztbzwr': {
      'en': 'Building Number',
      'es': '',
      'hi': '',
    },
    'qlldx2yf': {
      'en': 'Postal Code',
      'es': '',
      'hi': '',
    },
    'a84npwja': {
      'en': 'Floor/Section',
      'es': '',
      'hi': '',
    },
    '7dpu3vcf': {
      'en': 'Street Name',
      'es': '',
      'hi': '',
    },
    '6smca8i6': {
      'en': 'City/Town',
      'es': '',
      'hi': '',
    },
    '1chpklvd': {
      'en': 'State',
      'es': '',
      'hi': '',
    },
    'oogegx12': {
      'en': 'Country',
      'es': '',
      'hi': '',
    },
    'sam0yqh2': {
      'en': 'Local Area',
      'es': '',
      'hi': '',
    },
    '6o0jnhjc': {
      'en': 'Special Needs',
      'es': '',
      'hi': '',
    },
    's0smv3w5': {
      'en': 'Allergy',
      'es': '',
      'hi': '',
    },
    'fn4b6osl': {
      'en': 'Education',
      'es': '',
      'hi': '',
    },
    'kzy0k4qi': {
      'en': 'Select Education ...',
      'es': '',
      'hi': '',
    },
    'tc20j4y7': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'hj0rjupj': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    '3d6psros': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'vmyke1gf': {
      'en': 'Interest',
      'es': '',
      'hi': '',
    },
    'zjr9i72b': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
    'fd2saeyx': {
      'en': 'Date of Birth is required',
      'es': '',
      'hi': '',
    },
    'w9amjmjr': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'q998jsbk': {
      'en': 'FirstName is  required',
      'es': '',
      'hi': '',
    },
    'q5hbtvbj': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'jydrkbbn': {
      'en': 'Last Name is required',
      'es': '',
      'hi': '',
    },
    '1llvuz4a': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'zrdlgxja': {
      'en': 'Last Name is required',
      'es': '',
      'hi': '',
    },
    'upby83ub': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '1shu10xv': {
      'en': 'Email is required',
      'es': '',
      'hi': '',
    },
    '5iww8g7a': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'qctaijgm': {
      'en': 'Mobile Number is required',
      'es': '',
      'hi': '',
    },
    'tq6jd5t5': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ydeaestc': {
      'en': 'Phone Number is required',
      'es': '',
      'hi': '',
    },
    'e3hvdkma': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'sy87b3iw': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    't3gj1lil': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ndmzpwrs': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '6juuwkhb': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ql1izx23': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '10kynynd': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'iw24om1q': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'x9oerrz4': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '5i163ceh': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '9fjy79ff': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '876l9apr': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'yrjhp4ml': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '0h481m2e': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '7822kfoc': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ebyhxhlp': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '30gpxuib': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '8txyqaou': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'lx9exoep': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'k9spo6db': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'g4kgteha': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '1vjzgtao': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'oybboq9p': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '8pyd9sdn': {
      'en': 'Save',
      'es': '',
      'hi': '',
    },
    'i8x9i3us': {
      'en': 'Family Member Form',
      'es': '',
      'hi': '',
    },
  },
  // FriendList
  {
    '6wagerdy': {
      'en': 'Friend Members',
      'es': '',
      'hi': '',
    },
    'o20kpyq8': {
      'en': 'Add friend to share your plan',
      'es': '',
      'hi': '',
    },
    'tc90k1sw': {
      'en': 'Add Friend ',
      'es': '',
      'hi': '',
    },
    'a43vkf68': {
      'en': 'Add From Contact',
      'es': '',
      'hi': '',
    },
  },
  // FriendForm
  {
    'w61s5clb': {
      'en': 'Friend Of',
      'es': '',
      'hi': '',
    },
    'f5s9i39v': {
      'en': 'Select friend .....',
      'es': '',
      'hi': '',
    },
    '41rkjq6r': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'get92ncy': {
      'en': 'Gender',
      'es': '',
      'hi': '',
    },
    'x5cbt4lu': {
      'en': 'Select Gender ...',
      'es': '',
      'hi': '',
    },
    '2gwxotso': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'its3sfkn': {
      'en': 'Male',
      'es': '',
      'hi': '',
    },
    'yubqwze4': {
      'en': 'Female',
      'es': '',
      'hi': '',
    },
    '8wm0424s': {
      'en': 'Date of Birth',
      'es': '',
      'hi': '',
    },
    '2imtnsll': {
      'en': 'Date of Birth',
      'es': '',
      'hi': '',
    },
    'p95m8304': {
      'en': 'First Name',
      'es': '',
      'hi': '',
    },
    'g2qvixjv': {
      'en': '*',
      'es': '',
      'hi': '',
    },
    'jfw3fx2s': {
      'en': 'Middle Name',
      'es': '',
      'hi': '',
    },
    'g0nfwikr': {
      'en': 'Last Name',
      'es': '',
      'hi': '',
    },
    'e299q2h5': {
      'en': 'Email',
      'es': '',
      'hi': '',
    },
    'wwcjg87b': {
      'en': 'Mobile Number',
      'es': '',
      'hi': '',
    },
    '2mc62fnk': {
      'en': 'Phone Number',
      'es': '',
      'hi': '',
    },
    '4iixeb89': {
      'en': 'More Details',
      'es': '',
      'hi': '',
    },
    'q5ht6w9g': {
      'en': 'Street Address',
      'es': '',
      'hi': '',
    },
    'm9ih790s': {
      'en': 'Building Number',
      'es': '',
      'hi': '',
    },
    '69m8cs8p': {
      'en': 'Postal Code',
      'es': '',
      'hi': '',
    },
    'qp7xrglq': {
      'en': 'Floor/Section',
      'es': '',
      'hi': '',
    },
    '98ecn9bk': {
      'en': 'Street Name',
      'es': '',
      'hi': '',
    },
    'bwksb8l7': {
      'en': 'City/Town',
      'es': '',
      'hi': '',
    },
    'an13t1z3': {
      'en': 'State',
      'es': '',
      'hi': '',
    },
    'dq1f52uv': {
      'en': 'Country',
      'es': '',
      'hi': '',
    },
    '56fww2w5': {
      'en': 'Local Area',
      'es': '',
      'hi': '',
    },
    'csnsym5y': {
      'en': 'Special Needs',
      'es': '',
      'hi': '',
    },
    'qkweupd6': {
      'en': 'Allergy',
      'es': '',
      'hi': '',
    },
    '9i5brcnh': {
      'en': 'Education',
      'es': '',
      'hi': '',
    },
    '5fdae54p': {
      'en': 'Select Education',
      'es': '',
      'hi': '',
    },
    'qz6so8yp': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '2vccgte6': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'yr156z57': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'u2ayo7jb': {
      'en': 'Interest',
      'es': '',
      'hi': '',
    },
    'espaosw9': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
    'whskgwtk': {
      'en': 'Date of Birth is required',
      'es': '',
      'hi': '',
    },
    'wxrkhan6': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'ug9ulwpd': {
      'en': 'FirstName is  required',
      'es': '',
      'hi': '',
    },
    'xdijoaiu': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'wwyely1y': {
      'en': 'Last Name is required',
      'es': '',
      'hi': '',
    },
    'kphw6l7z': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '1uu03c4x': {
      'en': 'Last Name is required',
      'es': '',
      'hi': '',
    },
    'ezh5ecka': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '0f79g0bz': {
      'en': 'Email is required',
      'es': '',
      'hi': '',
    },
    '5itldvc1': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '9s6dryvm': {
      'en': 'Mobile Number is required',
      'es': '',
      'hi': '',
    },
    '5ridoss3': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'quh0bhs4': {
      'en': 'Phone Number is required',
      'es': '',
      'hi': '',
    },
    '5b1z8jdu': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '8b99xvz7': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'oxvmu20b': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'xepydm3c': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'pxbc0ekt': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'mlru1k14': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'xzfff5d2': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '39ezpto3': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '16u0wrr2': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'fofy2277': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '30wbp94z': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'qiz5v5ko': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'yqou3uv4': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    '4ot2ap83': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '5figphoe': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'a0orfv5r': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'j5lpyo1n': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'cjv7wiij': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    '18nt21wo': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'thec7kp9': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'qf3y5dq1': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'hpum8sn9': {
      'en': 'Field is required',
      'es': '',
      'hi': '',
    },
    'vmad0wzq': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'dr2yf2rd': {
      'en': 'Save',
      'es': '',
      'hi': '',
    },
    'u47dnyo0': {
      'en': 'Friend  Form',
      'es': '',
      'hi': '',
    },
  },
  // AllChats
  {
    'ia9n5jp9': {
      'en': 'Messages',
      'es': '',
      'hi': '',
    },
    'rdxg3s5s': {
      'en': 'All',
      'es': '',
      'hi': '',
    },
    'adn29t8x': {
      'en': 'Unseen',
      'es': '',
      'hi': '',
    },
    'g5mp783e': {
      'en': 'Venue',
      'es': '',
      'hi': '',
    },
    'j7wclpao': {
      'en': 'Rental',
      'es': '',
      'hi': '',
    },
    '147sibdn': {
      'en': 'Entertainer',
      'es': '',
      'hi': '',
    },
    't5vicl2z': {
      'en': 'Cake',
      'es': '',
      'hi': '',
    },
    'zctak6cz': {
      'en': 'Food',
      'es': '',
      'hi': '',
    },
    'i39s87ey': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // contactListForFriend
  {
    'r0osyvz2': {
      'en': 'Add contacts',
      'es': '',
      'hi': '',
    },
    '2nodg3tp': {
      'en': 'Search contacts...',
      'es': '',
      'hi': '',
    },
    'j111yj1b': {
      'en': 'Add Family Member',
      'es': '',
      'hi': '',
    },
    'vk78a83h': {
      'en': 'Add  Friend',
      'es': '',
      'hi': '',
    },
  },
  // ChatDetail
  {
    '2fqb49n2': {
      'en': 'TextField',
      'es': '',
      'hi': '',
    },
    '8wrfnoi2': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // vendorOrderPage
  {
    '8l9x3zxl': {
      'en': 'Requests',
      'es': '',
      'hi': '',
    },
    '5v4shoad': {
      'en': 'Orders',
      'es': '',
      'hi': '',
    },
    'f8ffyppj': {
      'en': 'Customers',
      'es': '',
      'hi': '',
    },
    '10u2scc1': {
      'en': 'Prospects',
      'es': '',
      'hi': '',
    },
    'pf2ubvqj': {
      'en': 'Inquiry',
      'es': '',
      'hi': '',
    },
    'yys93i1a': {
      'en': '  Request  ',
      'es': '',
      'hi': 'कार्यक्रम का स्थान',
    },
    'bnvrlwdk': {
      'en': '    Orders   ',
      'es': '',
      'hi': 'किराये',
    },
    'rxn4xlm5': {
      'en': 'Prospects',
      'es': '',
      'hi': 'मनोरंजन',
    },
    'pf231t2i': {
      'en': ' Customer ',
      'es': '',
      'hi': 'केक',
    },
    'v052shtu': {
      'en': 'Order',
      'es': '',
      'hi': 'खोज',
    },
    'gmm96y47': {
      'en': 'Search',
      'es': '',
      'hi': 'खोज',
    },
  },
  // vendorAllEmployees
  {
    'l69ftxy0': {
      'en': 'All Employees',
      'es': '',
      'hi': '',
    },
    'q550pyuj': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // vendorRequest
  {
    '3o2llv9s': {
      'en': 'Submission Date',
      'es': 'Lugar/Actividad',
      'hi': 'स्थान/गतिविधि',
    },
    'fqbpwfij': {
      'en': 'Cart Status',
      'es': 'Lugar/Actividad',
      'hi': 'स्थान/गतिविधि',
    },
    'upzaxk28': {
      'en': 'Prospect Name',
      'es': 'Lugar/Actividad',
      'hi': 'स्थान/गतिविधि',
    },
    '9nwhfo60': {
      'en': 'Prospect email',
      'es': 'Lugar/Actividad',
      'hi': 'स्थान/गतिविधि',
    },
    'l8mtheiz': {
      'en': 'Respond',
      'es': '',
      'hi': '',
    },
    '1lfsrycz': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // respondRequestList
  {
    'yoxzd40l': {
      'en': 'Requests',
      'es': '',
      'hi': '',
    },
    'q8pkbhe7': {
      'en': 'Event Summary',
      'es': '',
      'hi': 'आदेश सारांश',
    },
    'xo0mtep9': {
      'en': 'kid :',
      'es': '',
      'hi': '',
    },
    'k0qsnpxh': {
      'en': 'Adult :',
      'es': '',
      'hi': '',
    },
    'wzcrf3d4': {
      'en': 'Total  :',
      'es': '',
      'hi': '',
    },
    'nzjp7n7z': {
      'en': 'Select Requests to proceed',
      'es': '',
      'hi': '',
    },
    '0wqm72e2': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
    '28ytc9bn': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // linkRenderPage
  {
    'bujqeeta': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // respondRequestChoiceTabSet
  {
    'qqh7wnam': {
      'en': 'Respond',
      'es': '',
      'hi': '',
    },
    'tw0592kk': {
      'en': 'Accept',
      'es': '',
      'hi': '',
    },
    '9g2exf5e': {
      'en': 'Comments',
      'es': '',
      'hi': '',
    },
    'vo77czh1': {
      'en': 'TextField',
      'es': '',
      'hi': '',
    },
    'htbtwvrr': {
      'en': 'Pay within days : ',
      'es': '',
      'hi': '',
    },
    'km8xioao': {
      'en': 'Payment Type',
      'es': '',
      'hi': '',
    },
    '3k6c27d3': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    'd3mik9s4': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'xkejqaqy': {
      'en': 'Minimum Deposit',
      'es': '',
      'hi': '',
    },
    '54wkcikd': {
      'en': 'Full Payment',
      'es': '',
      'hi': '',
    },
    '066padv4': {
      'en': 'Cancel',
      'es': '',
      'hi': '',
    },
    '2v00vflu': {
      'en': 'Submit',
      'es': '',
      'hi': '',
    },
    'm6ndmwn3': {
      'en': 'TextField is required',
      'es': '',
      'hi': '',
    },
    'egokwzbs': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'r5e9ou2k': {
      'en': 'Suggest',
      'es': '',
      'hi': '',
    },
    'm88tq89u': {
      'en': 'Price :',
      'es': '',
      'hi': '',
    },
    'o3rmsbmk': {
      'en': 'TextField',
      'es': '',
      'hi': '',
    },
    'acd4e4da': {
      'en': 'Comments',
      'es': '',
      'hi': '',
    },
    'd08k728x': {
      'en': 'TextField',
      'es': '',
      'hi': '',
    },
    '2fq170sm': {
      'en': 'Pay within days : ',
      'es': '',
      'hi': '',
    },
    'tofnhxq3': {
      'en': 'Payment Type',
      'es': '',
      'hi': '',
    },
    '0q69o86i': {
      'en': 'Select...',
      'es': '',
      'hi': '',
    },
    'w30bjk3x': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'msb6vn7d': {
      'en': 'Minimum Deposit',
      'es': '',
      'hi': '',
    },
    'l9eyr64i': {
      'en': 'Full Payment',
      'es': '',
      'hi': '',
    },
    'pnglf8em': {
      'en': 'Cancel',
      'es': '',
      'hi': '',
    },
    '5u2chocj': {
      'en': 'Submit',
      'es': '',
      'hi': '',
    },
    'ur3dw69u': {
      'en': 'Reject',
      'es': '',
      'hi': '',
    },
    'q75k5t5g': {
      'en': 'Comments',
      'es': '',
      'hi': '',
    },
    '1zwlqpyb': {
      'en': 'TextField',
      'es': '',
      'hi': '',
    },
    'o83s8xyx': {
      'en': 'Cancel',
      'es': '',
      'hi': '',
    },
    '51ljy07b': {
      'en': 'Submit',
      'es': '',
      'hi': '',
    },
    '7obucs2h': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // vendorDashboard
  {
    'ryezb5ew': {
      'en': 'Dashboard',
      'es': '',
      'hi': '',
    },
    'a964g34u': {
      'en': 'Overview',
      'es': '',
      'hi': '',
    },
    'bu7lcw0r': {
      'en': 'This Week',
      'es': '',
      'hi': '',
    },
    'u73zgqoa': {
      'en': '  Filter by date',
      'es': '',
      'hi': '',
    },
    '2a8wgfs3': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'avnt4iog': {
      'en': 'Today',
      'es': '',
      'hi': '',
    },
    'bq632g2v': {
      'en': 'This Week',
      'es': '',
      'hi': '',
    },
    '2f92xj66': {
      'en': 'This Month',
      'es': '',
      'hi': '',
    },
    'wzpvripa': {
      'en': 'Last 3 Months',
      'es': '',
      'hi': '',
    },
    '5mjup05p': {
      'en': 'No Data available',
      'es': '',
      'hi': '',
    },
    '498h7875': {
      'en': 'Total Orders',
      'es': '',
      'hi': '',
    },
    'sk6nkgtk': {
      'en': 'Open Requests',
      'es': '',
      'hi': '',
    },
    'euajm47t': {
      'en': 'Total Revenue',
      'es': '',
      'hi': '',
    },
    'ycbg2uok': {
      'en': 'Inquires',
      'es': '',
      'hi': '',
    },
    'e5oinrmk': {
      'en': 'New Prospects',
      'es': '',
      'hi': '',
    },
    'hishf2f6': {
      'en': 'Total Customers',
      'es': '',
      'hi': '',
    },
    'akyhwdky': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // vendorAllOrderDetails
  {
    'eqkku62w': {
      'en': 'Item List',
      'es': '',
      'hi': '',
    },
    'x3v99gna': {
      'en': 'Add on List',
      'es': '',
      'hi': '',
    },
    'jikwd67s': {
      'en': 'Order Details',
      'es': '',
      'hi': '',
    },
    '8y8uq9cc': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // vendorSchedule
  {
    'r0d2gbgf': {
      'en': 'Event ',
      'es': '',
      'hi': 'कार्यक्रम का स्थान',
    },
    '3w7f6ude': {
      'en': 'Employee',
      'es': '',
      'hi': 'किराये',
    },
    '45sfqy27': {
      'en': 'Room',
      'es': '',
      'hi': 'मनोरंजन',
    },
    'n6dy0p68': {
      'en': 'Rental Item',
      'es': '',
      'hi': 'केक',
    },
    '5u3dmwfx': {
      'en': 'Schedule',
      'es': '',
      'hi': 'खोज',
    },
    '68k6q526': {
      'en': 'Search',
      'es': '',
      'hi': 'खोज',
    },
  },
  // vendorInquiryResponse
  {
    'olm8ls7l': {
      'en': 'Inquiry Response',
      'es': '',
      'hi': '',
    },
    '33eds7cb': {
      'en': 'Enter your response to consumer',
      'es': '',
      'hi': '',
    },
    'jae5oi0t': {
      'en': 'Submit',
      'es': '',
      'hi': '',
    },
    'jbubz8kg': {
      'en': 'Home',
      'es': '',
      'hi': '',
    },
  },
  // errorCompoent
  {
    'pexri6r8': {
      'en': 'No results found',
      'es': 'No se encontraron resultados',
      'hi': 'कोई परिणाम नहीं मिला',
    },
    'ulkqnrae': {
      'en': 'No item found your search criteria',
      'es': 'No se encontró ningún artículo según sus criterios de búsqueda',
      'hi': 'आपके खोज मानदंड के अनुसार कोई आइटम नहीं मिला',
    },
  },
  // distanceComp
  {
    'nx362c62': {
      'en': 'Distance',
      'es': '',
      'hi': 'दूरी',
    },
    'nqrn62oh': {
      'en': '2 Mile',
      'es': '',
      'hi': '2 मील',
    },
    'uz20iv41': {
      'en': '5 Mile',
      'es': '',
      'hi': '5 मील',
    },
    'ygtavqza': {
      'en': '10 Mile',
      'es': '',
      'hi': '10 मील',
    },
    'iyjxg671': {
      'en': '25 Mile',
      'es': '',
      'hi': '25 मील',
    },
    'oa8s8fx5': {
      'en': '50 Mile',
      'es': '',
      'hi': '50 मील',
    },
    '6mizrrr8': {
      'en': '100 Mile',
      'es': '',
      'hi': '100 मील',
    },
    'nx20icap': {
      'en': 'No Limits',
      'es': '',
      'hi': 'असीम',
    },
    'w6775frd': {
      'en': 'Apply',
      'es': '',
      'hi': 'आवेदन करना',
    },
  },
  // viewByComp
  {
    'xe5lto43': {
      'en': 'View By',
      'es': '',
      'hi': 'इसके अनुसार क्रमबद्ध करें',
    },
    '8pc7p3oo': {
      'en': 'Desc',
      'es': '',
      'hi': 'प्रासंगिकता',
    },
    'jbz6hrrq': {
      'en': 'Asc',
      'es': '',
      'hi': 'कीमत',
    },
    'hndqaiy0': {
      'en': 'Relevance',
      'es': '',
      'hi': 'प्रासंगिकता',
    },
    'i2cblswf': {
      'en': 'Price',
      'es': '',
      'hi': 'कीमत',
    },
    'njky8dk6': {
      'en': 'Distance',
      'es': '',
      'hi': 'दूरी',
    },
    'fg7y4903': {
      'en': 'Ranking',
      'es': '',
      'hi': 'श्रेणी',
    },
    '960pomru': {
      'en': 'Apply',
      'es': '',
      'hi': 'आवेदन करना',
    },
  },
  // placeActivityComp
  {
    'fqnroaxu': {
      'en': '  2 Mile             ',
      'es': '',
      'hi': '2 मील',
    },
    '67zhftly': {
      'en': '  5 Mile            ',
      'es': '',
      'hi': '5 मील',
    },
    'omw64oom': {
      'en': '  10 Mile          ',
      'es': '',
      'hi': '10 मील',
    },
    'mcw6gty7': {
      'en': '  25 Mile             ',
      'es': '',
      'hi': '25 मील',
    },
    'oqgc6vuf': {
      'en': '  50 Mile          ',
      'es': '',
      'hi': '50 मील',
    },
    'q2q2rsyl': {
      'en': '  100 Mile        ',
      'es': '',
      'hi': '100 मील',
    },
    'yrz7arhi': {
      'en': '  No Limits     ',
      'es': '',
      'hi': 'असीम',
    },
    'ybkfvedk': {
      'en': 'Apply',
      'es': '',
      'hi': 'आवेदन करना',
    },
  },
  // errorPageViewCompoent
  {
    'ersx0x4d': {
      'en': 'Sorry !  ',
      'es': '',
      'hi': '',
    },
  },
  // emailComp
  {
    'liq221yj': {
      'en': 'Send Email',
      'es': '',
      'hi': 'ईमेल भेजें',
    },
    '9qz6g6k5': {
      'en': 'To',
      'es': '',
      'hi': 'को',
    },
    'db2kpkec': {
      'en': 'Enter recipient email',
      'es': '',
      'hi': 'प्राप्तकर्ता का ईमेल दर्ज करें',
    },
    'lr12o55b': {
      'en': 'Subject',
      'es': '',
      'hi': 'विषय',
    },
    '1sh8sg6h': {
      'en': 'Enter email subject',
      'es': '',
      'hi': 'ईमेल विषय दर्ज करें',
    },
    'w2c45j3d': {
      'en': 'Message',
      'es': '',
      'hi': 'संदेश',
    },
    'uzu3in05': {
      'en': 'Enter your message here',
      'es': '',
      'hi': 'अपना संदेश यहां दर्ज करें',
    },
    'j5rq6l8a': {
      'en': 'Send',
      'es': '',
      'hi': 'भेजना',
    },
  },
  // locationChangeComp
  {
    '1p7gmrwl': {
      'en': 'Search for area, street name...',
      'es': '',
      'hi': 'क्षेत्र, सड़क का नाम खोजें...',
    },
    'yucqjbyd': {
      'en': 'Use current location',
      'es': '',
      'hi': 'वर्तमान स्थान का उपयोग करें',
    },
    'uvcktlff': {
      'en': 'Enable location access',
      'es': '',
      'hi': 'स्थान पहुँच सक्षम करें',
    },
  },
  // LoginComp
  {
    'b418j0qo': {
      'en': 'Welcome! Login Successful',
      'es': '',
      'hi': 'स्वागत है! लॉगिन सफल',
    },
    'o8ve5non': {
      'en': 'Sign In',
      'es': '',
      'hi': 'दाखिल करना',
    },
    'x058ta0k': {
      'en': 'Email',
      'es': '',
      'hi': 'ईमेल',
    },
    'vbhkzczi': {
      'en': 'Password',
      'es': '',
      'hi': 'पासवर्ड',
    },
    '1khkv9uw': {
      'en': 'Email is required',
      'es': '',
      'hi': '',
    },
    'rxqrkcc4': {
      'en': 'Enter emailId !',
      'es': '',
      'hi': '',
    },
    '9v0kbzn7': {
      'en': 'Password is required',
      'es': '',
      'hi': '',
    },
    'g1hpl8f6': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'c4clcgrs': {
      'en': 'Forgot Password ?',
      'es': '',
      'hi': '',
    },
    'mq2qk8ry': {
      'en': 'Sign In',
      'es': '',
      'hi': 'दाखिल करना',
    },
    'kc2dexio': {
      'en': 'Or sign In with',
      'es': '',
      'hi': 'या साइन अप करें',
    },
    'jrnw6y7k': {
      'en': '',
      'es': '',
      'hi': 'Google के साथ जारी रखें',
    },
    '3dkdzgi2': {
      'en': '',
      'es': '',
      'hi': 'Google के साथ जारी रखें',
    },
  },
  // filterSample2
  {
    'ytcs8hot': {
      'en': 'Filters',
      'es': '',
      'hi': 'फिल्टर',
    },
    '6ilf5chs': {
      'en': 'Button',
      'es': '',
      'hi': 'बटन',
    },
    'swcr4rw9': {
      'en': 'Button',
      'es': '',
      'hi': 'बटन',
    },
    'jawjb90c': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'e1zzlu0j': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'm9p7puhf': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '9jhzwuba': {
      'en': 'Clear Filters',
      'es': '',
      'hi': 'फ़िल्टर साफ़ करें',
    },
    '2hj6olgy': {
      'en': 'Apply',
      'es': '',
      'hi': 'आवेदन करना',
    },
  },
  // LoadingComp
  {
    'kmd80gg7': {
      'en': 'Loading Data...',
      'es': '',
      'hi': '',
    },
    '068azivs': {
      'en': 'Please wait while we fetch your information...',
      'es': '',
      'hi': '',
    },
  },
  // GuestAccountCompoent
  {
    'sab8xd4l': {
      'en': 'Sign in to access your account',
      'es': '',
      'hi': 'अपने अकांउट तक पहुंचने के लिए साइन इन करें',
    },
    'xooz0etn': {
      'en': 'Guest User',
      'es': '',
      'hi': 'अतिथि उपयोगकर्ता',
    },
    'm1ul21ep': {
      'en':
          'Create an account to communicate with the vendors, track your requests/orders, plan your event, manage guests and get rewarded/cashback for your purchase.',
      'es': '',
      'hi':
          'अपनी प्राथमिकताओं को सहेजने, अपनी गतिविधि पर नज़र रखने और वैयक्तिकृत सुविधाओं तक पहुँचने के लिए एक खाता बनाएँ।',
    },
    'oarter59': {
      'en': 'Sign Up',
      'es': '',
      'hi': 'साइन अप करें',
    },
    'fhvg9asp': {
      'en': 'Already have an account ?',
      'es': '',
      'hi': 'अतिथि उपयोगकर्ता',
    },
    'ev812h17': {
      'en': ' Sign In',
      'es': '',
      'hi': 'पहले से ही एक खाता है? साइन इन करें',
    },
  },
  // UserMyAccountComp
  {
    '7qtkpzsm': {
      'en': 'Welcome ',
      'es': '',
      'hi': 'स्वागत',
    },
    'vvvu1v2q': {
      'en': 'Events',
      'es': '',
      'hi': 'घटनाक्रम',
    },
    'h2r0pt0n': {
      'en': 'Profile',
      'es': '',
      'hi': 'प्रोफ़ाइल',
    },
    'ne58q7as': {
      'en': 'Favorites',
      'es': '',
      'hi': 'पसंदीदा',
    },
    '9ji22plw': {
      'en': 'Requests',
      'es': '',
      'hi': 'अनुरोध',
    },
    'ylw033jj': {
      'en': 'Chat with support',
      'es': '',
      'hi': 'अनुरोध',
    },
    'sgt36wjw': {
      'en': 'Log Out',
      'es': '',
      'hi': 'लॉग आउट',
    },
  },
  // patnerComp
  {
    '7r7hdj5o': {
      'en': 'PanIQ Room - Boston',
      'es': '',
      'hi': 'PanIQ रूम - बोस्टन',
    },
    '2h06jk0l': {
      'en': 'Family Adventure & Escape Room',
      'es': '',
      'hi': 'पारिवारिक साहसिक एवं पलायन कक्ष',
    },
    'buidmd2e': {
      'en': '\$40-50',
      'es': '',
      'hi': '\$40-50',
    },
    '4a1je11q': {
      'en': '2270 Quimby Road, San Jose, CA',
      'es': '',
      'hi': '2270 क्विम्बी रोड, सैन जोस, सीए',
    },
    'vbwl5sji': {
      'en': '857-284-7767',
      'es': '',
      'hi': '857-284-7767',
    },
    'a85ykynx': {
      'en': 'Ages 10-99 Years',
      'es': '',
      'hi': 'आयु 10-99 वर्ष',
    },
    'kjn30351': {
      'en': 'Mon, Tue, Fri, Sat, Sun',
      'es': '',
      'hi': 'सोम, मंगल, शुक्र, शनि, रवि',
    },
    'bxgh3ifg': {
      'en':
          'One of the pioneers in bringing escape rooms to the US, PanIQ Room offers exciting family-friendly adventure experiences perfect for the whole family.',
      'es': '',
      'hi':
          'अमेरिका में एस्केप रूम लाने वाली अग्रणी कम्पनियों में से एक, पैनआईक्यू रूम पूरे परिवार के लिए रोमांचक पारिवारिक-अनुकूल साहसिक अनुभव प्रदान करता है।',
    },
    '93pex743': {
      'en': 'Email',
      'es': '',
      'hi': 'ईमेल',
    },
    'nqzaqx6q': {
      'en': 'Website',
      'es': '',
      'hi': 'वेबसाइट',
    },
  },
  // example
  {
    'v3jk61jk': {
      'en': 'Left Side Title',
      'es': '',
      'hi': 'बायीं ओर शीर्षक',
    },
    'r0q32rhk': {
      'en':
          'Left side description text that can wrap to multiple lines as needed.',
      'es': '',
      'hi':
          'बाईं ओर का वर्णन पाठ जिसे आवश्यकतानुसार कई पंक्तियों में लपेटा जा सकता है।',
    },
    'ryj954h5': {
      'en': 'Right Side Title',
      'es': '',
      'hi': 'दांयी ओर शीर्षक',
    },
    'vl01s01y': {
      'en':
          'Right side description text that can wrap to multiple lines as needed.',
      'es': '',
      'hi':
          'दाईं ओर विवरण पाठ जिसे आवश्यकतानुसार कई पंक्तियों में लपेटा जा सकता है।',
    },
  },
  // patnerVenueComp
  {
    'hmf3ja8z': {
      'en': 'Patner Name',
      'es': '',
      'hi': 'पार्टनर का नाम',
    },
    'svbt41kc': {
      'en': 'patner Type',
      'es': '',
      'hi': 'पैटर्न प्रकार',
    },
    '8qqxhrkg': {
      'en': '(555) 123-4567',
      'es': '',
      'hi': '(555) 123-4567',
    },
    'ux1atmxg': {
      'en': 'contact@techsolutions.com',
      'es': '',
      'hi': 'contact@techsolutions.com',
    },
    'iowlt7ci': {
      'en': 'www.techsolutions.com',
      'es': '',
      'hi': 'www.techsolutions.com',
    },
    'ecy5ra89': {
      'en': '123 Innovation Drive, Silicon Valley, CA',
      'es': '',
      'hi': '123 इनोवेशन ड्राइव, सिलिकॉन वैली, CA',
    },
    'mzva27ia': {
      'en': 'View Details',
      'es': '',
      'hi': 'विवरण देखें',
    },
  },
  // BookingPolicy
  {
    'ki8j0mbe': {
      'en': 'Minimum Deposit',
      'es': '',
      'hi': 'न्यूनतम जमा',
    },
    '3iftntmq': {
      'en': 'Cancellation Fee',
      'es': '',
      'hi': 'रद्दीकरण शुल्क',
    },
    'lh6viaon': {
      'en': 'Refund Fee',
      'es': '',
      'hi': 'वापसी शुल्क',
    },
    'ph9am5j8': {
      'en': 'Minimum Deposit Policy',
      'es': '',
      'hi': 'न्यूनतम जमा नीति',
    },
    '37dmn178': {
      'en': 'Deposite Note',
      'es': '',
      'hi': 'जमा नोट',
    },
    'n29rq8z6': {
      'en': 'Cancellation Policy',
      'es': '',
      'hi': 'रद्दीकरण नीति',
    },
    'xkne2380': {
      'en': 'Cancellation Note',
      'es': '',
      'hi': 'रद्दीकरण नोट',
    },
  },
  // FAQ
  {
    'aio5jhwa': {
      'en': 'Frequently Asked Questions',
      'es': '',
      'hi': 'अक्सर पूछे जाने वाले प्रश्नों',
    },
  },
  // GuestComp
  {
    'yog9kybc': {
      'en': 'Details',
      'es': '',
      'hi': '',
    },
  },
  // navBar
  {
    'b0g5awk8': {
      'en': '2',
      'es': '',
      'hi': '',
    },
  },
  // TimerPickerComp
  {
    'ivo34zpc': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '9izsj1rq': {
      'en': ' : ',
      'es': '',
      'hi': '',
    },
    'xoe3737g': {
      'en': 'Min',
      'es': '',
      'hi': '',
    },
    'cmunoim5': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'in2nres0': {
      'en': '0',
      'es': '',
      'hi': '',
    },
    'eiw8pdha': {
      'en': '15',
      'es': '',
      'hi': '',
    },
    '3r058qaz': {
      'en': '30',
      'es': '',
      'hi': '',
    },
    '1d8404lt': {
      'en': '45',
      'es': '',
      'hi': '',
    },
    '5o5c8xfx': {
      'en': ' : ',
      'es': '',
      'hi': '',
    },
    '19yhhpj0': {
      'en': 'AM',
      'es': '',
      'hi': '',
    },
    'hhww43b0': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'xh3adsyt': {
      'en': 'AM',
      'es': '',
      'hi': '',
    },
    '2927vuz0': {
      'en': 'PM',
      'es': '',
      'hi': '',
    },
  },
  // guestType
  {
    '9t6r93xr': {
      'en': 'Which Select Relations',
      'es': '',
      'hi': '',
    },
    'k7z8rv9d': {
      'en': 'Friend',
      'es': '',
      'hi': '',
    },
    '93qckcqb': {
      'en': 'Friend',
      'es': '',
      'hi': '',
    },
    'hdrwk23h': {
      'en': 'Family',
      'es': '',
      'hi': '',
    },
    't898l66k': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'f2vva2b7': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
  },
  // VariationSelectionComp
  {
    'ypexjisk': {
      'en': 'Select variation',
      'es': '',
      'hi': '',
    },
    '7tuscvb0': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'uxm0b7pg': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'mxan3bb8': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
  },
  // ConfirmDialogBox
  {
    'cw75cqr0': {
      'en': 'Please confirm',
      'es': '',
      'hi': '',
    },
    'pcy1q4qn': {
      'en': 'No',
      'es': '',
      'hi': '',
    },
    'qxosdmbg': {
      'en': 'Yes',
      'es': '',
      'hi': '',
    },
  },
  // LoginCompWithGuest
  {
    '7vmln82w': {
      'en': 'Welcome! Login Successful',
      'es': '',
      'hi': 'स्वागत है! लॉगिन सफल',
    },
    'bwg6ztk5': {
      'en': 'Sign In',
      'es': '',
      'hi': 'दाखिल करना',
    },
    'jjm2iuxj': {
      'en': 'Email',
      'es': '',
      'hi': 'ईमेल',
    },
    '49pnm1wp': {
      'en': 'Password',
      'es': '',
      'hi': 'पासवर्ड',
    },
    '64o4eqs0': {
      'en': 'Email is required',
      'es': '',
      'hi': '',
    },
    'vr40ns2t': {
      'en': 'Enter emailId !',
      'es': '',
      'hi': '',
    },
    'lbx19v1l': {
      'en': 'Password is required',
      'es': '',
      'hi': '',
    },
    '6jzljw41': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'hi': '',
    },
    'vyuxswtr': {
      'en': 'Sign In',
      'es': '',
      'hi': 'दाखिल करना',
    },
    'pi0h02j1': {
      'en': 'Forgot Password ?',
      'es': '',
      'hi': 'पासवर्ड भूल गए ?',
    },
    'zgr11r23': {
      'en': 'No account yet?',
      'es': '',
      'hi': 'दाखिल करना',
    },
    'al2gk8ma': {
      'en': 'Sign Up',
      'es': '',
      'hi': 'दाखिल करना',
    },
    'idabyd7x': {
      'en': 'OR sign in with',
      'es': '',
      'hi': 'या साइन अप करें',
    },
    'hhqfz78e': {
      'en': '',
      'es': '',
      'hi': 'Google के साथ जारी रखें',
    },
    '2lqn0lib': {
      'en': '',
      'es': '',
      'hi': 'Google के साथ जारी रखें',
    },
    'i7lr2szv': {
      'en':
          'Your account includes many benfits including Vendor communciations, Tracking of order/request, Event/Guest management, Cashback/Rewards etc. More details here.',
      'es': '',
      'hi': 'साइन इन करने के लिए नीचे दिए गए खाते का उपयोग करें।',
    },
    't6ytozgd': {
      'en': 'Still want to Checkout without logging in?',
      'es': '',
      'hi': 'साइन इन करने के लिए नीचे दिए गए खाते का उपयोग करें।',
    },
    'sqgwx125': {
      'en': 'Guest Checkout',
      'es': '',
      'hi': 'दाखिल करना',
    },
  },
  // requestDetails
  {
    'molfaswh': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
    '0u41g1ql': {
      'en': 'Qty :',
      'es': '',
      'hi': '',
    },
    '7defm9ho': {
      'en': 'kid :',
      'es': '',
      'hi': '',
    },
    'nqeyqx8b': {
      'en': 'Adult :',
      'es': '',
      'hi': '',
    },
    'iipddrwj': {
      'en': 'Total  :',
      'es': '',
      'hi': '',
    },
    'ad9x9p0h': {
      'en': 'AddOn',
      'es': '',
      'hi': '',
    },
    'b0ks0wq6': {
      'en': 'AddOns',
      'es': '',
      'hi': '',
    },
    'wl0a3n8d': {
      'en': 'AddOns Group',
      'es': '',
      'hi': '',
    },
    'cs9bhnbm': {
      'en': 'Included Addon',
      'es': '',
      'hi': '',
    },
    '1znbx96m': {
      'en': 'AddOns',
      'es': '',
      'hi': '',
    },
    'f7mx42tf': {
      'en': 'AddOns Group',
      'es': '',
      'hi': '',
    },
  },
  // EmptyListComp
  {
    'j1b8mku6': {
      'en': 'No Items Found',
      'es': '',
      'hi': '',
    },
  },
  // cartItemDetail
  {
    'i3inn0ou': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
    '9nqcvo4i': {
      'en': 'Qty :',
      'es': '',
      'hi': '',
    },
    'xshdl85n': {
      'en': 'kid :',
      'es': '',
      'hi': '',
    },
    '15sew88q': {
      'en': 'Adult :',
      'es': '',
      'hi': '',
    },
    'h2okuovw': {
      'en': 'Total  :',
      'es': '',
      'hi': '',
    },
    'vja9kpqa': {
      'en': 'Customization Options',
      'es': '',
      'hi': '',
    },
    '2rkwwdv0': {
      'en': 'AddOn',
      'es': '',
      'hi': '',
    },
    'dw2hqyzp': {
      'en': 'AddOns',
      'es': '',
      'hi': '',
    },
    '2hdmscef': {
      'en': 'Change Qty ',
      'es': '',
      'hi': '',
    },
    'dwasfds3': {
      'en': 'AddOns Group',
      'es': '',
      'hi': '',
    },
    'x1bx7uy6': {
      'en': 'Included Addon',
      'es': '',
      'hi': '',
    },
    '34qwelxp': {
      'en': 'AddOns',
      'es': '',
      'hi': '',
    },
    '9bq0kijn': {
      'en': 'AddOns Group',
      'es': '',
      'hi': '',
    },
  },
  // RentalSearchComp
  {
    'ihsif14s': {
      'en': 'Search Party Rentals',
      'es': '',
      'hi': '',
    },
    '48hv8ui7': {
      'en': 'Search Party Rentals',
      'es': '',
      'hi': '',
    },
    'p95xavxr': {
      'en': 'e.g. Tents, Chairs/Tables, Inflatables etc.',
      'es': '',
      'hi': '',
    },
    'i56ynntj': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'i8gnf3py': {
      'en': 'place/Activity',
      'es': '',
      'hi': '',
    },
    'kgdgmhyj': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    '2gu4dlgr': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'oh795ubx': {
      'en': 'Option 3',
      'es': '',
      'hi': '',
    },
    'sdkgbsxt': {
      'en': 'Popular Categories',
      'es': '',
      'hi': '',
    },
    'i4uwq61q': {
      'en': 'Serving-Catering',
      'es': '',
      'hi': '',
    },
    '9kx8h87z': {
      'en': 'Photo-Booth',
      'es': '',
      'hi': '',
    },
    '2rihs9tc': {
      'en': 'Stage-Dance',
      'es': '',
      'hi': '',
    },
    '0o2um3b7': {
      'en': 'Food Machines',
      'es': '',
      'hi': '',
    },
    'lue68mxa': {
      'en': 'Table/Tent/Chairs',
      'es': '',
      'hi': '',
    },
    'yq156dmg': {
      'en': 'Fun Games',
      'es': '',
      'hi': '',
    },
    't3e49719': {
      'en': 'Inflatables',
      'es': '',
      'hi': '',
    },
    'rki0zenc': {
      'en': 'Decoration',
      'es': '',
      'hi': '',
    },
    'qws79w38': {
      'en': 'Audio/Visual Electrical',
      'es': '',
      'hi': '',
    },
    '68s3voqb': {
      'en': 'Search',
      'es': '',
      'hi': '',
    },
  },
  // venueSearchComp
  {
    'qh6bcdk9': {
      'en': 'Search Venues',
      'es': '',
      'hi': '',
    },
    'kompp3o1': {
      'en': 'Search Venues',
      'es': '',
      'hi': '',
    },
    '89wos45x': {
      'en': 'e.g. Indoor Activity, Sports, Hall Rental etc.',
      'es': '',
      'hi': '',
    },
    'ktiqku2t': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'lgfgvvlg': {
      'en': 'place/Activity',
      'es': '',
      'hi': '',
    },
    'knjo0gvx': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'sw5pxwqa': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'k0u65q6y': {
      'en': 'Option 3',
      'es': '',
      'hi': '',
    },
    '7lwdt8hh': {
      'en': 'Popular Categories',
      'es': '',
      'hi': '',
    },
    '1hrbtkuy': {
      'en': 'First Birthday',
      'es': '',
      'hi': '',
    },
    'n23qfdhm': {
      'en': 'Fun Activity',
      'es': '',
      'hi': '',
    },
    'rqdukg4t': {
      'en': 'Adult Celebration',
      'es': '',
      'hi': '',
    },
    '3anve70b': {
      'en': 'Sports',
      'es': '',
      'hi': '',
    },
    'k0d3ys5y': {
      'en': 'Banquet Place',
      'es': '',
      'hi': '',
    },
    'jaacin9w': {
      'en': 'Educational',
      'es': '',
      'hi': '',
    },
    'wwksnzrj': {
      'en': 'Arts ',
      'es': '',
      'hi': '',
    },
    '2vkkx6qa': {
      'en': 'Coporate Team Building',
      'es': '',
      'hi': '',
    },
    'z1mhkzi4': {
      'en': 'Princess Favorite',
      'es': '',
      'hi': '',
    },
    'dzopmplw': {
      'en': 'Search',
      'es': '',
      'hi': '',
    },
  },
  // EntertainerSearchComp
  {
    'x2bf4xfp': {
      'en': 'Search Entertainer ',
      'es': '',
      'hi': '',
    },
    'zap2fftl': {
      'en': 'Search Entertainer',
      'es': '',
      'hi': '',
    },
    '4b8qlfx6': {
      'en': 'e.g. Kids Fun Entertainer, Magician etc.',
      'es': '',
      'hi': '',
    },
    'yjiidrih': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    '85lgdzk5': {
      'en': 'place/Activity',
      'es': '',
      'hi': '',
    },
    '560ipwfx': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    'sjii2hmk': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'bdwyry4o': {
      'en': 'Option 3',
      'es': '',
      'hi': '',
    },
    '030u6owx': {
      'en': 'Popular Categories',
      'es': '',
      'hi': 'लोकप्रिय श्रेणियां',
    },
    '091g6l9e': {
      'en': 'Clown/Character',
      'es': '',
      'hi': 'विदूषक/पात्र',
    },
    'lbcvlrao': {
      'en': 'Photo/Video',
      'es': '',
      'hi': 'फोटो/वीडियो',
    },
    'p2fkcfoz': {
      'en': 'Game/Sport',
      'es': '',
      'hi': 'मोबाइल गेम्स/खेल',
    },
    '2998fr83': {
      'en': 'Decorator/Food/Bar',
      'es': '',
      'hi': 'सज्जाकार/खाद्य/बार',
    },
    'qkl8b1b9': {
      'en': 'Music/Dance',
      'es': '',
      'hi': 'संगीत/नृत्य',
    },
    '5rlj2kos': {
      'en': 'Magician',
      'es': '',
      'hi': 'जादूगर',
    },
    'zbm1x5vw': {
      'en': 'Wedding',
      'es': '',
      'hi': 'शादी',
    },
    'votvowma': {
      'en': 'Puppet/Storytler',
      'es': '',
      'hi': 'कठपुतली/कहानी सुनाना',
    },
    '1wzfj8yy': {
      'en': 'FacePainter/Ballon',
      'es': '',
      'hi': 'फेस पेंटर्स/बैलून',
    },
    'xsm9wrsv': {
      'en': 'Search',
      'es': '',
      'hi': '',
    },
  },
  // CakeSearchComp
  {
    'mu0edli6': {
      'en': 'Search Bakeries',
      'es': '',
      'hi': '',
    },
    'zbrkwobn': {
      'en': 'Search Bakeries',
      'es': '',
      'hi': '',
    },
    'b8hebhxt': {
      'en': 'e.g. First Birthday, Cakes etc.',
      'es': '',
      'hi': '',
    },
    '7ydr9q8c': {
      'en': 'Search...',
      'es': '',
      'hi': '',
    },
    'fr8ot4dq': {
      'en': 'place/Activity',
      'es': '',
      'hi': '',
    },
    'smoe21b2': {
      'en': 'Option 1',
      'es': '',
      'hi': '',
    },
    '0hlt8rqh': {
      'en': 'Option 2',
      'es': '',
      'hi': '',
    },
    'con77lhh': {
      'en': 'Option 3',
      'es': '',
      'hi': '',
    },
    'kfd7vefx': {
      'en': 'Popular Categories',
      'es': '',
      'hi': 'लोकप्रिय श्रेणियां',
    },
    'dq22jwlb': {
      'en': 'First Birthday ',
      'es': '',
      'hi': 'पहला जन्मदिन',
    },
    'ag0nsxik': {
      'en': 'Boy Birthday',
      'es': '',
      'hi': 'लड़के का जन्मदिन',
    },
    '24u7xmia': {
      'en': 'Girl Birthday',
      'es': '',
      'hi': 'लड़की का जन्मदिन',
    },
    '3cm40le3': {
      'en': 'Wedding',
      'es': '',
      'hi': 'शादी',
    },
    'ce192joq': {
      'en': 'Adult Birthday',
      'es': '',
      'hi': 'वयस्क जन्मदिन',
    },
    '27gr3cvl': {
      'en': 'Special Events',
      'es': '',
      'hi': 'विशेष घटनाएं',
    },
    'batisaji': {
      'en': 'Baby Bridal Shower',
      'es': '',
      'hi': 'बेबी ब्राइडल शॉवर',
    },
    'aygdw482': {
      'en': 'Graduation',
      'es': '',
      'hi': 'स्नातक',
    },
    'b03g0w9j': {
      'en': 'Holiday',
      'es': '',
      'hi': 'छुट्टी',
    },
    'vtri1dv6': {
      'en': 'Search',
      'es': '',
      'hi': '',
    },
  },
  // CustomErrorrAltertBox
  {
    'o7qayxc2': {
      'en': 'Something Went Wrong',
      'es': '',
      'hi': '',
    },
    'n0gf4650': {
      'en':
          'We encountered an error while processing your request. Please try again later or contact support if the issue persists.',
      'es': '',
      'hi': '',
    },
    'qzhny8qb': {
      'en': 'Close',
      'es': '',
      'hi': '',
    },
  },
  // photoUploadComp
  {
    '27pldus2': {
      'en': 'Upload Photo',
      'es': '',
      'hi': '',
    },
    '0xgpz2e3': {
      'en': 'Choose File',
      'es': '',
      'hi': '',
    },
    'fou88ikh': {
      'en': 'Upload',
      'es': '',
      'hi': '',
    },
  },
  // venueFilterComp
  {
    '4a3gmtpy': {
      'en': 'Close',
      'es': '',
      'hi': '',
    },
    'xyhs4qud': {
      'en': ' Filter By',
      'es': '',
      'hi': 'फिल्टर के द्वारा',
    },
    'ekngqglm': {
      'en': 'Clear all',
      'es': '',
      'hi': 'सभी साफ करें',
    },
    'np2652d7': {
      'en': 'Venue type',
      'es': '',
      'hi': 'स्थल का प्रकार',
    },
    'gfv8fgy7': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    's0sttrwm': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'cpvbf0zz': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'wc0rsn0i': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'ook3plh1': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'z47ie372': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '240hnf5d': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'a5t1n7cn': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'gbu40a2e': {
      'en': 'Activities',
      'es': '',
      'hi': 'गतिविधियाँ',
    },
    'jru0d5km': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'pojtdi2q': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    's2w8ltj0': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'ip9n9fhm': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'ak0cs2jc': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'kdqo86hc': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'h7jykk6w': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '552pmryb': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'phyxqdvi': {
      'en': 'Sports',
      'es': '',
      'hi': 'खेल',
    },
    'jgof145w': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '0uvi2pft': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'khululkv': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'us9zshhw': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'ep921zle': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'hf9vo73k': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '1k3ns81j': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'uzwkg2tz': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'xd0xo7v1': {
      'en': 'Price',
      'es': '',
      'hi': 'कीमत',
    },
    'bywxfnkq': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'edyifi8k': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '933l696o': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '68q1i6p9': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'wepmjaa7': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'bzygx4qt': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'khlcv4fz': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'ml4xmh04': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'b7f1i5ev': {
      'en': 'Ranking',
      'es': '',
      'hi': 'श्रेणी',
    },
    '8cavr0iq': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'krstwzx9': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'q9cwqh2u': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'ibl09ysq': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    '68698xts': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '2a1v2em5': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'f7cea4wk': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'ks2kh7eu': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    '59929z8w': {
      'en': 'Age',
      'es': '',
      'hi': 'आयु',
    },
    'j6yftmnr': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'f7kvr67l': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'y517oymd': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'mwpsr2tb': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'd6f1zi3z': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'e6jsw9si': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'cdp56e81': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'f5zdw127': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'cvaf4190': {
      'en': 'Town',
      'es': '',
      'hi': 'शहर',
    },
    'o4ryf4ci': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '2xbgetmq': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'k1u6a8dc': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '68jmp23f': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'jjnbsfdn': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '4c2kt447': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '7kru5xbw': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'nw8wujcv': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    '0s69acss': {
      'en': 'Capacity',
      'es': '',
      'hi': 'क्षमता',
    },
    '8u58msj7': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'tol9t14c': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'noscdl90': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '12w8m2g4': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'l5lustuc': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'xq6qhuoo': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '1tp19u0f': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'dx1m5mng': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'v3p0hcqt': {
      'en': 'Gender',
      'es': '',
      'hi': 'लिंग',
    },
    'lyo2vnua': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'j291d623': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'fn4fplmz': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'rlyaf294': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'mz10ywok': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '9ai381sb': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'kz5uo5yd': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'yndfvsuf': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'kgtpmylk': {
      'en': 'Indoor/Outdoor',
      'es': '',
      'hi': 'भीतर और बाहर',
    },
    'f8on3k8g': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'moseqxr4': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'ojv6mill': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'ehc5whlo': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'eyadso7r': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'mqjzjmk5': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'v8d49z4b': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'xmaumyih': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'jmwo0wwf': {
      'en': 'Apply all',
      'es': '',
      'hi': 'सभी लागू करें',
    },
  },
  // chatBottomSheet
  {
    '3fi5ztuk': {
      'en': 'Select a user to chat',
      'es': '',
      'hi': '',
    },
  },
  // rentalFilterComp
  {
    'c9pjec02': {
      'en': 'Close',
      'es': '',
      'hi': '',
    },
    'q5hy25hq': {
      'en': ' Filter By',
      'es': '',
      'hi': 'फिल्टर के द्वारा',
    },
    'azgt8o5i': {
      'en': 'Clear all',
      'es': '',
      'hi': 'सभी साफ करें',
    },
    'ezn8acno': {
      'en': 'Rental Category',
      'es': '',
      'hi': 'स्थल का प्रकार',
    },
    'egnoty8p': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'u9hgf4qh': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '2hclew8s': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'cwlbtup8': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'filu1r70': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'poge95vn': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'uuyje7jw': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'a35v51h1': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'z2oyrg3g': {
      'en': 'Price',
      'es': '',
      'hi': 'कीमत',
    },
    '5up5hwrc': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'wu7c9iq3': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '4b6zahd8': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'vug576x5': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    '3lywlgec': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'ce9pz99z': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '3vk7sjs1': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'zyofmse1': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'z4tylnyh': {
      'en': 'Ranking',
      'es': '',
      'hi': 'श्रेणी',
    },
    'gfm6nuxk': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'wjw8u8h4': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'ge6cphsj': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '91jbr4dg': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'q9s81y5x': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'q57y130x': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '4057ujqa': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'kc2qjlua': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'wk82b0c6': {
      'en': 'Age',
      'es': '',
      'hi': 'आयु',
    },
    '8zzw2mfn': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'soz8fkyn': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'gfsn443k': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'clguouh1': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'hqiq33tq': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'kdglkdj4': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'r7r07edn': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'z9xhvzt9': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'lp08prlh': {
      'en': 'Town',
      'es': '',
      'hi': 'शहर',
    },
    '96410r6u': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'y461hw7n': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'vm7wg5gx': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'g26t3kb9': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'ljt4bu7l': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'yxzzeo07': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '7pmhxmx1': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'up7hwcsj': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'm6889rwq': {
      'en': 'Apply all',
      'es': '',
      'hi': 'सभी लागू करें',
    },
    '68i8odhc': {
      'en':
          'No categories available for filtering. Please try change the Place/Activity filter or the Distance filter',
      'es': '',
      'hi': '',
    },
  },
  // entertainerFilterComp
  {
    'yw7g8qzb': {
      'en': 'Close',
      'es': '',
      'hi': '',
    },
    't3sd1pzp': {
      'en': ' Filter By',
      'es': '',
      'hi': 'फिल्टर के द्वारा',
    },
    'hupmmg0v': {
      'en': 'Clear all',
      'es': '',
      'hi': 'सभी साफ करें',
    },
    'wn9peras': {
      'en': 'Entertainer Category',
      'es': '',
      'hi': 'स्थल का प्रकार',
    },
    'lpu7u1o3': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'qwz8diyl': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'c2ittvw1': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '0evyw4zi': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'jxkmae9x': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'vzgbs5cd': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'rugfpbon': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'o8xyobsi': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'qpotqo53': {
      'en': 'Price',
      'es': '',
      'hi': 'कीमत',
    },
    'tqyc62f3': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'svsgczxe': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'n8096z4b': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'v9nzpvdv': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'bfpkrp8r': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'o6aegqm9': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'z3myjw8y': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '9opahf1z': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'g90n7jue': {
      'en': 'Ranking',
      'es': '',
      'hi': 'श्रेणी',
    },
    'g8tdh4fc': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    't6431g5s': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'f1sp9juj': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '7a504bxl': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'tpt15yko': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'wd0yg4v6': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'k5ywbb4e': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'fnqlp57c': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    '323lklnd': {
      'en': 'Age',
      'es': '',
      'hi': 'आयु',
    },
    'sllwqtpp': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'tu8nk73i': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'xos9liqf': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'uzrdbq55': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'izahv6sv': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'xo93j9eg': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '7p0y1xqv': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'siw4lmw9': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'au8uwnju': {
      'en': 'Town',
      'es': '',
      'hi': 'शहर',
    },
    '64t08k8c': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'cxajr4bm': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '17pl67xb': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'twh4cfpa': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'a7cptlo5': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'fhs61qds': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'vnozozkx': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'qrjjx59f': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'a2gqo8lq': {
      'en': 'Apply all',
      'es': '',
      'hi': 'सभी लागू करें',
    },
  },
  // VendorMyAccountComp
  {
    't883890h': {
      'en': 'Welcome ',
      'es': '',
      'hi': 'स्वागत',
    },
    '3cn9djjy': {
      'en': 'Quick Actions',
      'es': '',
      'hi': 'त्वरित कार्रवाई',
    },
    'xdmdddpf': {
      'en': 'Profile',
      'es': '',
      'hi': 'प्रोफ़ाइल',
    },
    'snkettzh': {
      'en': 'Employees',
      'es': '',
      'hi': 'पसंदीदा',
    },
    '2hg27ja1': {
      'en': 'Account Settings',
      'es': '',
      'hi': 'अकाउंट सेटिंग',
    },
    'rb35mhqx': {
      'en': 'Notifications',
      'es': '',
      'hi': 'सूचनाएं',
    },
    'c7kpda6x': {
      'en': 'Privacy & Security',
      'es': '',
      'hi': 'निजता एवं सुरक्षा',
    },
    'pv8o8fif': {
      'en': 'Help & Support',
      'es': '',
      'hi': 'सहायता एवं समर्थन',
    },
    'bn240ote': {
      'en': 'Log Out',
      'es': '',
      'hi': 'लॉग आउट',
    },
  },
  // cakeFilterComp
  {
    't7usrup9': {
      'en': 'Close',
      'es': '',
      'hi': '',
    },
    'joutdjgw': {
      'en': ' Filter By',
      'es': '',
      'hi': 'फिल्टर के द्वारा',
    },
    'nbco23ci': {
      'en': 'Clear all',
      'es': '',
      'hi': 'सभी साफ करें',
    },
    'es7tly85': {
      'en': 'Bakery type',
      'es': '',
      'hi': 'स्थल का प्रकार',
    },
    '48hociae': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'uwgyexgl': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'gjm48q8t': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'hus85dg0': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'j8qfr80e': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'ffd1ixon': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'hpbbgc4o': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '18hbl3z6': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'u752zdlr': {
      'en': 'Menu Restriction',
      'es': '',
      'hi': 'गतिविधियाँ',
    },
    'fp6iplqo': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '3rd4qstv': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '4ub34d87': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '9hcm7qc8': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'wn4quda4': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'yzqakaio': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '4jscj36b': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'nixzwfi9': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'feuh1h22': {
      'en': 'Cake Flavors',
      'es': '',
      'hi': 'खेल',
    },
    'so8yq2oj': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '5dva8871': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'jcen5xuh': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'jwkacpfm': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'kfb1tnx2': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'i3gsfydo': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'mmdeu0m5': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'ke63icmm': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'gznbd8fz': {
      'en': 'Theme',
      'es': '',
      'hi': 'आयु',
    },
    '1zm0ri9e': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'bhun658l': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'hexp45fq': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'mpf3ziv5': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    '5swmgnnu': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '3frt9r0q': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'd9h001d6': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'iu6bjhvq': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    '6o4gmowe': {
      'en': 'Filling',
      'es': '',
      'hi': 'क्षमता',
    },
    '2co5qbim': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'kay3g5wg': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '36daqwhw': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'vspxzu8a': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'k5heskzz': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'biw3av6g': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'zvq6li4c': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'ichl90r6': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    '3jajasck': {
      'en': 'Ice Creme Flavor',
      'es': '',
      'hi': 'लिंग',
    },
    '93uxk6s8': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'jmhojqyu': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    't2m2e3ht': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'xz8zlj8q': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'na5z37hx': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'xp517vdp': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'hl8euo59': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'u4fiobsx': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'rhixvew4': {
      'en': 'Ranking',
      'es': '',
      'hi': 'श्रेणी',
    },
    '4tjaju5i': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '8rjhixn8': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'ocrrhomi': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'in0toall': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'icko9t1h': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'zb48xi1e': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'ldjbfq7j': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'i958rspm': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'mbjp7fug': {
      'en': 'Town',
      'es': '',
      'hi': 'शहर',
    },
    'l23t35j3': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'bnvqlqf6': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'jpx32cr6': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'yjc4m9ev': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'pmha5mrc': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    '6sfgi398': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '6332nfpu': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '26tq64l9': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'yp10ll60': {
      'en': 'Delivery Fees Range',
      'es': '',
      'hi': 'भीतर और बाहर',
    },
    'vgwwj7rm': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'dxf7nvtv': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '0q5ad2q1': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'kx2mbo77': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    'ekj31xq9': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'pt1ffvwh': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'c1nawpeh': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'lp8mzkmy': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    'qj421wbd': {
      'en': 'Price',
      'es': '',
      'hi': 'कीमत',
    },
    'bflf0cea': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'uahyui9e': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    '97fpw5mq': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    '0pd6t76v': {
      'en': 'more',
      'es': '',
      'hi': '',
    },
    '2pda3qz3': {
      'en': 'Option 1',
      'es': '',
      'hi': 'विकल्प 1',
    },
    'sgx6gt8u': {
      'en': 'Option 2',
      'es': '',
      'hi': 'विकल्प 2',
    },
    'xdfjteo4': {
      'en': 'Option 3',
      'es': '',
      'hi': 'विकल्प 3',
    },
    'u5wjlsyi': {
      'en': 'less',
      'es': '',
      'hi': '',
    },
    '72w6hxwk': {
      'en': 'Apply all',
      'es': '',
      'hi': 'सभी लागू करें',
    },
  },
  // ContactUS
  {
    'c1xyyo5d': {
      'en': 'Company',
      'es': '',
      'hi': '',
    },
    'uj3igyar': {
      'en': 'Terms',
      'es': '',
      'hi': '',
    },
    'ncm3cnus': {
      'en': 'Privacy',
      'es': '',
      'hi': '',
    },
    'qq5rgvew': {
      'en': 'Blog',
      'es': '',
      'hi': '',
    },
    '59mpos1l': {
      'en': 'Contact Us',
      'es': '',
      'hi': '',
    },
  },
  // nameFilter
  {
    'o9erv2x3': {
      'en': 'Apply',
      'es': '',
      'hi': 'आवेदन करना',
    },
  },
  // vendorRequestComp
  {
    'e8c97gnf': {
      'en': 'Submission Date',
      'es': '',
      'hi': '',
    },
    'c3fiokq9': {
      'en': 'Cart Status',
      'es': '',
      'hi': '',
    },
    'quh28gpd': {
      'en': 'Prospect Name',
      'es': '',
      'hi': '',
    },
    'y4wji2hl': {
      'en': 'Prospect email',
      'es': '',
      'hi': '',
    },
    'vw9ob2mo': {
      'en': 'Convert to Order',
      'es': '',
      'hi': '',
    },
    'cwufvczp': {
      'en': 'Respond',
      'es': '',
      'hi': '',
    },
  },
  // vendorOrderComp
  {
    '06eodu7i': {
      'en': 'Submission Date',
      'es': '',
      'hi': '',
    },
    'rgfarvjb': {
      'en': 'Cart Status',
      'es': '',
      'hi': '',
    },
    'e7l0cfrz': {
      'en': 'Prospect Name',
      'es': '',
      'hi': '',
    },
    'u4suufbw': {
      'en': 'Prospect email',
      'es': '',
      'hi': '',
    },
    'p69e7stx': {
      'en': 'Details',
      'es': '',
      'hi': '',
    },
  },
  // vendorScheduleComp
  {
    't18bmym3': {
      'en': 'Submission Date',
      'es': '',
      'hi': '',
    },
    'yrlyc9h0': {
      'en': 'Cart Status',
      'es': '',
      'hi': '',
    },
    'vce69qnk': {
      'en': 'Prospect Name',
      'es': '',
      'hi': '',
    },
    'ha2070wg': {
      'en': 'Prospect email',
      'es': '',
      'hi': '',
    },
    'jauvpm3k': {
      'en': 'Respond',
      'es': '',
      'hi': '',
    },
  },
  // vendorInquiryComp
  {
    'fwvkotyi': {
      'en': 'Submission Date',
      'es': '',
      'hi': '',
    },
    'zjldh6z8': {
      'en': 'Cart Status',
      'es': '',
      'hi': '',
    },
    'w442xgsp': {
      'en': 'Respond',
      'es': '',
      'hi': '',
    },
    'uhjsq0kv': {
      'en': 'Close Inquiry',
      'es': '',
      'hi': '',
    },
  },
  // requestForEventComp
  {
    'im7rm6fa': {
      'en': 'More  Details',
      'es': '',
      'hi': '',
    },
  },
  // AddonCountChangeComp
  {
    'gjav6ggh': {
      'en': 'Enter new quantity',
      'es': '',
      'hi': '',
    },
    '7lz17gu0': {
      'en': 'Enter integer value',
      'es': '',
      'hi': '',
    },
    'ieyusevv': {
      'en': 'Back',
      'es': '',
      'hi': '',
    },
    'klteafra': {
      'en': 'Next',
      'es': '',
      'hi': '',
    },
  },
  // filterNotFoundComp
  {
    'sdddrtbs': {
      'en': 'No Filter\'s Found',
      'es': '',
      'hi': '',
    },
    'rgh8sfyi': {
      'en':
          'We couldn\'t find any items matching your current location and distance. Try adjusting your search criteria or clearing some filters.',
      'es': '',
      'hi': '',
    },
  },
  // descriptionBottomSheetWebView
  {
    'jdmnd2o7': {
      'en': 'Description',
      'es': '',
      'hi': '',
    },
  },
  // DescriptionComp
  {
    'jti65hah': {
      'en': 'View more ....',
      'es': '',
      'hi': '',
    },
  },
  // locationSearchComp
  {
    '020ml7hk': {
      'en': 'Change Location Here',
      'es': '',
      'hi': '',
    },
  },
  // DescriptionCompCopy
  {
    '1p3lkahf': {
      'en': '...',
      'es': '',
      'hi': '',
    },
  },
  // locationSearchCompAllVendor
  {
    'j6yfkozn': {
      'en': 'Change Location Here',
      'es': '',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'peithkns': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'd1jjkkwz': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'e22win02': {
      'en': 'Send Notifiction on',
      'es': '',
      'hi': 'अधिसूचना भेजें',
    },
    'dq6ftnrb': {
      'en': 'Allow Acess All Contact',
      'es': '',
      'hi': '',
    },
    'qiwxlt7u': {
      'en': 'Allow Acess Location',
      'es': '',
      'hi': '',
    },
    '26nicn3i': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'pgpteukn': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '5kvx2twk': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '2ovevel5': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'z8b8ndcu': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'mkndcztd': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'h7mx6f7f': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'bkkai1gu': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'me1vivpz': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '980f7tla': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'woo5ixil': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'e6nck9cf': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '54isjil8': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'q5x1rpm9': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'w99qi2cn': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '3ex3a2ys': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'gu1e6pk5': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'akrp6ago': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'ewadkkc1': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'ux4oyxfy': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'dm62gjcj': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'sj1fgsg5': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'tdfgcihg': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'e3g7kv19': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '268i1ink': {
      'en': '',
      'es': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
