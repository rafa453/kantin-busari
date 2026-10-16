import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withValues(alpha: 0.85),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDH-AAIpYpwhHwwMI6-cYER5ee20GWE_Z2VM7eY3Tv3imR42BRclzmpHwds1QWCYq5apYqS0hVMZdxDY8iL-Ep2wBh42F1DFu3fMSnvumoBVQ8mClhBHb_RNbpXB2GkUF9bI5IwyqCXDAFqqwc83dFqhnrBXqTWBOvVfFma9K_yvFu8l9hFugFhnu0gj7O5J0xq25lIskyFqCSw_qmjgwA4txchwpGw72nBNAia7As',
              height: 28,
              errorBuilder: (_, __, ___) => const SizedBox(),
            ),
            const SizedBox(width: 8),
            const Text('Profil Saya', style: AppText.headlineSm),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 16),
          _buildStatsCard(),
          const SizedBox(height: 16),
          _buildLoyaltyBanner(),
          const SizedBox(height: 24),
          _buildSectionTitle('Akun Saya'),
          const SizedBox(height: 8),
          _buildAccountList(),
          const SizedBox(height: 20),
          _buildSectionTitle('Pengaturan'),
          const SizedBox(height: 8),
          _buildSettingsList(),
          const SizedBox(height: 24),
          _buildLogoutButton(),
          const SizedBox(height: 16),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.surfaceContainerHigh),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDiC9DdRg10VpldNjdx-8CjtWzcOL3fP1e5to_UL2_mdDLJXPW0Zdsk89nZnZHPBzA3kLi1QLw-XdTJEVWD5SDQhM325izjWXVWW3PHdppyXQ-jNKU0XybqcEQYvyVeuWey7pmKIL-cSE_CY0yjWwpB-KJQbPBsZRxULCrLgVRi8xIEjDLSIICdakyrHVoPfb-kmLHRkNcoMWWFWgOltFFN4Sd2gYZDU6H6CIBe26Q',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: AppColors.surfaceContainer),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(color: AppColors.primaryContainer, shape: BoxShape.circle),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text('Budi Santoso', style: AppText.headlineMd),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.secondaryContainer.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, size: 15, color: AppColors.tertiaryContainer),
              const SizedBox(width: 4),
              Text('Pelanggan Setia', style: AppText.labelMd.copyWith(color: AppColors.onSurface)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text('+62 812-3456-7890 \u2022 budi.santoso@email.com', style: AppText.bodySm),
      ],
    );
  }

  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem(Icons.receipt_long, '12', 'Pesanan', AppColors.primary),
          _statItem(Icons.favorite, '2', 'Favorit', AppColors.secondary),
          _statItem(Icons.grade, '1', 'Ulasan', AppColors.tertiaryContainer),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String count, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: AppColors.surfaceContainer, shape: BoxShape.circle),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(height: 6),
        Text(count, style: AppText.headlineSm),
        Text(label, style: AppText.labelSm.copyWith(color: AppColors.onVariant)),
      ],
    );
  }

  Widget _buildLoyaltyBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), shape: BoxShape.circle),
            child: const Icon(Icons.eco, size: 20, color: AppColors.primaryFixed),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kantin Poin: 350 Poin', style: AppText.labelLg.copyWith(color: Colors.white)),
                Text('Tukar dengan Es Teh Manis gratis!', style: AppText.bodySm.copyWith(color: const Color(0xFFCBFFC2))),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: AppColors.surfaceLowest, borderRadius: BorderRadius.circular(999)),
            child: Text('Tukar', style: AppText.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: AppText.labelSm.copyWith(color: AppColors.onVariant, letterSpacing: 1.2),
    );
  }

  Widget _buildAccountList() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
      ),
      child: Column(
        children: [
          _accountRow(Icons.local_mall, AppColors.primary, 'Riwayat Pesanan', 'Lihat daftar pesanan Anda sebelumnya'),
          _accountRow(Icons.location_on, AppColors.secondary, 'Alamat Pengiriman', 'Kos Putri Melati No. 14'),
          _accountRow(Icons.account_balance_wallet, AppColors.primaryContainer, 'Metode Pembayaran', 'GoPay \u2022 Saldo Rp 145.000'),
          _accountRow(Icons.rate_review, AppColors.tertiaryContainer, 'Ulasan Saya', '1 masukan diberikan untuk Bu Sari', showDivider: false),
        ],
      ),
    );
  }

  Widget _accountRow(IconData icon, Color iconColor, String title, String subtitle, {bool showDivider = true}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: AppColors.surfaceContainer, shape: BoxShape.circle),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppText.labelLg),
                    Text(subtitle, style: AppText.bodySm),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, size: 20, color: AppColors.outline),
            ],
          ),
        ),
        if (showDivider) Divider(height: 1, thickness: 1, color: AppColors.surfaceLow, indent: 64),
      ],
    );
  }

  Widget _buildSettingsList() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceLowest,
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
                  decoration: BoxDecoration(color: AppColors.surfaceContainer, shape: BoxShape.circle),
                  child: const Icon(Icons.notifications, size: 20, color: AppColors.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Notifikasi', style: AppText.labelLg),
                      Text('Status pesanan dan info promo', style: AppText.bodySm),
                    ],
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: (_) {},
                  activeThumbColor: AppColors.primaryContainer,
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: AppColors.surfaceLow, indent: 64),
          _settingRow(Icons.language, 'Bahasa', 'Bahasa Indonesia'),
          Divider(height: 1, thickness: 1, color: AppColors.surfaceLow, indent: 64),
          _settingRow(Icons.support_agent, 'Bantuan & FAQ', 'Pusat bantuan & kontak warung', showDivider: false),
        ],
      ),
    );
  }

  Widget _settingRow(IconData icon, String title, String trailing, {bool showDivider = true}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: AppColors.surfaceContainer, shape: BoxShape.circle),
            child: Icon(icon, size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.labelLg),
                Text('Pilihan bahasa aplikasi', style: AppText.bodySm),
              ],
            ),
          ),
          Text(trailing, style: AppText.bodySm),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 20, color: AppColors.outline),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout, size: 18),
        label: const Text('Keluar dari Akun'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.errorContainer,
          foregroundColor: AppColors.onErrorContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Text('Kantin Bu Sari App v1.2.0', style: AppText.bodySm.copyWith(color: AppColors.outline)),
        const SizedBox(height: 2),
        Text('Masakan Rumahan Rasa Restoran', style: AppText.labelSm.copyWith(color: AppColors.outlineVariant)),
      ],
    );
  }
}
