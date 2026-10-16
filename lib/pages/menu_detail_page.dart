import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _heroImage(context),
                _infoSection(),
                Container(height: 8, color: AppColors.surfaceLow, margin: const EdgeInsets.symmetric(vertical: 16)),
                _customSection(),
              ],
            ),
          ),
          _bottomDock(context),
        ],
      ),
    );
  }

  Widget _heroImage(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
          child: Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAHpRKsXk4EdWqeXgnAf1jnJMRaCtQGkIKQb39iQvc3nqnelj-ON_1ipC_uha8Pmi2ibSFZcfKB4Ak8vIpraknvtkY2LNST0rtiOdqJCgkXh2E5ak9vsePuMD1r1K_KRT53qFYuDK30nCq7Izo00g6H3h76oMZQZRAjcmO6QGf4mfULbcoRJR4EwMkz6uy1UUyWdFq1Fy9C7flQKP63QmFkotGy1qxIFTme2D8Z8FI',
            height: 288, width: double.infinity, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(height: 288, color: AppColors.surfaceContainer),
          ),
        ),
        Container(
          height: 288,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withValues(alpha: 0.4)]),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                _circleBtn(Icons.arrow_back, () => Navigator.pop(context)),
                const Spacer(),
                _circleBtn(Icons.favorite_border, () {}),
                const SizedBox(width: 8),
                _circleBtn(Icons.share, () {}),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16, right: 16, bottom: 16,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.92), borderRadius: BorderRadius.circular(999)),
                child: Row(children: [
                  const Icon(Icons.star, size: 16, color: AppColors.tertiaryContainer),
                  const SizedBox(width: 4),
                  Text('4.8', style: AppText.labelMd.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  Text('(240+)', style: AppText.bodySm),
                ]),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(999)),
                child: Text('PALING LARIS', style: AppText.labelSm.copyWith(color: Colors.white, letterSpacing: 0.6)),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.errorContainer, borderRadius: BorderRadius.circular(999)),
                child: Row(children: [
                  const Icon(Icons.local_fire_department, size: 14, color: AppColors.onErrorContainer),
                  const SizedBox(width: 4),
                  Text('Pedas Mantap', style: AppText.labelMd.copyWith(color: AppColors.onErrorContainer)),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 36, height: 36, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), shape: BoxShape.circle), child: Icon(icon, size: 18, color: AppColors.onSurface)),
    );
  }

  Widget _infoSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Ayam Geprek Sambal Korek', style: AppText.headlineLgMobile),
                  const SizedBox(height: 2),
                  Text('Resep Khas Warung Bu Sari', style: AppText.labelMd.copyWith(color: AppColors.secondary)),
                ]),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('Rp 18.000', style: AppText.headlineMd.copyWith(color: AppColors.primaryContainer)),
                Text('Rp 22.000', style: AppText.bodySm.copyWith(decoration: TextDecoration.lineThrough)),
              ]),
            ],
          ),
          const SizedBox(height: 8),
          Text('Ayam krispi gurih dengan ulekan sambal korek bawang pedas khas Bu Sari, disajikan hangat dengan lalapan timun segar dan kemangi aromatik.', style: AppText.bodyMd.copyWith(height: 1.5)),
          const SizedBox(height: 12),
          Row(
            children: [
              _statCard(Icons.timer, '10-15 mnt', 'Waktu Masak', AppColors.primary),
              const SizedBox(width: 8),
              _statCard(Icons.restaurant, 'Fresh Made', 'Digeprek Dadakan', AppColors.secondary),
              const SizedBox(width: 8),
              _statCard(Icons.verified, '100% Halal', 'Bahan Alami', AppColors.tertiaryContainer),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCard(IconData icon, String title, String sub, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(color: AppColors.surfaceLow, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 4),
          Text(title, style: AppText.labelSm.copyWith(fontSize: 11)),
          Text(sub, style: AppText.bodySm.copyWith(fontSize: 10), textAlign: TextAlign.center),
        ]),
      ),
    );
  }

  Widget _customSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHead('Tingkat Kepedasan', 'Pilih salah satu sesuai selera'),
          const SizedBox(height: 8),
          _radioTile('Level 1: Santai', 'Cabai 3 biji, pedas ringan nikmat', Icons.sentiment_satisfied, false),
          const SizedBox(height: 8),
          _radioTile('Level 2: Sedang (Favorit)', 'Cabai 7 biji, standar pedas nagih', Icons.whatshot, true),
          const SizedBox(height: 8),
          _radioTile('Level 3: Ekstra Pedas', 'Cabai 15 biji + rawit merah membara', Icons.local_fire_department, false),
          const SizedBox(height: 20),
          _sectionHead('Pilihan Nasi', 'Lengkapi santapanmu'),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(child: _riceCard('Nasi Putih', '+Rp 4.000', Icons.rice_bowl, true)),
            const SizedBox(width: 8),
            Expanded(child: _riceCard('Tanpa Nasi', '+Rp 0', Icons.close, false)),
          ]),
          const SizedBox(height: 20),
          Text('Catatan untuk Warung', style: AppText.headlineSm),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cth: Sambal dipisah, perbanyak timun ya...',
              hintStyle: AppText.bodyMd,
              filled: true, fillColor: AppColors.surfaceLow,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHead(String title, String sub) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppText.headlineSm),
          Text(sub, style: AppText.bodySm),
        ]),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(color: AppColors.secondaryFixed, borderRadius: BorderRadius.circular(999)),
          child: Text('Wajib', style: AppText.labelSm.copyWith(fontSize: 10, color: AppColors.secondary)),
        ),
      ],
    );
  }

  Widget _radioTile(String title, String sub, IconData icon, bool selected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryFixed.withValues(alpha: 0.3) : AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(12),
        border: selected ? Border.all(color: AppColors.primary.withValues(alpha: 0.3)) : null,
      ),
      child: Row(children: [
        Container(
          width: 18, height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: selected ? AppColors.primary : AppColors.outline, width: 2),
            color: selected ? AppColors.primary : Colors.transparent,
          ),
          child: selected ? const Icon(Icons.check, size: 10, color: Colors.white) : null,
        ),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppText.labelLg.copyWith(fontSize: 13)),
          Text(sub, style: AppText.bodySm),
        ])),
        Icon(icon, size: 18, color: selected ? AppColors.tertiaryContainer : AppColors.onVariant),
      ]),
    );
  }

  Widget _riceCard(String title, String price, IconData icon, bool selected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryFixed.withValues(alpha: 0.3) : AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(12),
        border: selected ? Border.all(color: AppColors.primary.withValues(alpha: 0.3)) : null,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(icon, size: 20, color: selected ? AppColors.primary : AppColors.onVariant),
          Container(
            width: 18, height: 18,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: selected ? AppColors.primary : AppColors.outline, width: 2), color: selected ? AppColors.primary : Colors.transparent),
            child: selected ? const Icon(Icons.check, size: 10, color: Colors.white) : null,
          ),
        ]),
        const SizedBox(height: 8),
        Text(title, style: AppText.labelLg.copyWith(fontSize: 13)),
        Text(price, style: AppText.labelMd.copyWith(color: selected ? AppColors.primary : AppColors.onVariant, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _bottomDock(BuildContext context) {
    return Positioned(
      left: 0, right: 0, bottom: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: BoxDecoration(color: AppColors.surface.withValues(alpha: 0.95), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16, offset: const Offset(0, -4))]),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: AppColors.surfaceLow, borderRadius: BorderRadius.circular(999)),
                  child: Row(children: [
                    _qtyBtn(Icons.remove),
                    const SizedBox(width: 12, child: Text('1', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                    _qtyBtn(Icons.add, filled: true),
                  ]),
                ),
                const Spacer(),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('Total Pesanan', style: AppText.bodySm),
                  Text('Rp 22.000', style: AppText.headlineSm.copyWith(fontWeight: FontWeight.bold)),
                ]),
              ]),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity, height: 48,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/pesan'),
                  icon: const Icon(Icons.shopping_bag, size: 20),
                  label: const Text('Tambah ke Keranjang \u2022 Rp 22.000'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer, foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _qtyBtn(IconData icon, {bool filled = false}) {
    return Container(
      width: 36, height: 36,
      decoration: BoxDecoration(color: filled ? AppColors.surfaceLowest : Colors.white, shape: BoxShape.circle, boxShadow: filled ? [] : [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 4)]),
      child: Icon(icon, size: 18, color: AppColors.primary),
    );
  }
}
