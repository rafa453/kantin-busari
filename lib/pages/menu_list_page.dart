import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({super.key});

  static const List<Map<String, String>> _menus = [
    {
      'name': 'Ayam Geprek Sambal Korek',
      'price': 'Rp 18.000',
      'time': '15-20 mnt',
      'tag': 'Pedas Mantap',
      'rating': '4.8',
      'tagColor': 'error',
      'img': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB3BzmGn7rVpg0B5wyu9mepCmexFZ5irlgc9rAUI1Nt2bsQilV2E6oW7HLaDJWu0ZP7jEOpFc2LceqDLysEOmcOg1DbuIBIxP0FNYWwjyiGJp74pFSQpBHBvDiV32Ouh4TySoeruWASCZgzt8j_P_D4t0oGVhAZwUcc-73gHLr_5auAwsVnAmx0XBMpn0vSJd66G0xan0JCeZL79Hyx5Ls01wmovRoM1xbkOjKUZx4',
    },
    {
      'name': 'Nasi Goreng Spesial Bu Sari',
      'price': 'Rp 22.000',
      'time': '10-15 mnt',
      'tag': 'Favorit Dosen',
      'rating': '4.9',
      'tagColor': 'secondary',
      'img': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAhSHjMBjnDnWPZ4fSOeDwatk6cdxiI_1h1WpOws9VPtzaYsa-6E3wwZIKZRRWCG0rJuF8I1ySUxvQuUykshLLF1lWER84BEgW8O7F8w4aNHtOtkUuvlrEciCaS4qRcG7bJp2ii0zgiFP4eOxQIludFB-fkVu44Q5skcfsLC8PYcO6F0v8zZ-epptWzvAjXVefmSJ_JsP5m_aVMPvfUqGAX7IIeOwHcLuXmuT7WtT8',
    },
    {
      'name': 'Mie Ayam Bakso Urat',
      'price': 'Rp 16.000',
      'time': '10-12 mnt',
      'tag': 'Kuah Gurih',
      'rating': '4.7',
      'tagColor': 'variant',
      'img': 'https://lh3.googleusercontent.com/aida-public/AB6AXuA2WwfsgDIQNRV05U3tP4WkKJC4qqrHpcTVjLbxI4JwaECwk6s_KkzyVEhEGg2N07-2T5BXkYoHtAPL-z5pfsd2ftWwSkjk3xGyTyMtYRdkhjl51sG6RFdkQlzedRcLapnffGWP2UljGTDHKp4r290rWLZF5d7hjjfdBLefNUuATdEBkciOqbIObiSBhqhb3-rfzx-0RVQpnZm8bgjU8Mu637lpgiEhyjmEc534viA',
    },
    {
      'name': 'Es Teh Manis Jumbo',
      'price': 'Rp 5.000',
      'time': '3-5 mnt',
      'tag': 'Segar & Dingin',
      'rating': '4.9',
      'tagColor': 'primary',
      'img': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDjvgs7TyP44A5GGYDOrlEZBc8ALkrsoKMnfYJheH72Y_mMcLuc110kikjy02JDOnpEwTSteLHTst3In3yqz8kY_BgiU1_dQugIG9eXtPAt4h4Mti60lshCbtu4TEMct3TGjsj8elyCtQdplJVa3CsHqU7F5aAFSlcetKSdvGYsU-T-zmIclv9VXgMpJCK99qWDUnEce94XRAgWAU-AH1SS2V6hkdye1doCDr4CEH4',
    },
    {
      'name': 'Tempe Mendoan Gurih (Isi 3)',
      'price': 'Rp 10.000',
      'time': '5-8 mnt',
      'tag': 'Camilan Hangat',
      'rating': '4.8',
      'tagColor': 'variant',
      'img': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCq61H-XPX_MiTK9oKrP2FKDC7EfUpFGyq1dTuhMuPV0iaFYIGurSNVoWDX3EARpWlaJQkb5xaiBOCoFc_QcsW8P9ncIhOsZD79cTyh3PCGTbnTnJ3Jo7iHsYyiLVxNJkhKjG4lYmtS3OsFJ2gmUThu5TA58JoSj-VUTHWguNUfzfZuOjHM0QDoR2NG12cxbDoi6Ln5BtAf76zu_pXXBJNDfe2M_xCx35Ek0O4OrDs',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildGreeting(context),
            _buildCategoryChips(),
            _buildPromoBanner(),
            _buildSectionHeader(context),
            ..._menus.map((m) => _buildMenuCard(context, m)),
            const SizedBox(height: 88),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context, active: 'home'),
    );
  }

  Widget _buildGreeting(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Halo, selamat datang! \u{1F44B}', style: AppText.headlineLgMobile),
                  SizedBox(height: 2),
                  Text('Mau makan apa hari ini?', style: AppText.bodyMd),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryContainer.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      children: [
                        Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                        const SizedBox(width: 6),
                        Text('Buka', style: AppText.labelSm.copyWith(color: AppColors.secondary, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                    borderRadius: BorderRadius.circular(999),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDiC9DdRg10VpldNjdx-8CjtWzcOL3fP1e5to_UL2_mdDLJXPW0Zdsk89nZnZHPBzA3kLi1QLw-XdTJEVWD5SDQhM325izjWXVWW3PHdppyXQ-jNKU0XybqcEQYvyVeuWey7pmKIL-cSE_CY0yjWwpB-KJQbPBsZRxULCrLgVRi8xIEjDLSIICdakyrHVoPfb-kmLHRkNcoMWWFWgOltFFN4Sd2gYZDU6H6CIBe26Q',
                        width: 36, height: 36, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const CircleAvatar(radius: 18, child: Icon(Icons.person)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(color: AppColors.surfaceLow, borderRadius: BorderRadius.circular(999)),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: Icon(Icons.search, size: 20, color: AppColors.onVariant),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari nasi goreng, ayam geprek, es teh...',
                      hintStyle: AppText.bodyMd,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(color: AppColors.surfaceContainer, shape: BoxShape.circle),
                    child: const Icon(Icons.tune, size: 18, color: AppColors.onVariant),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    const cats = [
      ['lunch_dining', 'Makanan'],
      ['local_cafe', 'Minuman'],
      ['cookie', 'Snack'],
      ['bento', 'Paket'],
      ['percent', 'Promo Hemat'],
    ];
    const icons = {
      'lunch_dining': Icons.lunch_dining,
      'local_cafe': Icons.local_cafe,
      'cookie': Icons.cookie,
      'bento': Icons.bento,
      'percent': Icons.percent,
    };
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final active = i == 0;
          final promo = i == cats.length - 1;
          final Color bg = active
              ? AppColors.primaryContainer
              : promo
                  ? AppColors.tertiaryFixed
                  : AppColors.surfaceLowest;
          final Color fg = active
              ? Colors.white
              : promo
                  ? AppColors.onTertiaryFixedVar
                  : AppColors.onVariant;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
            child: Row(
              children: [
                Icon(icons[cats[i][0]], size: 18, color: fg),
                const SizedBox(width: 6),
                Text(cats[i][1], style: AppText.labelMd.copyWith(color: fg)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondary]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.local_fire_department, size: 14, color: Colors.white),
                        const SizedBox(width: 4),
                        Text('MAKAN HEMAT HARI INI',
                            style: AppText.labelSm.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('Diskon 20% Paket Makan Siang',
                      style: AppText.headlineSm.copyWith(color: Colors.white)),
                  const SizedBox(height: 2),
                  Text('Klaim kupon langsung di kasir kantin',
                      style: AppText.bodySm.copyWith(color: const Color(0xFFCBFFC2))),
                ],
              ),
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.savings, size: 32, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text('Menu Hari Ini', style: AppText.headlineMd),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(999)),
                child: Text('Terpopuler', style: AppText.labelSm.copyWith(color: AppColors.secondary)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text('Lihat Semua', style: AppText.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                const Icon(Icons.chevron_right, size: 16, color: AppColors.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, Map<String, String> m) {
    final Color tagColor;
    switch (m['tagColor']) {
      case 'error':
        tagColor = AppColors.error;
        break;
      case 'secondary':
        tagColor = AppColors.secondary;
        break;
      case 'primary':
        tagColor = AppColors.primary;
        break;
      default:
        tagColor = AppColors.onVariant;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/detail'),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surfaceLowest,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.network(m['img']!, width: 80, height: 80, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(width: 80, height: 80, color: AppColors.surfaceContainer)),
                    Positioned(
                      left: 4,
                      bottom: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            const Icon(Icons.star, size: 10, color: AppColors.tertiary),
                            const SizedBox(width: 2),
                            Text(m['rating']!, style: AppText.labelSm.copyWith(fontSize: 9, color: AppColors.tertiary)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m['name']!, style: AppText.headlineSm, overflow: TextOverflow.ellipsis, maxLines: 1),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.schedule, size: 13, color: AppColors.onVariant),
                        const SizedBox(width: 4),
                        Text(m['time']!, style: AppText.bodySm),
                        const Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Text('\u2022', style: AppText.bodySm)),
                        Flexible(
                          child: Text(m['tag']!,
                              style: AppText.bodySm.copyWith(color: tagColor, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(m['price']!, style: AppText.headlineSm.copyWith(fontWeight: FontWeight.bold)),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(color: AppColors.primaryContainer, shape: BoxShape.circle),
                          child: const Icon(Icons.add, size: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context, {required String active}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.95),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16, offset: const Offset(0, -4))],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.restaurant, 'Home', active == 'home', () {}),
              _navItem(Icons.local_mall, 'Keranjang', active == 'keranjang',
                  () => Navigator.pushNamed(context, '/pesan'), badge: '3'),
              _navItem(Icons.receipt_long, 'Riwayat', active == 'riwayat', () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active, VoidCallback onTap, {String? badge}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, size: 24, color: active ? AppColors.primaryContainer : AppColors.onVariant),
                if (badge != null)
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      width: 16,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: AppColors.primaryContainer, shape: BoxShape.circle),
                      child: Text(badge, style: AppText.labelSm.copyWith(fontSize: 10, color: Colors.white)),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(label,
                style: AppText.labelSm.copyWith(
                    color: active ? AppColors.primaryContainer : AppColors.onVariant,
                    fontWeight: active ? FontWeight.bold : FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}