import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final c = context.palette;
    return Scaffold(
      backgroundColor: c.surface,
      appBar: AppBar(
        backgroundColor: c.surface.withValues(alpha: 0.85),
        elevation: 0,
        leading: Semantics(
          label: 'Kembali',
          button: true,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: c.onSurface),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Row(
          children: [
            const AppImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDH-AAIpYpwhHwwMI6-cYER5ee20GWE_Z2VM7eY3Tv3imR42BRclzmpHwds1QWCYq5apYqS0hVMZdxDY8iL-Ep2wBh42F1DFu3fMSnvumoBVQ8mClhBHb_RNbpXB2GkUF9bI5IwyqCXDAFqqwc83dFqhnrBXqTWBOvVfFma9K_yvFu8l9hFugFhnu0gj7O5J0xq25lIskyFqCSw_qmjgwA4txchwpGw72nBNAia7As',
              height: 28,
              fit: BoxFit.contain,
              semanticLabel: 'Logo Kantin Bu Sari',
            ),
            const SizedBox(width: 8),
            Expanded(child: Text('Profil Saya', style: AppText.headlineSm.copyWith(color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(context),
          const SizedBox(height: 16),
          _buildStatsCard(context),
          const SizedBox(height: 16),
          _buildLoyaltyBanner(context),
          const SizedBox(height: 24),
          _buildSectionTitle(context, 'Akun Saya'),
          const SizedBox(height: 8),
          _buildAccountList(context),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Pengaturan'),
          const SizedBox(height: 8),
          _buildSettingsList(context),
          const SizedBox(height: 24),
          _buildLogoutButton(context),
          const SizedBox(height: 16),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final c = context.palette;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, color: c.surfaceContainerHigh),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: const AppImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDiC9DdRg10VpldNjdx-8CjtWzcOL3fP1e5to_UL2_mdDLJXPW0Zdsk89nZnZHPBzA3kLi1QLw-XdTJEVWD5SDQhM325izjWXVWW3PHdppyXQ-jNKU0XybqcEQYvyVeuWey7pmKIL-cSE_CY0yjWwpB-KJQbPBsZRxULCrLgVRi8xIEjDLSIICdakyrHVoPfb-kmLHRkNcoMWWFWgOltFFN4Sd2gYZDU6H6CIBe26Q',
                  width: 92, height: 92,
                  semanticLabel: 'Foto profil Budi Santoso',
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Semantics(
                label: 'Ubah foto profil',
                button: true,
                child: InkWell(
                  onTap: () => _snack(context, 'Fitur ubah foto segera hadir'),
                  customBorder: const CircleBorder(),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(color: c.primaryContainer, shape: BoxShape.circle),
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text('Budi Santoso', style: AppText.headlineMd.copyWith(color: c.onSurface)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: c.secondaryContainer.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, size: 15, color: c.tertiaryContainer),
              const SizedBox(width: 4),
              Text('Pelanggan Setia', style: AppText.labelMd.copyWith(color: c.onSurface)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text('+62 812-3456-7890 \u2022 budi.santoso@email.com', style: AppText.bodySm.copyWith(color: c.onVariant)),
      ],
    );
  }

  Widget _buildStatsCard(BuildContext context) {
    final c = context.palette;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.surfaceLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem(context, Icons.receipt_long, '12', 'Pesanan', c.primary, () => _snack(context, '12 Pesanan telah selesai')),
          _statItem(context, Icons.favorite, '2', 'Favorit', c.secondary, () => _snack(context, '2 Menu difavoritkan')),
          _statItem(context, Icons.grade, '1', 'Ulasan', c.tertiaryContainer, () => _snack(context, '1 Ulasan telah diberikan')),
        ],
      ),
    );
  }

  Widget _statItem(BuildContext context, IconData icon, String count, String label, Color color, VoidCallback onTap) {
    final c = context.palette;
    return Semantics(
      label: '$count $label',
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(color: c.surfaceContainer, shape: BoxShape.circle),
                child: Icon(icon, size: 18, color: color),
              ),
              const SizedBox(height: 6),
              Text(count, style: AppText.headlineSm.copyWith(color: c.onSurface)),
              Text(label, style: AppText.labelSm.copyWith(color: c.onVariant)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoyaltyBanner(BuildContext context) {
    final c = context.palette;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), shape: BoxShape.circle),
            child: Icon(Icons.eco, size: 20, color: c.primaryFixed),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kantin Poin: 350 Poin', style: AppText.labelLg.copyWith(color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text('Tukar dengan Es Teh Manis gratis!', style: AppText.bodySm.copyWith(color: AppColors.mint), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Semantics(
            button: true,
            child: InkWell(
              onTap: () => _snack(context, 'Poin berhasil ditukar dengan Es Teh Manis!'),
              borderRadius: BorderRadius.circular(999),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: c.surfaceLowest, borderRadius: BorderRadius.circular(999)),
                child: Text('Tukar', style: AppText.labelMd.copyWith(color: c.primary, fontWeight: FontWeight.bold), maxLines: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final c = context.palette;
    return Text(
      title.toUpperCase(),
      style: AppText.labelSm.copyWith(color: c.onVariant, letterSpacing: 1.2),
    );
  }

  Widget _buildAccountList(BuildContext context) {
    final c = context.palette;
    return Container(
      decoration: BoxDecoration(
        color: c.surfaceLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
      ),
      child: Column(
        children: [
          _accountRow(context, Icons.local_mall, c.primary, 'Riwayat Pesanan', 'Lihat daftar pesanan Anda sebelumnya', () => _snack(context, 'Riwayat pesanan dibuka')),
          _accountRow(context, Icons.location_on, c.secondary, 'Alamat Pengiriman', 'Kos Putri Melati No. 14', () => _snack(context, 'Alamat pengiriman diubah')),
          _accountRow(context, Icons.account_balance_wallet, c.primaryContainer, 'Metode Pembayaran', 'GoPay \u2022 Saldo Rp 145.000', () => _snack(context, 'Metode pembayaran dibuka')),
          _accountRow(context, Icons.rate_review, c.tertiaryContainer, 'Ulasan Saya', '1 masukan diberikan untuk Bu Sari', () => _snack(context, 'Ulasan dibuka'), showDivider: false),
        ],
      ),
    );
  }

  Widget _accountRow(BuildContext context, IconData icon, Color iconColor, String title, String subtitle, VoidCallback onTap, {bool showDivider = true}) {
    final c = context.palette;
    return Column(
      children: [
        Semantics(
          label: '$title, $subtitle',
          button: true,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: c.surfaceContainer, shape: BoxShape.circle),
                    child: Icon(icon, size: 20, color: iconColor),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppText.labelLg.copyWith(color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                        Text(subtitle, style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.chevron_right, size: 20, color: c.outline),
                ],
              ),
            ),
          ),
        ),
        if (showDivider) Divider(height: 1, thickness: 1, color: c.surfaceLow, indent: 64),
      ],
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    final c = context.palette;
    return Container(
      decoration: BoxDecoration(
        color: c.surfaceLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: c.surfaceContainer, shape: BoxShape.circle),
                  child: Icon(Icons.notifications, size: 20, color: c.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notifikasi', style: AppText.labelLg.copyWith(color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text('Status pesanan dan info promo', style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: (val) => _snack(context, 'Notifikasi: ${val ? "Aktif" : "Nonaktif"}'),
                  activeThumbColor: c.primaryContainer,
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: c.surfaceLow, indent: 64),
          _settingRow(context, Icons.language, 'Bahasa', 'Bahasa Indonesia', () => _snack(context, 'Pilihan bahasa dibuka')),
          Divider(height: 1, thickness: 1, color: c.surfaceLow, indent: 64),
          _settingRow(context, Icons.support_agent, 'Bantuan & FAQ', 'Pusat bantuan & kontak warung', () => _snack(context, 'Bantuan dibuka'), showDivider: false),
        ],
      ),
    );
  }

  Widget _settingRow(BuildContext context, IconData icon, String title, String trailing, VoidCallback onTap, {bool showDivider = true}) {
    final c = context.palette;
    return Column(
      children: [
        Semantics(
          label: '$title, $trailing',
          button: true,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: c.surfaceContainer, shape: BoxShape.circle),
                    child: Icon(icon, size: 20, color: c.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppText.labelLg.copyWith(color: c.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                        Text('Pilihan bahasa aplikasi', style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(child: Text(trailing, style: AppText.bodySm.copyWith(color: c.onVariant), maxLines: 1, overflow: TextOverflow.ellipsis)),
                  const SizedBox(width: 4),
                  Icon(Icons.chevron_right, size: 20, color: c.outline),
                ],
              ),
            ),
          ),
        ),
        if (showDivider) Divider(height: 1, thickness: 1, color: c.surfaceLow, indent: 64),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final c = context.palette;
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () => _snack(context, 'Keluar dari akun berhasil'),
        icon: const Icon(Icons.logout, size: 18),
        label: const Text('Keluar dari Akun'),
        style: ElevatedButton.styleFrom(
          backgroundColor: c.errorContainer,
          foregroundColor: c.onErrorContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final c = context.palette;
    return Column(
      children: [
        Text('Kantin Bu Sari App v1.2.0', style: AppText.bodySm.copyWith(color: c.onVariant)),
        const SizedBox(height: 2),
        Text('Masakan Rumahan Rasa Restoran', style: AppText.labelSm.copyWith(color: c.onVariant)),
      ],
    );
  }
}
