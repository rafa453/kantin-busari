import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 120),
          children: [
            _topMeta(context),
            _modeSwitch(),
            _cartItems(),
            _kitchenNote(),
            _moreItemsCard(),
            _paymentSummary(),
            _freshGuarantee(),
            _checkoutButton(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _topMeta(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Keranjang Pesanan', style: AppText.headlineMd),
              Row(children: [
                const Icon(Icons.storefront, size: 14, color: AppColors.primary),
                const SizedBox(width: 4),
                Text('Kantin Bu Sari \u2022 ', style: AppText.labelMd.copyWith(color: AppColors.onVariant)),
                Text('Meja 04', style: AppText.labelMd.copyWith(color: AppColors.secondary, fontWeight: FontWeight.bold)),
              ]),
            ]),
          ]),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(999)),
            child: Row(children: [
              Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
              const SizedBox(width: 6),
              Text('3 Menu Dipilih', style: AppText.labelSm.copyWith(color: AppColors.secondary)),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _modeSwitch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(999)),
        child: Row(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(color: AppColors.surfaceLowest, borderRadius: BorderRadius.circular(999), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4)]),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.table_restaurant, size: 16, color: AppColors.primary),
                const SizedBox(width: 6),
                Text('Makan di Tempat', style: AppText.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.shopping_bag, size: 16, color: AppColors.onVariant),
                const SizedBox(width: 6),
                Text('Bungkus Pulang', style: AppText.labelMd.copyWith(color: AppColors.onVariant)),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _cartItems() {
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
            decoration: BoxDecoration(color: AppColors.surfaceLowest, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)]),
            child: Column(children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(it['img']!, width: 72, height: 72, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(width: 72, height: 72, color: AppColors.surfaceContainer)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Expanded(child: Text(it['name']!, style: AppText.headlineSm.copyWith(fontSize: 14), overflow: TextOverflow.ellipsis)),
                      const Icon(Icons.close, size: 16, color: AppColors.onVariant),
                    ]),
                    const SizedBox(height: 2),
                    Text(it['sub']!, style: AppText.bodySm),
                    const SizedBox(height: 4),
                    Text(it['price']!, style: AppText.labelLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ]),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.surfaceLow, borderRadius: BorderRadius.circular(6)),
                  child: Row(children: [
                    const Icon(Icons.edit_note, size: 14, color: AppColors.tertiary),
                    const SizedBox(width: 4),
                    Text(it['note']!, style: AppText.bodySm.copyWith(fontStyle: FontStyle.italic)),
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(999)),
                  child: Row(children: [
                    _stepperBtn(Icons.remove, isAdd: false),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text(it['qty']!, style: AppText.labelMd.copyWith(fontWeight: FontWeight.bold))),
                    _stepperBtn(Icons.add, isAdd: true),
                  ]),
                ),
              ]),
            ]),
          );
        }).toList(),
      ),
    );
  }

  Widget _stepperBtn(IconData icon, {required bool isAdd}) {
    return Container(
      width: 24, height: 24,
      decoration: BoxDecoration(color: isAdd ? AppColors.primaryContainer : AppColors.surfaceLowest, shape: BoxShape.circle),
      child: Icon(icon, size: 14, color: isAdd ? Colors.white : AppColors.primary),
    );
  }

  Widget _kitchenNote() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.surfaceLowest, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              const Icon(Icons.edit, size: 16, color: AppColors.primary),
              const SizedBox(width: 6),
              Text('Catatan untuk Dapur Bu Sari', style: AppText.labelMd.copyWith(fontWeight: FontWeight.w600)),
            ]),
            Text('Opsional', style: AppText.bodySm),
          ]),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Contoh: Jangan terlalu pedas, kuah dipisah...',
              hintStyle: AppText.bodyMd,
              filled: true, fillColor: AppColors.surfaceLow,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _moreItemsCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.secondaryContainer.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Container(
            width: 36, height: 36,
            decoration: const BoxDecoration(color: AppColors.secondaryContainer, shape: BoxShape.circle),
            child: const Icon(Icons.add_circle, size: 20, color: AppColors.secondary),
          ),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Masih lapar?', style: AppText.labelMd.copyWith(fontWeight: FontWeight.bold)),
            Text('Cari gorengan atau sambal tambahan', style: AppText.bodySm),
          ])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: AppColors.surfaceLowest, borderRadius: BorderRadius.circular(999)),
            child: Text('+ Tambah', style: AppText.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }

  Widget _paymentSummary() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.surfaceLowest, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.receipt, size: 18, color: AppColors.secondary),
            const SizedBox(width: 6),
            const Text('Ringkasan Pembayaran', style: AppText.headlineSm),
          ]),
          const SizedBox(height: 12),
          _summaryRow('Subtotal pesanan (5 item)', 'Rp 64.000'),
          const SizedBox(height: 6),
          _summaryRow('Biaya kemasan & layanan', 'Rp 2.000'),
          const SizedBox(height: 6),
          _summaryRow('Promo Warung Hemat', '-Rp 0', isPromo: true),
          const Divider(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Total Pembayaran', style: AppText.headlineSm),
              Text('Termasuk pajak daerah 10%', style: AppText.bodySm),
            ]),
            Text('Rp 66.000', style: AppText.headlineLgMobile.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ]),
        ]),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isPromo = false}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: AppText.bodyMd),
      Text(value, style: AppText.bodyMd.copyWith(fontWeight: FontWeight.w600, color: isPromo ? AppColors.secondary : AppColors.onSurface)),
    ]);
  }

  Widget _freshGuarantee() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.verified, size: 14, color: AppColors.primary),
        const SizedBox(width: 6),
        Text('Masakan hangat langsung dari wajan Bu Sari', style: AppText.bodySm),
      ]),
    );
  }

  Widget _checkoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 52,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryContainer, foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            elevation: 4,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Total (Sudah Siap)', style: AppText.bodySm.copyWith(color: const Color(0xFFCBFFC2), fontSize: 10)),
              const Text('Rp 66.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ]),
            Row(children: const [
              Text('Pesan Sekarang', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 6),
              Icon(Icons.arrow_forward, size: 18),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface.withValues(alpha: 0.95), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16, offset: const Offset(0, -4))]),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _navItem(Icons.restaurant, 'Home', false, () => Navigator.popUntil(context, (r) => r.isFirst)),
            _navItem(Icons.local_mall, 'Keranjang', true, () {}, badge: '3'),
            _navItem(Icons.receipt_long, 'Riwayat', false, () {}),
          ]),
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(clipBehavior: Clip.none, children: [
            Icon(icon, size: 24, color: active ? AppColors.primaryContainer : AppColors.onVariant),
            if (badge != null)
              Positioned(
                right: -6, top: -4,
                child: Container(
                  width: 16, height: 16, alignment: Alignment.center,
                  decoration: const BoxDecoration(color: AppColors.primaryContainer, shape: BoxShape.circle),
                  child: Text(badge, style: AppText.labelSm.copyWith(fontSize: 10, color: Colors.white)),
                ),
              ),
          ]),
          const SizedBox(height: 4),
          Text(label, style: AppText.labelSm.copyWith(color: active ? AppColors.primaryContainer : AppColors.onVariant, fontWeight: active ? FontWeight.bold : FontWeight.w400)),
        ]),
      ),
    );
  }
}
