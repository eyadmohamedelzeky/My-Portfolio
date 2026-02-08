enum Language { en, ar }

class AppStrings {
  static Language currentLanguage = Language.en;

  static void setLanguage(Language language) {
    currentLanguage = language;
  }

  static bool get isArabic => currentLanguage == Language.ar;

  // Keys
  static const String nameKey = "name";
  static const String jobTitleKey = "jobTitle";
  static const String aboutMeKey = "aboutMe";
  static const String skillsKey = "skills";
  static const String experienceKey = "experience";
  static const String projectsKey = "projects";
  static const String educationKey = "education";
  static const String contactKey = "contact";
  static const String aboutDescriptionKey = "aboutDescription";
  static const String referenceKey = "reference";

  // Navigation Keys
  static const String navHomeKey = "navHome";
  static const String navAboutKey = "navAbout";
  static const String navExperienceKey = "navExperience";
  static const String navEducationKey = "navEducation";
  static const String navSkillsKey = "navSkills";
  static const String navProjectsKey = "navProjects";
  static const String navContactKey = "navContact";

  // Data
  static const String email = "eyadmohamedelzeky@gmail.com";
  static const String phone = "01010076119";
  static const String location = "Cairo, Egypt";
  static const String linkedin =
      "https://www.linkedin.com/in/eyad-mohamed-dev/";
  static const String github = "https://github.com/eyadmohamedelzeky";

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      nameKey: "Eyad Mohamed Elzeky",
      jobTitleKey: "Flutter Developer",
      aboutMeKey: "Profile Summary",
      skillsKey: "Skills",
      experienceKey: "Work Experience",
      projectsKey: "Projects",
      educationKey: "Education",
      contactKey: "Contact Me",
      aboutDescriptionKey:
          "Flutter Developer with More Than 2+ years of experience delivering 10+ cross-platform mobile apps to Google Play and App Store. Skilled in Clean Architecture, BLoC/Cubit, Firebase, and API integration. Improved app performance and load time by up to 35% across multiple projects. Experienced collaborating in Agile teams to ship production-ready apps with 5K+ active users and 4.6★ ratings.",

