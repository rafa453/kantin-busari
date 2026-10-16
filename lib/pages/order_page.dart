import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_image.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool _dineIn = true;

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.palette;
    return Scaffold(
      backgroundColor: c.surface,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 120),
          children: [
            _topMeta(context),
            _modeSwitch(context),
            _cartItems(context),
            _kitchenNote(context),
            _moreItemsCard(context),
            _paymentSummary(context),
            _freshGuarantee(context),
            _checkoutButton(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _topMeta(BuildContext context) {
    final c = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Semantics(
            label: 'Kembali',
            button: true,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: c.onSurface),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Keranjang Pesanan', style: AppText.headlineMd.copyWith(color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
              Row(children: [
                Icon(Icons.storefront, size: 14, color: c.primary),
                const SizedBox(width: 4),
                Flexible(
                  child: Text('Kantin Bu Sari \u2022 ',
                      style: AppText.labelMd.copyWith(color: c.onVariant),
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
                Text('Meja 04', style: AppText.labelMd.copyWith(color: c.secondary, fontWeight: FontWeight.bold)),
              ]),
            ]),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: c.secondaryContainer, borderRadius: BorderRadius.circular(999)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(width: 6, height: 6, decoration: BoxDecoration(color: c.primary, shape: BoxShape.circle)),
              const SizedBox(width: 6),
              Text('3 Menu Dipilih', style: AppText.labelSm.copyWith(color: c.secondary), maxLines: 1),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _modeSwitch(BuildContext context) {
    final c = context.palette;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SegmentedButton<bool>(
        segments: [
          ButtonSegment(value: true, label: Text('Makan di Tempat', style: AppText.labelMd), icon: Icon(Icons.table_restaurant, size: 16, color: c.primary)),
          ButtonSegment(value: false, label: Text('Bungkus Pulang', style: AppText.labelMd), icon: Icon(Icons.shopping_bag, size: 16, color: c.onVariant)),
        ],
        selected: {_dineIn},
        onSelectionChanged: (Set<bool> v) {
          setState(() => _dineIn = v.first);
          _snack(context, 'Mode: ${v.first ? "Makan di Tempat" : "Bungkus Pulang"}');
        },
        style: ButtonStyle(
          side: WidgetStateProperty.all(BorderSide(color: c.surfaceContainer)),
          backgroundColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? c.surfaceLowest : c.surfaceContainer),
        ),
      ),
    );
  }

  Widget _cartItems(BuildContext context) {
    final c = context.palette;
    final items = [
      {
        'name': 'Ayam Geprek Sambal Korek',
        'sub': 'Level 2 (Sedang), + Nasi Putih',
        'price': 'Rp 22.000',
        'qty': '2',
        'note': 'Sambal dipisah separuh',
        'img': 'https://lh3.googleusercontent.com/aida-public/AB6AXuD2IUoTvV0CgMg13Pn8Z6qhdPXZ3Uwx5EZ0TuYE4sTBGO0G46Jas7dhdrS4n5eNdZYvwSptzdDmIrxVN_1zx_yMTjs-N6VNtCecFa0ZMCBoHcQUuIoZSEeODxy_smYDSf_1q9S7i76k-X9U1L6tDhVBcmNlmDEUsLiZX-RVH-inSlxFv4M_iisN5X46y_NS86mzOGQBSzxExypdq_Yzd3pZXPN9aoi2D0cn1ww-5SI',
      },
      {
        'name': 'Es Teh Manis Jumbo',
        'sub': 'Gula sedikit (less sugar)',
        'price': 'Rp 5.000',
        'qty': '2',
        'note': 'Es batu normal',
        'img': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDPrnz6zsvjDpGRoIs7g_hCIW8umKHAf7-zV-6_noqFwW8kwziU0sb7x7UfG4eZatuIk2K1F1vLdW-RH_Sa9RDsLQCRZUlX0_KsLB2n7x8XgIO1s7sKOcscBTrM7WXPRBvQBTvysA9Gwa7VBg_80lYJDqjnkrJxbQ95C37tZ9pQdwaeuHgJpnxu73eNVSGqck77C3kPvnSghlx-iwheABvk1ygTW5zV7aRekDGySUI',
      },
      {
        'name': 'Tempe Mendoan Gurih',
        'sub': 'Isi 3 pcs \u2022 Sambal kecap ekstra',
        'price': 'Rp 10.000',
        'qty': '1',
        'note': 'Goreng setengah matang',
        'img': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBbFh2xIW0BgfQ5fkUYCd7IpFry0NmWKnPgQTQfA6kcFGzMeZPx7GBzZz3rJU4FZMmS8vK8QhoZ4L3z6UTMDMq3X1CMRMBH50T9eT15mSSH_X4r4P25HAOdAXnbna7Hn4Du3VlqV3toRQ74psK0IWNn-UQ8HC7ySps7ZUoANuBrK3gAVOnf9hZ3UtYlvdc7ACzGYDffYgHtGP7vI1wmptTDmQP1ekIBpKidOQuJHxw',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: items.map((it) {
          return Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: c.surfaceLowest, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)]),
            child: Column(children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppImage(it['img']!, width: 72, height: 72, semanticLabel: it['name'] as String),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Expanded(child: Text(it['name']!, style: AppText.headlineSm.copyWith(fontSize: 14, color: c.onSurface), maxLines: 2, overflow: TextOverflow.ellipsis)),
                      Semantics(
                        label: 'Hapus ${it['name']}',
                        button: true,
                        child: InkWell(
                          onTap: () => _snack(context, '${it['name']} dihapus'),
                          customBorder: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(Icons.close, size: 16, color: c.onVariant),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 2),
                    Text(it['sub']!, style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text(it['price']!, style: AppText.labelLg.copyWith(color: c.primary, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ]),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: c.surfaceLow, borderRadius: BorderRadius.circular(6)),
                    child: Row(children: [
                      Icon(Icons.edit_note, size: 14, color: c.tertiary),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(it['note']!, style: AppText.bodySm.copyWith(color: c.onVariant, fontStyle: FontStyle.italic), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(color: c.surfaceContainer, borderRadius: BorderRadius.circular(999)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    _stepperBtn(context, Icons.remove, 'Kurangi ${it['name']}', isAdd: false, onTap: () => _snack(context, 'Jumlah dikurangi')),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text(it['qty']!, style: AppText.labelMd.copyWith(color: c.onSurface, fontWeight: FontWeight.bold))),
                    _stepperBtn(context, Icons.add, 'Tambah ${it['name']}', isAdd: true, onTap: () => _snack(context, 'Jumlah ditambah')),
                  ]),
                ),
              ]),
            ]),
          );
        }).toList(),
      ),
    );
  }

  Widget _stepperBtn(BuildContext context, IconData icon, String label, {required bool isAdd, required VoidCallback onTap}) {
    final c = context.palette;
    return Semantics(
      label: label,
      button: true,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 24, height: 24,
          decoration: BoxDecoration(color: isAdd ? c.primaryContainer : c.surfaceLowest, shape: BoxShape.circle),
          child: Icon(icon, size: 14, color: isAdd ? Colors.white : c.primary),
        ),
      ),
    );
  }

  Widget _kitchenNote(BuildContext context) {
    final c = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: c.surfaceLowest, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.edit, size: 16, color: c.primary),
            const SizedBox(width: 6),
            Expanded(
              child: Text('Catatan untuk Dapur Bu Sari',
                  style: AppText.labelMd.copyWith(color: c.onSurface, fontWeight: FontWeight.w600),
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(width: 8),
            Text('Opsional', style: AppText.bodySm.copyWith(color: c.onVariant)),
          ]),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Contoh: Jangan terlalu pedas, kuah dipisah...',
              hintStyle: AppText.bodyMd.copyWith(color: c.onVariant),
              filled: true, fillColor: c.surfaceLow,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _moreItemsCard(BuildContext context) {
    final c = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: c.secondaryContainer.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(color: c.secondaryContainer, shape: BoxShape.circle),
            child: Icon(Icons.add_circle, size: 20, color: c.secondary),
          ),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Masih lapar?', style: AppText.labelMd.copyWith(color: c.onSurface, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('Cari gorengan atau sambal tambahan', style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
          ])),
          const SizedBox(width: 8),
          Semantics(
            button: true,
            child: InkWell(
              onTap: () => _snack(context, 'Menambah menu lain'),
              borderRadius: BorderRadius.circular(999),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: c.surfaceLowest, borderRadius: BorderRadius.circular(999)),
                child: Text('+ Tambah', style: AppText.labelSm.copyWith(color: c.primary, fontWeight: FontWeight.bold), maxLines: 1),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _paymentSummary(BuildContext context) {
    final c = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: c.surfaceLowest, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.receipt, size: 18, color: c.secondary),
            const SizedBox(width: 6),
            Expanded(child: Text('Ringkasan Pembayaran', style: AppText.headlineSm.copyWith(color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis)),
          ]),
          const SizedBox(height: 12),
          _summaryRow(context, 'Subtotal pesanan (5 item)', 'Rp 64.000'),
          const SizedBox(height: 6),
          _summaryRow(context, 'Biaya kemasan & layanan', 'Rp 2.000'),
          const SizedBox(height: 6),
          _summaryRow(context, 'Promo Warung Hemat', '-Rp 0', isPromo: true),
          Divider(height: 20, color: c.outlineVariant),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Total Pembayaran', style: AppText.headlineSm.copyWith(color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
              Text('Termasuk pajak daerah 10%', style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
            ])),
            const SizedBox(width: 8),
            Text('Rp 66.000', style: AppText.headlineLgMobile.copyWith(color: c.primary, fontWeight: FontWeight.bold)),
          ]),
        ]),
      ),
    );
  }

  Widget _summaryRow(BuildContext context, String label, String value, {bool isPromo = false}) {
    final c = context.palette;
    return Row(children: [
      Expanded(child: Text(label, style: AppText.bodyMd.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis)),
      const SizedBox(width: 8),
      Text(value, style: AppText.bodyMd.copyWith(fontWeight: FontWeight.w600, color: isPromo ? c.secondary : c.onSurface)),
    ]);
  }

  Widget _freshGuarantee(BuildContext context) {
    final c = context.palette;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.verified, size: 14, color: c.primary),
        const SizedBox(width: 6),
        Flexible(child: Text('Masakan hangat langsung dari wajan Bu Sari', style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis)),
      ]),
    );
  }

  Widget _checkoutButton(BuildContext context) {
    final c = context.palette;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: () => _snack(context, 'Pesanan dikirim ke dapur Bu Sari!'),
          style: ElevatedButton.styleFrom(
            backgroundColor: c.primaryContainer, foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            elevation: 4,
          ),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Total (Sudah Siap)', style: AppText.bodySm.copyWith(color: AppColors.mint, fontSize: 10), maxLines: 1, overflow: TextOverflow.ellipsis),
                const Text('Rp 66.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), maxLines: 1),
              ]),
            ),
            const SizedBox(width: 8),
            Row(mainAxisSize: MainAxisSize.min, children: const [
              Text('Pesan Sekarang', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), maxLines: 1),
              SizedBox(width: 6),
              Icon(Icons.arrow_forward, size: 18),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final c = context.palette;
    return Container(
      decoration: BoxDecoration(color: c.surface.withValues(alpha: 0.95), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16, offset: const Offset(0, -4))]),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Expanded(child: _navItem(context, Icons.restaurant, 'Home', false, () => Navigator.popUntil(context, (r) => r.isFirst))),
              Expanded(child: _navItem(context, Icons.local_mall, 'Keranjang', true, () => _snack(context, 'Anda sudah di Keranjang'), badge: '3')),
              Expanded(child: _navItem(context, Icons.receipt_long, 'Riwayat', false, () => _snack(context, 'Riwayat pesanan belum tersedia'))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String label, bool active, VoidCallback onTap, {String? badge}) {
    final c = context.palette;
    return Semantics(
      label: label,
      button: true,
      selected: active,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Stack(clipBehavior: Clip.none, children: [
              Icon(icon, size: 24, color: active ? c.primaryContainer : c.onVariant),
              if (badge != null)
                Positioned(
                  right: -6, top: -4,
                  child: Container(
                    width: 16, height: 16, alignment: Alignment.center,
                    decoration: BoxDecoration(color: c.primaryContainer, shape: BoxShape.circle),
                    child: Text(badge, style: AppText.labelSm.copyWith(fontSize: 10, color: Colors.white)),
                  ),
                ),
            ]),
            const SizedBox(height: 4),
            Text(label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.labelSm.copyWith(color: active ? c.primaryContainer : c.onVariant, fontWeight: active ? FontWeight.bold : FontWeight.w400)),
          ]),
        ),
      ),
    );
  }
}