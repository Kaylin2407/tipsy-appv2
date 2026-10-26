// home_screen.dart
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'games_screen.dart';
import 'friends_screen.dart';
import 'rewards_screen.dart';
import 'create_event_screen.dart';

/// Sponsored Ad Item Model for Feed Carousel
class SponsoredAd {
  final String sponsor;
  final String title;
  final String tagline;
  final String ctaText;
  final String badge;
  final Color accentColor;
  final IconData icon;

  const SponsoredAd({
    required this.sponsor,
    required this.title,
    required this.tagline,
    required this.ctaText,
    required this.badge,
    required this.accentColor,
    required this.icon,
  });
}

const List<SponsoredAd> kSponsoredAds = [
  SponsoredAd(
    sponsor: 'Paprika Lounge & Tapas',
    title: 'VIP Rum Punch Happy Hour',
    tagline: '2-for-1 Angostura 1919 cocktails & tapa platters. Ariapita Avenue, Port of Spain.',
    ctaText: 'Reserve Table',
    badge: 'FEATURED VENUE',
    accentColor: Color(0xFFF59E0B),
    icon: Icons.local_bar_rounded,
  ),
  SponsoredAd(
    sponsor: 'TopDrop Caribbean Mobility',
    title: 'Safe Island Rides 24/7',
    tagline: '20% off all late-night rides between Port of Spain & Chaguaramas with promo TIPSY20.',
    ctaText: 'Book Ride',
    badge: 'SAFETY PARTNER',
    accentColor: Color(0xFF10B981),
    icon: Icons.directions_car_filled_rounded,
  ),
  SponsoredAd(
    sponsor: 'Pier 1 Marina Excursions',
    title: 'Down D\' Islands Cooler Cruise',
    tagline: 'Saturday sunset catamaran party. Seamless IslandPayTT ticketing with 1.5x points.',
    ctaText: 'Get Passes',
    badge: 'TICKET PASS',
    accentColor: Color(0xFFEC4899),
    icon: Icons.sailing_rounded,
  ),
  SponsoredAd(
    sponsor: 'Angostura White Oak Rum',
    title: 'The Real Island Spirit',
    tagline: 'Official rum partner of TIPSY Caribbean Limin App. Please lime responsibly (21+).',
    ctaText: 'Discover Flavors',
    badge: 'ISLAND SPONSOR',
    accentColor: Color(0xFF06B6D4),
    icon: Icons.wine_bar_rounded,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum AppRole { limer, owner }

enum BillingCycle { monthly, annual }

enum SubscriptionTierId { free, vibe, limin, island, elite }

class SubscriptionPlan {
  final SubscriptionTierId id;
  final String name;
  final int monthlyPriceUsd;
  final int annualPriceUsd;
  final String badge;
  final String summary;
  final List<String> benefits;

  const SubscriptionPlan({
    required this.id,
    required this.name,
    required this.monthlyPriceUsd,
    required this.annualPriceUsd,
    required this.badge,
    required this.summary,
    required this.benefits,
  });
}

const List<SubscriptionPlan> kTipsyPlans = [
  SubscriptionPlan(
    id: SubscriptionTierId.vibe,
    name: 'Vibe',
    monthlyPriceUsd: 39,
    annualPriceUsd: 390,
    badge: 'Starter',
    summary: 'Game and Mapso access for Caribbean limers.',
    benefits: [
      'Full Game access (All Fours, Dominoes, Checkers & Party Games)',
      'Mapso live island venue & lime discovery access',
      'Earn verified IslandLink Points',
    ],
  ),
  SubscriptionPlan(
    id: SubscriptionTierId.limin,
    name: "Limin'",
    monthlyPriceUsd: 79,
    annualPriceUsd: 790,
    badge: 'Most Popular',
    summary: 'Adds audio, TopDrop discounts, and fast passes.',
    benefits: [
      'All Vibe tier benefits (Game & Mapso access)',
      'Full Audio & DJ Booth live streams',
      'TopDrop safe ride discounts',
      'Fast passes for partner venues & island events',
    ],
  ),
  SubscriptionPlan(
    id: SubscriptionTierId.island,
    name: 'Island',
    monthlyPriceUsd: 149,
    annualPriceUsd: 1490,
    badge: 'Wallet + Boost',
    summary: 'Includes the IslandPayTT digital wallet.',
    benefits: [
      "All Limin' tier benefits (Audio, TopDrop & Fast Passes)",
      'IslandPayTT wallet for cashless island bar tabs & split bills',
      '1.5x IslandLink Points multiplier',
      'Priority table reservations on Mapso',
    ],
  ),
  SubscriptionPlan(
    id: SubscriptionTierId.elite,
    name: 'Elite',
    monthlyPriceUsd: 249,
    annualPriceUsd: 2490,
    badge: 'VIP All-Access',
    summary:
        'VIP support, exclusive events, early access & designer networking.',
    benefits: [
      'All Island tier benefits & IslandPayTT wallet',
      '24/7 dedicated VIP concierge support',
      'Exclusive VIP events & private island limes',
      'Early access to new features & tournaments',
      'Direct networking with graphic designers',
    ],
  ),
];

class WheelPrizeSlice {
  final String label;
  final String sublabel;
  final int points;
  final Color color;

  const WheelPrizeSlice({
    required this.label,
    required this.sublabel,
    required this.points,
    required this.color,
  });
}

const List<WheelPrizeSlice> kSpinSlices = [
  WheelPrizeSlice(
    label: '500 PTS',
    sublabel: 'JACKPOT!',
    points: 500,
    color: Color(0xFFF59E0B),
  ),
  WheelPrizeSlice(
    label: '50 PTS',
    sublabel: 'Hang Jack',
    points: 50,
    color: Color(0xFF06B6D4),
  ),
  WheelPrizeSlice(
    label: '150 PTS',
    sublabel: 'Rum Runner',
    points: 150,
    color: Color(0xFFF43F5E),
  ),
  WheelPrizeSlice(
    label: '25 PTS',
    sublabel: 'Coconut Sip',
    points: 25,
    color: Color(0xFF10B981),
  ),
  WheelPrizeSlice(
    label: '250 PTS',
    sublabel: 'VIP Limer',
    points: 250,
    color: Color(0xFFA855F7),
  ),
  WheelPrizeSlice(
    label: '75 PTS',
    sublabel: 'Double Six',
    points: 75,
    color: Color(0xFF3B82F6),
  ),
  WheelPrizeSlice(
    label: '100 PTS',
    sublabel: 'Avenue Flame',
    points: 100,
    color: Color(0xFFF97316),
  ),
  WheelPrizeSlice(
    label: '35 PTS',
    sublabel: 'Beach Vibe',
    points: 35,
    color: Color(0xFF14B8A6),
  ),
];

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  AppRole _selectedRole = AppRole.limer;
  SubscriptionTierId _currentTier = SubscriptionTierId.free;
  BillingCycle _billingCycle = BillingCycle.monthly;
  String _selectedLanguage = 'EN';

  // Relocated Profile State
  int _islandLinkPoints = 2450;
  int _dailyStreakDays = 6;
  bool _soundEnabled = true;
  bool _notificationsEnabled = true;
  bool _safeBuddyEnabled = true;

  // Live Digital Clock State
  late Timer _clockTimer;
  String _currentTimeString = '';

  // Bottle Spin Wheel Animation State
  late AnimationController _bottleSpinController;
  Animation<double>? _bottleRotationAnimation;
  double _currentBottleAngle = math.pi / 8;
  WheelPrizeSlice? _lastWonSlice;

  // Landing View Toggle
  bool _isViewingLanding = true;

  // Top Ad Rotation Carousel State
  late PageController _adPageController;
  int _currentAdIndex = 0;
  Timer? _adTimer;

  // Bottom Caribbean Flag Marquee State
  late ScrollController _flagScrollController;
  Timer? _flagScrollTimer;

  bool get _isPaidSubscriber => _currentTier != SubscriptionTierId.free;

  @override
  void initState() {
    super.initState();
    _currentTimeString = _formatTime(DateTime.now());
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          _currentTimeString = _formatTime(DateTime.now());
        });
      }
    });

    _bottleSpinController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3400),
    );

    _adPageController = PageController();
    _adTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (mounted && _adPageController.hasClients) {
        final next = (_currentAdIndex + 1) % kSponsoredAds.length;
        _adPageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    });

    _flagScrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startFlagTicker();
    });
  }

  void _startFlagTicker() {
    _flagScrollTimer = Timer.periodic(const Duration(milliseconds: 40), (_) {
      if (_flagScrollController.hasClients) {
        final double max = _flagScrollController.position.maxScrollExtent;
        final double offset = _flagScrollController.offset;
        if (offset >= max - 2) {
          _flagScrollController.jumpTo(0);
        } else {
          _flagScrollController.jumpTo(offset + 1.2);
        }
      }
    });
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    _bottleSpinController.dispose();
    _adTimer?.cancel();
    _adPageController.dispose();
    _flagScrollTimer?.cancel();
    _flagScrollController.dispose();
    super.dispose();
  }

  String _formatTime(DateTime dt) {
    final int hour12 = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final String h = hour12.toString().padLeft(2, '0');
    final String m = dt.minute.toString().padLeft(2, '0');
    final String s = dt.second.toString().padLeft(2, '0');
    final String period = dt.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m:$s $period';
  }

  void _spinBottleWheel() {
    if (_bottleSpinController.isAnimating) return;

    final random = math.Random();
    final int chosenIndex = random.nextInt(kSpinSlices.length);
    final WheelPrizeSlice chosenSlice = kSpinSlices[chosenIndex];

    final double sliceSweep = (2 * math.pi) / kSpinSlices.length;
    final double targetSliceAngle =
        (chosenIndex * sliceSweep) + (sliceSweep / 2);

    final double normalizedCurrent =
        ((_currentBottleAngle % (2 * math.pi)) + (2 * math.pi)) % (2 * math.pi);
    final double delta =
        (targetSliceAngle - normalizedCurrent + (2 * math.pi)) % (2 * math.pi);
    final double endAngle = _currentBottleAngle + (2 * math.pi * 6) + delta;

    _bottleRotationAnimation = Tween<double>(
      begin: _currentBottleAngle,
      end: endAngle,
    ).animate(
      CurvedAnimation(
        parent: _bottleSpinController,
        curve: Curves.decelerate,
      ),
    )..addListener(() {
        setState(() {});
      });

    _bottleSpinController.forward(from: 0).then((_) {
      setState(() {
        _currentBottleAngle = endAngle;
        _lastWonSlice = chosenSlice;
        _islandLinkPoints += chosenSlice.points;
        _dailyStreakDays = (_dailyStreakDays % 7) + 1;
      });
    });
  }

  void _openSubscriptionModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF070B14),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.88,
                maxChildSize: 0.95,
                minChildSize: 0.5,
                builder: (context, scrollController) {
                  return _buildSubscriptionSheetContent(
                    scrollController,
                    setModalState,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  void _openTipsyTalkDialog() {
    bool isHoldingMic = false;
    String statusText =
        'Hold the microphone button below to capture speech; release to translate.';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: const Color(0xFF0D1424),
              insetPadding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(color: Color(0xFFF472B6), width: 1.5),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Safe-area padded header so "LIVE VOICE TRANSLATE" is never cut off
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'LIVE VOICE TRANSLATE',
                              style: TextStyle(
                                color: Color(0xFFF472B6),
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111827),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          statusText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Asynchronous frequency pulse animation bars
                      SizedBox(
                        height: 36,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(9, (index) {
                            final double barHeight = isHoldingMic
                                ? (14.0 + ((index * 7) % 22))
                                : 8.0;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              width: 6,
                              height: barHeight,
                              decoration: BoxDecoration(
                                color: isHoldingMic
                                    ? const Color(0xFF22D3EE)
                                    : const Color(0xFF334155),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Push-to-Talk Hold Button
                      GestureDetector(
                        onTapDown: (_) {
                          setDialogState(() {
                            isHoldingMic = true;
                            statusText = 'Listening to voice input...';
                          });
                        },
                        onTapUp: (_) {
                          setDialogState(() {
                            isHoldingMic = false;
                            statusText =
                                'Translated: "Wha gaan on! Let\'s lime at the table for All Fours!"';
                          });
                        },
                        onTapCancel: () {
                          setDialogState(() {
                            isHoldingMic = false;
                          });
                        },
                        child: Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isHoldingMic
                                ? const Color(0xFFEC4899)
                                : const Color(0xFF06B6D4),
                          ),
                          child: const Icon(
                            Icons.mic,
                            color: Colors.black,
                            size: 36,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isHoldingMic
                            ? 'LISTENING... RELEASE TO TRANSLATE'
                            : 'HOLD TO SPEAK • RELEASE TO TRANSLATE',
                        style: const TextStyle(
                          color: Color(0xFF67E8F9),
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B14),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Top Bar: Trinidad & Tobago Flag Button + Center Digital Clock + Tipsy Talk
            _buildTopHeaderBar(),

            // 2. Main Body Content (Active Tab or Landing Feed)
            Expanded(
              child: _buildActiveTabContent(),
            ),

            // 3. Continuous Scrolling Caribbean National Flags Marquee Banner
            _buildCaribbeanFlagsMarqueeBanner(),

            // 4. Constrained 6-Tab Bottom Navigation Bar
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // ACTIVE TAB ROUTER (CLEAN ARCHITECTURE: ZERO STATE DUPLICATION)
  // ===========================================================================
  Widget _buildActiveTabContent() {
    if (_isViewingLanding) {
      return _buildHomepageContent();
    }
    switch (_selectedTabIndex) {
      case 0:
        return GamesScreen(
          isPaidSubscriber: _isPaidSubscriber,
          onRequestUpgrade: _openSubscriptionModal,
        );
      case 1:
        return const CreateEventScreen();
      case 2:
        return _buildBoothTab();
      case 3:
        return FriendsScreen(
          onOpenSafeBuddyRadar: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('SafeBuddy Radar Scanning Active Crowd...'),
                backgroundColor: Color(0xFF0F172A),
              ),
            );
          },
        );
      case 4:
        return RewardsScreen(
          currentPoints: _islandLinkPoints,
          streakDays: _dailyStreakDays,
          onOpenDailyCheckIn: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Daily Check-In: +50 IslandLink PTS Claimed!'),
                backgroundColor: Color(0xFF10B981),
              ),
            );
          },
        );
      case 5:
        return _buildProfileTab();
      default:
        return _buildHomepageContent();
    }
  }

  // ===========================================================================
  // TOP AD ROTATION CAROUSEL (ALWAYS AT TOP OF FEED)
  // ===========================================================================
  Widget _buildAdRotationCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 110,
          child: PageView.builder(
            controller: _adPageController,
            onPageChanged: (idx) {
              setState(() {
                _currentAdIndex = idx;
              });
            },
            itemCount: kSponsoredAds.length,
            itemBuilder: (context, index) {
              final ad = kSponsoredAds[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1424),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: ad.accentColor.withValues(alpha: 0.5),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ad.accentColor.withValues(alpha: 0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: ad.accentColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ad.accentColor.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Icon(ad.icon, color: ad.accentColor, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: ad.accentColor.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  ad.badge,
                                  style: TextStyle(
                                    color: ad.accentColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  ad.sponsor,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Text(
                            ad.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            ad.tagline,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Opening ${ad.sponsor}...'),
                            backgroundColor: const Color(0xFF0F172A),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ad.accentColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        minimumSize: const Size(0, 32),
                      ),
                      child: Text(
                        ad.ctaText,
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        // Active Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            kSponsoredAds.length,
            (dotIdx) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _currentAdIndex == dotIdx ? 16 : 6,
              height: 5,
              decoration: BoxDecoration(
                color: _currentAdIndex == dotIdx
                    ? const Color(0xFF22D3EE)
                    : const Color(0xFF334155),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // CONTINUOUS SCROLLING CARIBBEAN NATIONAL FLAGS MARQUEE BANNER
  // ===========================================================================
  Widget _buildCaribbeanFlagsMarqueeBanner() {
    const List<Map<String, String>> flags = [
      {'code': 'tt', 'name': 'TRINIDAD & TOBAGO', 'emoji': '🇹🇹'},
      {'code': 'jm', 'name': 'JAMAICA', 'emoji': '🇯🇲'},
      {'code': 'bb', 'name': 'BARBADOS', 'emoji': '🇧🇧'},
      {'code': 'gd', 'name': 'GRENADA', 'emoji': '🇬🇩'},
      {'code': 'lc', 'name': 'SAINT LUCIA', 'emoji': '🇱🇨'},
      {'code': 'vc', 'name': 'ST. VINCENT', 'emoji': '🇻🇨'},
      {'code': 'ag', 'name': 'ANTIGUA & BARBUDA', 'emoji': '🇦🇬'},
      {'code': 'dm', 'name': 'DOMINICA', 'emoji': '🇩🇲'},
      {'code': 'kn', 'name': 'SAINT KITTS & NEVIS', 'emoji': '🇰🇳'},
      {'code': 'bs', 'name': 'BAHAMAS', 'emoji': '🇧🇸'},
      {'code': 'gy', 'name': 'GUYANA', 'emoji': '🇬🇾'},
      {'code': 've', 'name': 'VENEZUELA', 'emoji': '🇻🇪'},
      {'code': 'bz', 'name': 'BELIZE', 'emoji': '🇧🇿'},
      {'code': 'sr', 'name': 'SURINAME', 'emoji': '🇸🇷'},
    ];
    final tickerList = [...flags, ...flags, ...flags];

    return Container(
      height: 48,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF141F36),
            Color(0xFF090E1C),
            Color(0xFF040710),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            offset: Offset(0, 4),
            blurRadius: 12,
          ),
        ],
        border: const Border(
          top: BorderSide(color: Color(0xFF22D3EE), width: 2.5),
          bottom: BorderSide(color: Color(0xFFEC4899), width: 2.5),
        ),
      ),
      child: RepaintBoundary(
        child: ListView.builder(
          controller: _flagScrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tickerList.length,
          itemBuilder: (context, index) {
            final f = tickerList[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    f['emoji']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    f['name']!,
                    style: const TextStyle(
                      color: Color(0xFFF3F4F6),
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF59E0B),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ===========================================================================
  // DJ BOOTH & LIVE STREAM TAB
  // ===========================================================================
  Widget _buildBoothTab() {
    final List<Map<String, dynamic>> residentDjs = [
      {
        'name': 'DJ Soca Storm',
        'genre': 'Power Soca & Iron Section',
        'tag': 'Soca',
        'bpm': '158 BPM',
        'listeners': '1.4k',
        'color': const Color(0xFFEC4899),
      },
      {
        'name': 'DJ Maya Vibe',
        'genre': 'Afrobeat & Amapiano Fusion',
        'tag': 'AfroBeats',
        'bpm': '112 BPM',
        'listeners': '1.1k',
        'color': const Color(0xFF06B6D4),
      },
      {
        'name': 'Ravi & The IndoWave',
        'genre': 'IndoBeats, Tassa & Chutney Brass',
        'tag': 'IndoBeats',
        'bpm': '136 BPM',
        'listeners': '980',
        'color': const Color(0xFFF59E0B),
      },
      {
        'name': 'DJ Kingston Fire',
        'genre': 'Dancehall & 90s Riddims',
        'tag': 'Dancehall',
        'bpm': '102 BPM',
        'listeners': '870',
        'color': const Color(0xFF10B981),
      },
      {
        'name': 'Roots Lion Sound',
        'genre': 'Roots Reggae & Dubplates',
        'tag': 'Reggae',
        'bpm': '84 BPM',
        'listeners': '760',
        'color': const Color(0xFFEAB308),
      },
      {
        'name': 'Lord Sparrow Heritage',
        'genre': 'Traditional Calypso & Brass',
        'tag': 'Calypso',
        'bpm': '124 BPM',
        'listeners': '690',
        'color': const Color(0xFF8B5CF6),
      },
    ];

    return Container(
      color: const Color(0xFF070B14),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Featured Live Station Card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2E1065), Color(0xFF0F172A), Color(0xFF070B14)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFFEC4899).withValues(alpha: 0.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEC4899).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.sensors_rounded, color: Color(0xFFEC4899), size: 14),
                          SizedBox(width: 4),
                          Text(
                            'LIVE ON AIR',
                            style: TextStyle(color: Color(0xFFF472B6), fontSize: 10, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      '842 LIMERS STREAMING',
                      style: TextStyle(color: Color(0xFF22D3EE), fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'DJ KAIRO • CARNIVAL HEAT 2026',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  'Live Soca, Dancehall & Chutney Brass from Port of Spain.',
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 12),
                ),
                const SizedBox(height: 12),
                // Audio Waveform Visualizer
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '0:00',
                        style: TextStyle(color: Color(0xFF06B6D4), fontSize: 10, fontFamily: 'monospace', fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(24, (i) {
                            final h = ((i * 7) % 18) + 4.0;
                            return Container(
                              width: 3,
                              height: h,
                              decoration: BoxDecoration(
                                color: i < 14 ? const Color(0xFF22D3EE) : const Color(0xFF475569),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '0:20',
                        style: TextStyle(color: Colors.grey, fontSize: 10, fontFamily: 'monospace'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Playing 20-Second Signature Mix Preview... 🎵'),
                              backgroundColor: Color(0xFFEC4899),
                            ),
                          );
                        },
                        icon: const Icon(Icons.play_arrow_rounded, size: 18),
                        label: const Text('20S MIX PREVIEW', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEC4899),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sending Tip via IslandPayTT...'),
                              backgroundColor: Color(0xFF0F172A),
                            ),
                          );
                        },
                        icon: const Icon(Icons.favorite_rounded, color: Color(0xFF22D3EE), size: 16),
                        label: const Text('TIP DJ', style: TextStyle(color: Color(0xFF22D3EE), fontSize: 11, fontWeight: FontWeight.w900)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF06B6D4)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Discover the Sound: Nightlife Selectors & Genres
          const Text(
            'DISCOVER THE SOUND • NIGHTLIFE SELECTORS',
            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900, letterSpacing: 1.0),
          ),
          const SizedBox(height: 4),
          const Text(
            'Explore 20-second quick-listen mix previews across Caribbean genres:',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
          ),
          const SizedBox(height: 10),

          // Genre Selector Horizontal Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                'All Sounds',
                'Soca',
                'Calypso',
                'Dancehall',
                'Reggae',
                'AfroBeats',
                'IndoBeats',
              ].map((genre) {
                final isSelected = genre == 'All Sounds';
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Chip(
                    label: Text(
                      genre,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    backgroundColor: isSelected ? const Color(0xFF22D3EE) : const Color(0xFF0F172A),
                    side: BorderSide(
                      color: isSelected ? const Color(0xFF22D3EE) : const Color(0xFF334155),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 14),

          // Resident Caribbean DJs List
          ...residentDjs.map(
            (dj) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1424),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: (dj['color'] as Color).withValues(alpha: 0.2),
                    child: Icon(Icons.headphones_rounded, color: dj['color'] as Color, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(dj['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                              decoration: BoxDecoration(
                                color: (dj['color'] as Color).withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                dj['tag']!,
                                style: TextStyle(
                                  color: dj['color'] as Color,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${dj['genre']} • ${dj['bpm']}',
                          style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Playing 20s mix snippet for ${dj['name']}... 🎶'),
                          backgroundColor: const Color(0xFF0F172A),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F172A),
                      foregroundColor: const Color(0xFFFBBF24),
                      side: const BorderSide(color: Color(0xFFF59E0B)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      minimumSize: const Size(0, 30),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow_rounded, size: 14, color: Color(0xFFFBBF24)),
                        SizedBox(width: 2),
                        Text('20S PREVIEW', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ===========================================================================
  // TOP HEADER BAR: TRINIDAD & TOBAGO FLAG ICON + DIGITAL CLOCK + TIPSY TALK
  // ===========================================================================
  Widget _buildTopHeaderBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF090D16),
        border: Border(
          bottom: BorderSide(color: Color(0xFF1E293B), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Trinidad & Tobago Flag Icon Button (replaces "Translate" text button)
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: PopupMenuButton<String>(
                onSelected: (lang) {
                  setState(() {
                    _selectedLanguage = lang;
                  });
                },
                color: const Color(0xFF0F172A),
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'EN',
                    child: Text(
                      '🇹🇹 English (Trinidad & Tobago)',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'ES',
                    child: Text(
                      '🇪🇸 Español',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'PT',
                    child: Text(
                      '🇧🇷 Português',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFF06B6D4)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 24,
                        height: 16,
                        child: CustomPaint(
                          painter: _TrinidadTobagoFlagPainter(),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _selectedLanguage,
                        style: const TextStyle(
                          color: Color(0xFF67E8F9),
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Center: Home Feed / Digital Clock Button
          Expanded(
            flex: 4,
            child: Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isViewingLanding = true;
                  });
                },
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _isViewingLanding
                        ? const Color(0xFF0F172A)
                        : const Color(0xFF070B14),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: _isViewingLanding
                          ? const Color(0xFFF59E0B)
                          : const Color(0xFF22D3EE),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: _isViewingLanding
                            ? const Color(0xFFFBBF24)
                            : const Color(0xFF67E8F9),
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _currentTimeString,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: _isViewingLanding
                              ? const Color(0xFFFDE68A)
                              : const Color(0xFF67E8F9),
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Right: Tipsy Talk Quick-Access Button
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: _openTipsyTalkDialog,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1035),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFFF472B6)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.mic, color: Color(0xFFF472B6), size: 14),
                      SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          'Tipsy Talk',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // HOMEPAGE CONTENT: LOGO, TAGLINE, LIMER & OWNER, SPIN WHEEL, PREMIUM BANNERS
  // ===========================================================================
  Widget _buildHomepageContent() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // 1. Top Ad Rotation Carousel (Consistently at top of feed)
              _buildAdRotationCarousel(),
              const SizedBox(height: 14),

        // 2. Centrally Located Large TiPSY Logo, Tagline, Explore CTA & Uniform Limer / Owner Buttons
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1424),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFF06B6D4).withValues(alpha: 0.45),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'TiPSY',
                style: TextStyle(
                  color: Color(0xFF22D3EE),
                  fontSize: 46,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'PLAY • LIME • CONNECT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'CARIBBEAN LIMIN APP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFBBF24),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3.0,
                ),
              ),
              const SizedBox(height: 16),

              // TSK-01: Primary Action Button ("Explore Tipsy") routing to D YARD page
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedTabIndex = 0; // Direct route to D YARD without state duplication
                      _isViewingLanding = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('🎮 Entering D YARD Caribbean Gaming Lounge...'),
                        backgroundColor: Color(0xFF0F172A),
                        duration: Duration(milliseconds: 1200),
                      ),
                    );
                  },
                  icon: const Icon(Icons.sports_esports_rounded, size: 20),
                  label: const Text(
                    'Explore Tipsy',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      letterSpacing: 1.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF06B6D4),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 5,
                    shadowColor: const Color(0xFF06B6D4).withValues(alpha: 0.5),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Uniform LIMER and OWNER Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedRole = AppRole.limer;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedRole == AppRole.limer
                              ? const Color(0xFF06B6D4)
                              : const Color(0xFF1E293B),
                          foregroundColor: _selectedRole == AppRole.limer
                              ? Colors.black
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          '🌴 LIMER',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedRole = AppRole.owner;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedRole == AppRole.owner
                              ? const Color(0xFF10B981)
                              : const Color(0xFF1E293B),
                          foregroundColor: _selectedRole == AppRole.owner
                              ? Colors.black
                              : const Color(0xFF6EE7B7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          '🏪 OWNER',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // 2. Caribbean Daily Spin Wheel with Animated Interactive Bottle at Center
        _buildDailySpinWheelCard(),

        const SizedBox(height: 14),

        // 3. Restricted Subscriber Features with Diagonal "PREMIUM USERS" Banner
        _buildRestrictedFeatureCard(
          badge: 'VIP AI HOST',
          title: "LIMIN' PARTNER AI COMPANION",
          subtitle:
              'Real-time All Fours & Dominoes strategy coach and Caribbean slang translator.',
        ),
        const SizedBox(height: 12),
        _buildRestrictedFeatureCard(
          badge: "LIMIN' AUDIO",
          title: 'TIPSY DJ BOOTH & LIVE STREAMS',
          subtitle:
              'Audition top Caribbean DJs, stream live sets & unlock TopDrop discounts.',
        ),
        const SizedBox(height: 12),
        _buildRestrictedFeatureCard(
          badge: 'ISLAND TIER',
          title: 'ISLANDPAYTT WALLET & VIP RADAR',
          subtitle:
              'Cashless island bar tabs, split bills & priority Mapso table reservations.',
        ),

        const SizedBox(height: 16),

        // 4. Uniform Sign Up and Exit Buttons at Bottom
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _openSubscriptionModal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEC4899),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'SIGN UP',
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _currentTier = SubscriptionTierId.free;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFF43F5E)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'EXIT',
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xFFFDA4AF),
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ])),
    ),
  ],
);
}

  // ===========================================================================
  // CARIBBEAN DAILY SPIN WHEEL WITH ROTATING CENTER BOTTLE
  // ===========================================================================
  Widget _buildDailySpinWheelCard() {
    final double activeAngle =
        _bottleRotationAnimation?.value ?? _currentBottleAngle;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0B111E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFF59E0B).withValues(alpha: 0.6),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'CARIBBEAN DAILY SPIN',
            style: TextStyle(
              color: Color(0xFFFBBF24),
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Tap the interactive bottle at the center of the wheel to spin & land on a prize!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 11),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: 240,
            height: 240,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Wheel Slices
                CustomPaint(
                  size: const Size(240, 240),
                  painter: _SpinWheelPainter(slices: kSpinSlices),
                ),

                // Center Interactive Rotating Bottle Graphic
                GestureDetector(
                  onTap: _spinBottleWheel,
                  child: Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF090D16),
                      border: Border.all(
                        color: const Color(0xFFFBBF24),
                        width: 3,
                      ),
                    ),
                    child: Transform.rotate(
                      angle: activeAngle,
                      child: const CustomPaint(
                        size: Size(64, 64),
                        painter: _RumBottlePainter(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_lastWonSlice != null) ...[
            const SizedBox(height: 12),
            Text(
              '🍾 Bottle landed on ${_lastWonSlice!.label} (${_lastWonSlice!.sublabel})!',
              style: const TextStyle(
                color: Color(0xFF34D399),
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ===========================================================================
  // RESTRICTED FEATURE CARD WITH DIAGONAL "PREMIUM USERS" BANNER
  // ===========================================================================
  Widget _buildRestrictedFeatureCard({
    required String badge,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: _openSubscriptionModal,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                _isPaidSubscriber ? 16 : 48,
                16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFEC4899).withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    badge,
                    style: const TextStyle(
                      color: Color(0xFFFBBF24),
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFD1D5DB),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (!_isPaidSubscriber)
              Positioned(
                top: 18,
                right: -32,
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    width: 136,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFBBF24), Color(0xFFEC4899)],
                      ),
                    ),
                    child: const Text(
                      'PREMIUM USERS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8.5,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // PROFILE TAB (RELOCATED ISLANDLINK VERIFIED POINTS, DAILY STREAK & SETTINGS)
  // ===========================================================================
  Widget _buildProfileTab() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF141022),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFFBBF24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ISLANDLINK VERIFIED',
                      style: TextStyle(
                        color: Color(0xFFFBBF24),
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$_islandLinkPoints PTS',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF141022),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF22D3EE)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DAILY STREAK',
                      style: TextStyle(
                        color: Color(0xFF22D3EE),
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '🔥 ${_dailyStreakDays}d Streak',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1424),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF06B6D4).withValues(alpha: 0.4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'APP SETTINGS & PREFERENCES',
                style: TextStyle(
                  color: Color(0xFF67E8F9),
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Sound Effects',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: _soundEnabled,
                onChanged: (val) => setState(() => _soundEnabled = val),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Push Notifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: _notificationsEnabled,
                onChanged: (val) => setState(() => _notificationsEnabled = val),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'SafeBuddy Radar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: _safeBuddyEnabled,
                onChanged: (val) => setState(() => _safeBuddyEnabled = val),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: _openSubscriptionModal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF06B6D4),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'MANAGE SUBSCRIPTION TIER (${_currentTier.name.toUpperCase()})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // SUBSCRIPTION TIERS MODAL ($39 VIBE, $79 LIMIN', $149 ISLAND, $249 ELITE)
  // ===========================================================================
  Widget _buildSubscriptionSheetContent(
    ScrollController scrollController,
    StateSetter setModalState,
  ) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'TIPSY SUBSCRIPTION TIERS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Color(0xFF22D3EE),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Monthly vs Annual Discount Toggle
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setModalState(() => _billingCycle = BillingCycle.monthly);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _billingCycle == BillingCycle.monthly
                        ? const Color(0xFFEC4899)
                        : Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: const Text(
                    'MONTHLY',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setModalState(() => _billingCycle = BillingCycle.annual);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _billingCycle == BillingCycle.annual
                        ? const Color(0xFF06B6D4)
                        : Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: const Text(
                    'ANNUAL (SAVE 17%)',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        ...kTipsyPlans.map((plan) {
          final bool isSelected = _currentTier == plan.id;
          final String priceText = _billingCycle == BillingCycle.monthly
              ? '\$${plan.monthlyPriceUsd}/mo'
              : '\$${plan.annualPriceUsd}/yr (\$${plan.annualPriceUsd ~/ 12}/mo)';

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1424),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF22D3EE)
                    : Colors.white.withValues(alpha: 0.15),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        plan.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      priceText,
                      style: const TextStyle(
                        color: Color(0xFFFBBF24),
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  plan.summary,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                ...plan.benefits.map(
                  (b) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check,
                          color: Color(0xFF22D3EE),
                          size: 15,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            b,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentTier = plan.id;
                        _islandLinkPoints += 1500;
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF06B6D4),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      isSelected
                          ? 'CURRENT PLAN'
                          : 'SELECT ${plan.name.toUpperCase()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ===========================================================================
  // CONSTRAINED 6-TAB BOTTOM NAVIGATION BAR
  // ===========================================================================
  Widget _buildBottomNavigationBar() {
    const List<String> tabs = [
      'D YARD',
      'LIMES',
      'BOOTH',
      'FRIENDS',
      'REWARDS',
      'PROFILE',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF090D16),
        border: Border(top: BorderSide(color: Color(0xFF1E293B))),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final bool isSelected = _selectedTabIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                  _isViewingLanding = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFF22D3EE)
                        : const Color(0xFF9CA3AF),
                    fontSize: 9.5,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// =============================================================================
// CUSTOM PAINTERS: TRINIDAD & TOBAGO FLAG, SPIN WHEEL SLICES, AND RUM BOTTLE
// =============================================================================

class _TrinidadTobagoFlagPainter extends CustomPainter {
  const _TrinidadTobagoFlagPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final redPaint = Paint()..color = const Color(0xFFCE1126);
    canvas.drawRect(Offset.zero & size, redPaint);

    final whitePath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.22, 0)
      ..lineTo(size.width, size.height * 0.80)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.78, size.height)
      ..lineTo(0, size.height * 0.20)
      ..close();
    canvas.drawPath(whitePath, Paint()..color = Colors.white);

    final blackPath = Path()
      ..moveTo(size.width * 0.04, 0)
      ..lineTo(size.width * 0.18, 0)
      ..lineTo(size.width, size.height * 0.84)
      ..lineTo(size.width * 0.96, size.height)
      ..lineTo(size.width * 0.82, size.height)
      ..lineTo(0, size.height * 0.16)
      ..close();
    canvas.drawPath(blackPath, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SpinWheelPainter extends CustomPainter {
  final List<WheelPrizeSlice> slices;

  const _SpinWheelPainter({required this.slices});

  @override
  void paint(Canvas canvas, Size size) {
    final double sweep = (2 * math.pi) / slices.length;
    final Rect rect = Offset.zero & size;
    final strokePaint = Paint()
      ..color = const Color(0xFF070B14)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    for (int i = 0; i < slices.length; i++) {
      final double startAngle = (i * sweep) - (math.pi / 2);
      final fillPaint = Paint()
        ..color = slices[i].color
        ..style = PaintingStyle.fill;
      canvas.drawArc(rect, startAngle, sweep, true, fillPaint);
      canvas.drawArc(rect, startAngle, sweep, true, strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RumBottlePainter extends CustomPainter {
  const _RumBottlePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;

    // Pointer triangle at top of bottle neck
    final pointerPath = Path()
      ..moveTo(cx, 4)
      ..lineTo(cx - 7, 14)
      ..lineTo(cx + 7, 14)
      ..close();
    canvas.drawPath(pointerPath, Paint()..color = const Color(0xFFEC4899));

    // Gold cap
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 5, 15, 10, 7),
        const Radius.circular(2),
      ),
      Paint()..color = const Color(0xFFF59E0B),
    );

    // Bottle neck
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 6, 22, 12, 14),
        const Radius.circular(2),
      ),
      Paint()..color = const Color(0xFF10B981),
    );

    // Bottle body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 13, 35, 26, 36),
        const Radius.circular(6),
      ),
      Paint()..color = const Color(0xFF059669),
    );

    // Label
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 10, 44, 20, 14),
        const Radius.circular(2),
      ),
      Paint()..color = const Color(0xFF090D16),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
