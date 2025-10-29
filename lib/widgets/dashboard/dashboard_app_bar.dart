import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/theme.dart';

class DashboardAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: successColor, borderRadius: BorderRadius.circular(8)),
              child: const Center(
                  child: Text('OF',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14))),
            ),
            const SizedBox(width: 8),
            const Text('OperatFlow',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: primaryText)),
          ],
        ),
      ),
      title: Center(
        child: SizedBox(
          width: 400,
          height: 40,
          child: TextField(
            // TODO: Dodać obsługę skrótu Ctrl+K i logikę wyszukiwania globalnego
            decoration: InputDecoration(
                hintText: 'Szukaj projektów, dokumentów... (Ctrl+K)',
                prefixIcon:
                const Icon(Icons.search, size: 20, color: tertiaryText),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                filled: true,
                fillColor: baseBackground,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: borderColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: borderColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: infoColor, width: 1.5)),
                hintStyle: textTheme.bodySmall?.copyWith(color: tertiaryText)),
            style: textTheme.bodyMedium?.copyWith(fontSize: 13),
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          // TODO: Dynamicznie zmieniać ikonę/tekst statusu synchronizacji
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: baseBackground.withOpacity(0.8),
                borderRadius: BorderRadius.circular(6)),
            child: const Row(
              children: [
                Icon(Icons.cloud_done_outlined, size: 16, color: successColor),
                SizedBox(width: 4),
                Text('Online',
                    style: TextStyle(fontSize: 12, color: secondaryText)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        TextButton.icon(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              foregroundColor: secondaryText,
              textStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          onPressed: () {
            /* TODO: Logika wymuszenia synchronizacji */
          },
          icon: const Icon(Icons.sync, size: 16),
          label: const Text('Synchronizuj'),
        ),
        const SizedBox(width: 8),
        PopupMenuButton<String>(
          tooltip: "Menu użytkownika",
          offset: const Offset(0, 40),
          icon: CircleAvatar(
            // TODO: Zastąpić inicjałami zalogowanego użytkownika
              radius: 16,
              backgroundColor: infoColor,
              child: Text(
                'JK', // Placeholder
                style: textTheme.bodySmall
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          onSelected: (String result) {
            // TODO: Implementować nawigację do Profil/Ustawienia lub logikę wylogowania
            if (result == 'logout') {
              print('Wylogowano');
            } else if (result == 'profile') {
              print('Idź do profilu');
            } else if (result == 'settings') {
              print('Idź do ustawień');
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
                value: 'profile',
                child: ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text('Profil'))),
            const PopupMenuItem<String>(
                value: 'settings',
                child: ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text('Ustawienia'))),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
                value: 'logout',
                child: ListTile(
                    leading: Icon(Icons.logout, color: errorColor),
                    title: Text('Wyloguj się',
                        style: TextStyle(color: errorColor)))),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: borderColor)),
          elevation: 2,
        ),
        const SizedBox(width: 16),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(color: borderColor, height: 1.0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}