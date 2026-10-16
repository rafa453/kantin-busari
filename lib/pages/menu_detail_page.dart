import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_image.dart';

class MenuDetailPage extends StatefulWidget {
  const MenuDetailPage({super.key});

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  int _spice = 2;
  bool _withRice = true;

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.palette;
    return Scaffold(
      backgroundColor: c.surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _heroImage(context),
                _infoSection(context),
                Container(height: 8, color: c.surfaceLow, margin: const EdgeInsets.symmetric(vertical: 16)),
                _customSection(context),
              ],
            ),
          ),
          _bottomDock(context),
        ],
      ),
    );
  }

  Widget _heroImage(BuildContext context) {
    final c = context.palette;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
          child: const AppImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAHpRKsXk4EdWqeXgnAf1jnJMRaCtQGkIKQb39iQvc3nqnelj-ON_1ipC_uha8Pmi2ibSFZcfKB4Ak8vIpraknvtkY2LNST0rtiOdqJCgkXh2E5ak9vsePuMD1r1K_KRT53qFYuDK30nCq7Izo00g6H3h76oMZQZRAjcmO6QGf4mfULbcoRJR4EwMkz6uy1UUyWdFq1Fy9C7flQKP63QmFkotGy1qxIFTme2D8Z8FI',
            height: 288, width: double.infinity, semanticLabel: 'Foto Ayam Geprek Sambal Korek',
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
                _circleBtn(Icons.arrow_back, 'Kembali', () => Navigator.pop(context)),
                const Spacer(),
                _circleBtn(Icons.favorite_border, 'Favorit', () => _snack(context, 'Disimpan ke favorit')),
                const SizedBox(width: 8),
                _circleBtn(Icons.share, 'Bagikan', () => _snack(context, 'Tautan menu disalin')),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16, right: 16, bottom: 16,
          child: Wrap(
            spacing: 8,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.92), borderRadius: BorderRadius.circular(999)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, size: 16, color: Color(0xFF9C6000)),
                    const SizedBox(width: 4),
                    Text('4.8', style: AppText.labelMd.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    Text('(240+)', style: AppText.bodySm.copyWith(color: Colors.black54)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: c.primary, borderRadius: BorderRadius.circular(999)),
                child: Text('PALING LARIS', style: AppText.labelSm.copyWith(color: Colors.white, letterSpacing: 0.6)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: c.errorContainer, borderRadius: BorderRadius.circular(999)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.local_fire_department, size: 14, color: c.onErrorContainer),
                    const SizedBox(width: 4),
                    Text('Pedas Mantap', style: AppText.labelMd.copyWith(color: c.onErrorContainer)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _circleBtn(IconData icon, String label, VoidCallback onTap) {
    return Semantics(
      label: label,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(width: 36, height: 36, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), shape: BoxShape.circle), child: Icon(icon, size: 18, color: Colors.black)),
      ),
    );
  }

  Widget _infoSection(BuildContext context) {
    final c = context.palette;
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
                  Text('Ayam Geprek Sambal Korek', style: AppText.headlineLgMobile.copyWith(color: c.onSurface)),
                  const SizedBox(height: 2),
                  Text('Resep Khas Warung Bu Sari', style: AppText.labelMd.copyWith(color: c.secondary)),
                ]),
              ),
              const SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('Rp 18.000', style: AppText.headlineMd.copyWith(color: c.primaryContainer)),
                Text('Rp 22.000', style: AppText.bodySm.copyWith(color: c.onVariant, decoration: TextDecoration.lineThrough)),
              ]),
            ],
          ),
          const SizedBox(height: 8),
          Text('Ayam krispi gurih dengan ulekan sambal korek bawang pedas khas Bu Sari, disajikan hangat dengan lalapan timun segar dan kemangi aromatik.',
              style: AppText.bodyMd.copyWith(color: c.onVariant, height: 1.5)),
          const SizedBox(height: 12),
          Row(
            children: [
              _statCard(context, Icons.timer, '10-15 mnt', 'Waktu Masak', c.primary),
              const SizedBox(width: 8),
              _statCard(context, Icons.restaurant, 'Fresh Made', 'Digeprek Dadakan', c.secondary),
              const SizedBox(width: 8),
              _statCard(context, Icons.verified, '100% Halal', 'Bahan Alami', c.tertiaryContainer),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCard(BuildContext context, IconData icon, String title, String sub, Color color) {
    final c = context.palette;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(color: c.surfaceLow, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 4),
          Text(title, style: AppText.labelSm.copyWith(fontSize: 11, color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(sub, style: AppText.bodySm.copyWith(fontSize: 10, color: c.onVariant), textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
        ]),
      ),
    );
  }

  Widget _customSection(BuildContext context) {
    final c = context.palette;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHead(context, 'Tingkat Kepedasan', 'Pilih salah satu sesuai selera'),
          const SizedBox(height: 8),
          RadioGroup<int>(
            groupValue: _spice,
            onChanged: (v) => setState(() => _spice = v!),
            child: Column(
              children: [
                _radioTile(context, 1, 'Level 1: Santai', 'Cabai 3 biji, pedas ringan nikmat', Icons.sentiment_satisfied),
                const SizedBox(height: 8),
                _radioTile(context, 2, 'Level 2: Sedang (Favorit)', 'Cabai 7 biji, standar pedas nagih', Icons.whatshot),
                const SizedBox(height: 8),
                _radioTile(context, 3, 'Level 3: Ekstra Pedas', 'Cabai 15 biji + rawit merah membara', Icons.local_fire_department),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _sectionHead(context, 'Pilihan Nasi', 'Lengkapi santapanmu'),
          const SizedBox(height: 8),
          RadioGroup<bool>(
            groupValue: _withRice,
            onChanged: (v) => setState(() => _withRice = v!),
            child: Row(children: [
              Expanded(child: _riceCard(context, true, 'Nasi Putih', '+Rp 4.000', Icons.rice_bowl)),
              const SizedBox(width: 8),
              Expanded(child: _riceCard(context, false, 'Tanpa Nasi', '+Rp 0', Icons.close)),
            ]),
          ),
          const SizedBox(height: 20),
          Text('Catatan untuk Warung', style: AppText.headlineSm.copyWith(color: c.onSurface)),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cth: Sambal dipisah, perbanyak timun ya...',
              hintStyle: AppText.bodyMd.copyWith(color: c.onVariant),
              filled: true, fillColor: c.surfaceLow,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHead(BuildContext context, String title, String sub) {
    final c = context.palette;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: AppText.headlineSm.copyWith(color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(sub, style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
          ]),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(color: c.secondaryContainer, borderRadius: BorderRadius.circular(999)),
          child: Text('Wajib', style: AppText.labelSm.copyWith(fontSize: 10, color: c.secondary)),
        ),
      ],
    );
  }

Widget _radioTile(BuildContext context, int value, String title, String sub, IconData icon) {
    final c = context.palette;
    final sel = _spice == value;
    return InkWell(
      onTap: () => setState(() => _spice = value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: sel ? c.primaryFixed.withValues(alpha: 0.3) : c.surfaceLow,
          borderRadius: BorderRadius.circular(12),
          border: sel ? Border.all(color: c.primary.withValues(alpha: 0.3)) : null,
        ),
        child: Row(children: [
          Radio<int>(value: value, visualDensity: VisualDensity.compact, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
          const SizedBox(width: 6),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: AppText.labelLg.copyWith(fontSize: 13, color: c.onSurface)),
            Text(sub, style: AppText.bodySm.copyWith(color: c.onVariant)),
          ])),
          Icon(icon, size: 18, color: sel ? c.tertiaryContainer : c.onVariant),
        ]),
      ),
    );
  }

  Widget _riceCard(BuildContext context, bool rice, String title, String price, IconData icon) {
    final c = context.palette;
    final sel = _withRice == rice;
    return InkWell(
      onTap: () => setState(() => _withRice = rice),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: sel ? c.primaryFixed.withValues(alpha: 0.3) : c.surfaceLow,
          borderRadius: BorderRadius.circular(12),
          border: sel ? Border.all(color: c.primary.withValues(alpha: 0.3)) : null,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(icon, size: 20, color: sel ? c.primary : c.onVariant),
            Radio<bool>(value: rice, visualDensity: VisualDensity.compact, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ]),
          const SizedBox(height: 8),
          Text(title, style: AppText.labelLg.copyWith(fontSize: 13, color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(price, style: AppText.labelMd.copyWith(color: sel ? c.primary : c.onVariant, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
        ]),
      ),
    );
  }

  Widget _bottomDock(BuildContext context) {
    final c = context.palette;
    return Positioned(
      left: 0, right: 0, bottom: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: BoxDecoration(color: c.surface.withValues(alpha: 0.95), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16, offset: const Offset(0, -4))]),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: c.surfaceLow, borderRadius: BorderRadius.circular(999)),
                  child: Row(children: [
                    _qtyBtn(context, Icons.remove, 'Kurangi jumlah', () => _snack(context, 'Jumlah minimal 1')),
                    SizedBox(width: 24, child: Text('1', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: c.onSurface))),
                    _qtyBtn(context, Icons.add, 'Tambah jumlah', () => _snack(context, 'Jumlah bertambah'), filled: true),
                  ]),
                ),
                const Spacer(),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('Total Pesanan', style: AppText.bodySm.copyWith(color: c.onVariant)),
                  Text('Rp 22.000', style: AppText.headlineSm.copyWith(color: c.onSurface, fontWeight: FontWeight.bold)),
                ]),
              ]),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity, height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/pesan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c.primaryContainer, foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_bag, size: 20),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text('Tambah ke Keranjang \u2022 Rp 22.000',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _qtyBtn(BuildContext context, IconData icon, String label, VoidCallback onTap, {bool filled = false}) {
    final c = context.palette;
    return Semantics(
      label: label,
      button: true,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 36, height: 36,
          decoration: BoxDecoration(color: filled ? c.surfaceLowest : c.surfaceLow, shape: BoxShape.circle),
          child: Icon(icon, size: 18, color: c.primary),
        ),
      ),
    );
  }
}