      // Navigation
      navHomeKey: "Home",
      navAboutKey: "About",
      navExperienceKey: "Experience",
      navEducationKey: "Education",
      navSkillsKey: "Skills",
      navProjectsKey: "Projects",
      navContactKey: "Contact",
      referenceKey: "Reference",
    },
    'ar': {
      nameKey: "إياد محمد الزكي",
      jobTitleKey: "مطور تطبيقات فلاتر",
      aboutMeKey: "الملف الشخصي",
      skillsKey: "المهارات",
      experienceKey: "خبرات العمل",
      projectsKey: "المشاريع",
      educationKey: "التعليم",
      contactKey: "تواصل معي",
      aboutDescriptionKey:
          "Flutter Developer بخبرة تزيد عن سنتين في تطوير ورفع أكثر من 10 تطبيقات للهواتف الذكية على Google Play و App Store. متمكن من Clean Architecture و BLoC/Cubit و Firebase وتكامل الـ API. قمت بتحسين أداء التطبيقات وسرعة التحميل بنسبة تصل إلى 35٪ في مشاريع متعددة. لدي خبرة في العمل ضمن فرق Agile.",

      // Navigation
      navHomeKey: "الرئيسية",
      navAboutKey: "نبذة عني",
      navExperienceKey: "الخبرات",
      navEducationKey: "التعليم",
      navSkillsKey: "المهارات",
      navProjectsKey: "المشاريع",
      navContactKey: "تواصل معي",
      referenceKey: "مرجع التواصل",
    },
  };

  static String get name => _localizedValues[currentLanguage.name]![nameKey]!;
  static String get jobTitle =>
      _localizedValues[currentLanguage.name]![jobTitleKey]!;
  static String get aboutMe =>
      _localizedValues[currentLanguage.name]![aboutMeKey]!;
  static String get skills =>
      _localizedValues[currentLanguage.name]![skillsKey]!;
  static String get experience =>
      _localizedValues[currentLanguage.name]![experienceKey]!;
  static String get projects =>
      _localizedValues[currentLanguage.name]![projectsKey]!;
  static String get education =>
      _localizedValues[currentLanguage.name]![educationKey]!;
  static String get contact =>
      _localizedValues[currentLanguage.name]![contactKey]!;
  static String get aboutDescription =>
      _localizedValues[currentLanguage.name]![aboutDescriptionKey]!;
  static String get reference =>
      _localizedValues[currentLanguage.name]![referenceKey]!;

  // Navigation Getters
  static String get navHome =>
      _localizedValues[currentLanguage.name]![navHomeKey]!;
  static String get navAbout =>
      _localizedValues[currentLanguage.name]![navAboutKey]!;
  static String get navExperience =>
      _localizedValues[currentLanguage.name]![navExperienceKey]!;
  static String get navEducation =>
      _localizedValues[currentLanguage.name]![navEducationKey]!;
  static String get navSkills =>
      _localizedValues[currentLanguage.name]![navSkillsKey]!;
  static String get navProjects =>
      _localizedValues[currentLanguage.name]![navProjectsKey]!;
  static String get navContact =>
      _localizedValues[currentLanguage.name]![navContactKey]!;

  // Complex Data needs dynamic getter
  static List<Map<String, String>> get experienceList {
    if (isArabic) {
      return [
        {
          "role": "Flutter Developer",
          "company": "United Integration Solution (UIS)",
          "date": "يناير 2024 - الحالي",
          "type": "في الموقع (دوام كامل)",
          "description":
              "• قيادة تطوير تطبيقات جوال متنوعة (عقارات، إدارة شؤون موظفين، تتبع) تخدم أكثر من 5000 مستخدم نشط.\n• تحسين أداء معالجة بيانات الرواتب والـ API بنسبة 35٪، مما عزز سرعة استجابة التطبيقات.\n• تنفيذ أنظمة أمان متقدمة تشمل البصمة والتحقق من الـ MAC Address لضمان موثوقية بنسبة 100٪.\n• بناء معماريات برمجية مرنة باستخدام BLoC و Clean Architecture لضمان سهولة الصيانة والتوسع.",
          "refName": "م/ علاء إبراهيم",
          "refPhone": "+201142007746",
        },
        {
          "role": "Flutter Developer",
          "company": "Appgain",
          "date": "سبتمبر 2023 - ديسمبر 2023",
          "type": "في الموقع (دوام كامل)",
          "description":
              "• تطوير تطبيق 'Retail Gain' وحصوله على تقييم 4.6★ على متجر جوجل بلاي.\n• تصميم وتنفيذ نظام ولاء متكامل ساهم في زيادة معدل احتفاظ المستخدمين وتكرار الشراء بنسبة 20٪.\n• تقليل زمن تحميل المنتجات بنسبة 35٪ من خلال تحسين استراتيجيات إدارة الحالة (State Management).",
          "refName": "م/ محمد محمود",
          "refPhone": "+201007186959",
        },
      ];
    }
    return [
      {
        "role": "Flutter Developer",
        "company": "United Integration Solution (UIS)",
        "date": "Jan 2024 - Present",
        "type": "On-site (Full Time)",
        "description":
            "• Led the development of diverse mobile applications (Real Estate, HRM, Tracking) serving 5,000+ active users.\n• Optimized salary data processing and API integration, achieving a 35% speed improvement across systems.\n• Implemented advanced security measures including biometric authentication and MAC address validation for 100% reliability.\n• Engineered scalable architectures using BLoC and Clean Architecture, ensuring high performance and responsive design.",
        "refName": "Eng. Alaa Ibrahim",
        "refPhone": "+201142007746",
      },
      {
        "role": "Flutter Developer",
        "company": "Appgain",
        "date": "Sep 2023 - Dec 2023",
        "type": "On-site (Full Time)",
        "description":
            "• Developed the 'Retail Gain' application, achieving a 4.6★ rating on the Google Play Store.\n• Built a comprehensive loyalty program that increased repeat purchases and user retention by 20%.\n• Reduced product load times by 35% through efficient state management and data fetching optimizations.",
        "refName": "Eng. Mohamed Mahmoud",
        "refPhone": "+201007186959",
      },
    ];
  }

  static Map<String, String> get educationData {
    if (isArabic) {
      return {
        "university": "جامعة الزقازيق",
        "degree": "بكالوريوس حاسبات ومعلومات، قسم علوم الحاسب",
        "date": "سبتمبر 2018 - يونيو 2022",
        "grade": "المعدل: 3.5 \"جيد جداً\"، مشروع التخرج: 4.0 \"امتياز\"",
      };
    }
    return {
      "university": "Zagazig University",
      "degree": "Bachelor of Computers & Information, Computer Science dept",
      "date": "Sep 2018 - Jun 2022",
      "grade":
          "GPA: 3.5 \"Very Good\", Graduation Project grade: 4.0 \"Excellent\"",
    };
  }

  static List<String> get flutterSkills => isArabic
      ? [
          "فلاتر",
          "دارت",
          "إدارة الحالة (Cubit, Bloc, Provider)",
          "Clean Architecture",
          "RESTful APIs (Dio, http)",
          "OOP",
          "Firebase",
          "قواعد بيانات محلية (Hive, SQLite)",
          "خرائط جوجل",
          "أنيميشن",
          "CI/CD (GitHub Actions, Fastlane)",
          "اختبار الـ API (Postman)",
          "تجاوب التصميم",
          "تعدد اللغات",
        ]
      : [
          "Flutter",
          "Dart",
          "State Management (Cubit, Bloc, Provider)",
          "MVC & Clean Architecture",
          "RESTful APIs (Dio, http)",
          "OOP",
          "Dependency Injection (GetIt)",
          "Firebase",
          "Local Databases (Hive, SQLite)",
          "Google Maps",
          "Animations",
          "CI/CD (GitHub Actions, Fastlane)",
          "API Testing (Postman)",
          "Deployment",
          "Responsive UI",
          "Localization",
        ];

  static List<String> get languages => isArabic
      ? [
          "دارت",
          "بايثون",
          "جافا",
          "C++",
          "Git & GitHub",
          "Clean Code",
          "UI/UX Collaboration",
        ]
      : [
          "Dart",
          "Python",
          "Java",
          "C++",
          "Git & GitHub",
          "Clean Code",
          "UI/UX Collaboration",
        ];

  static List<String> get softSkills => isArabic
      ? [
          "تحسين الأداء",
          "Agile & Scrum",
          "حل المشكلات",
          "العمل الجماعي",
          "التعلم السريع",
        ]
      : [
          "Performance Optimization",
          "Agile & Scrum",
          "Problem Solving",
          "Teamwork",
          "Fast Learning",
        ];

  static List<Map<String, String>> get projectList => [
    {
      "title": "Diyar",
      "company": "United Integration Solution (UIS)",
      "description": isArabic
          ? "• إطلاق تطبيق عقارات يستخدمه أكثر من 1000 مستخدم.\n• بناء نظام صلاحيات (مستخدم، حارس).\n• دمج الإشعارات لتقليل طلبات الدعم بنسبة 30%."
          : "• Launched a real estate app used by 1,000+ users, improving property search speed by 40%.\n• Built a role-based access system ensuring secure access control.\n• Implemented Visitor Invitation and Emergency Request modules.\n• Integrated Push Notifications reducing support requests by 30%.",
      "tech": "Flutter, Cubit, Firebase, Hive, API, Localization",
      "google_play":
          "https://play.google.com/store/apps/details?id=com.uis.diyar",
      "app_store": "https://apps.apple.com/us/app/diyar-co/id6751485964",
    },
    {
      "title": "U-Track",
      "company": "United Integration Solution (UIS)",
      "description": isArabic
          ? "• تحسين أمان تسجيل الدخول لأكثر من 5000 مستخدم.\n• تحسين الاحتفاظ بالمستخدمين بنسبة 20%.\n• دمج إشعارات Firebase."
          : "• Enhanced login security for 5,000+ users with biometric authentication.\n• Improved retention by 20% through multilingual and multi-theme support.\n• Integrated Firebase notifications reducing user drop-off by 15%.",
      "tech": "Flutter, Cubit, Firebase, Hive, API, CI/CD",
      "google_play":
          "https://play.google.com/store/apps/details?id=com.uis.uisapprovalsystem&pcampaignid=web_share",
      "app_store": "https://apps.apple.com/us/app/u-track/id6450457205",
    },
    {
      "title": "U-People",
      "company": "United Integration Solution (UIS)",
      "description": isArabic
          ? "• بناء وحدات الرواتب والحضور لأكثر من 500 موظف.\n• تحسين موثوقية المصادقة بنسبة 100%."
          : "• Built salary and attendance modules serving 500+ employees.\n• Improved authentication reliability by 100% using MAC address validation.\n• Optimized API integration speeding up salary data processing by 35%.",
      "tech": "Flutter, Cubit, Firebase, API, Localization",
      "google_play":
          "https://play.google.com/store/apps/details?id=com.uis.uismandooob&pcampaignid=web_share",
      "app_store": "https://apps.apple.com/us/app/u-people/id6475875100",
    },
    {
      "title": "Sam's Décor",
      "company": "United Integration Solution (UIS)",
      "description": isArabic
          ? "• تحسين كفاءة الحجز بنسبة 25% مع جدولة المواعيد.\n• دمج إشعارات Firebase."
          : "• Boosted booking efficiency by 25% with Appointment Scheduling functionality.\n• Integrated Firebase Notifications, reducing missed appointments by 40%.",
      "tech": "Flutter, Cubit, Firebase, API",
      "google_play":
          "https://play.google.com/store/apps/details?id=com.uis.samsdecorapp&pcampaignid=web_share",
      "app_store": "https://apps.apple.com/us/app/sams-d%C3%A9cor/id6741109223",
    },
    {
      "title": "Direct Owner App",
      "company": "United Integration Solution (UIS)",
      "description": isArabic
          ? "• تمكين 1200+ مستخدم من إدارة الملف الشخصي.\n• تقليل أخطاء API بنسبة 20%.\n• زيادة احتفاظ المستخدمين بنسبة 18%."
          : "• Empowered 1,200+ users with CRUD APIs for profile and promo code management.\n• Cut API errors by 20% and improved feature customization flexibility.\n• Boosted user retention by 18% with enhanced profile personalization.",
      "tech": "Flutter, BLoC, Hive, API, Localization, Maps",
      "app_store":
          "https://apps.apple.com/eg/app/direct-owner/id6479305756?l=ar",
    },
    {
      "title": "Mails App",
      "company": "United Integration Solution (UIS)",
      "description": isArabic
          ? "• تتبع طلبات الوقود في الوقت الفعلي لأكثر من 2000 مستخدم.\n• تقليل أخطاء التوصيل بنسبة 30%."
          : "• Enabled real-time fuel order tracking for 2,000+ users using Google Maps.\n• Reduced delivery errors by 30% via API optimization.\n• Improved order completion speed by 25% with route optimization.",
      "tech": "Flutter, Cubit, Hive, API, Maps",
    },
    {
      "title": "Retail Gain",
      "company": "Appgain.io",
      "description": isArabic
          ? "• تطوير برنامج ولاء لـ 3000+ عميل.\n• تقليل وقت تحميل المنتجات بنسبة 35%."
          : "• Developed a loyalty program for 3,000+ customers, driving repeat purchases up 20%.\n• Reduced product load time by 35% and achieved a 4.6★ Play Store rating.\n• Designed responsive UI integrated with secure API authentication.",
      "tech": "Flutter, Cubit, Firebase, API, Localization",
      "google_play":
          "https://play.google.com/store/apps/details?id=com.appgain.retailgain",
    },
  ];
}
