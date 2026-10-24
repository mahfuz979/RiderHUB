import 'package:flutter/material.dart';

import 'app_state.dart';
import 'strings.dart';

class HomeShell extends StatefulWidget {
  final AppState state;
  const HomeShell({super.key, required this.state});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final st = widget.state;
    final s = S(st.lang);
    final isCustomer = st.mode == AppMode.customer;

    final pages = <Widget>[
      isCustomer ? CustomerHome(s: s) : ProviderHome(s: s, state: st),
      BookingsPage(s: s),
      SettingsPage(state: st, s: s),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(s.t('appName')),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SegmentedButton<AppMode>(
              segments: [
                ButtonSegment(
                  value: AppMode.customer,
                  label: Text(s.t('customer')),
                  icon: const Icon(Icons.person),
                ),
                ButtonSegment(
                  value: AppMode.provider,
                  label: Text(s.t('provider')),
                  icon: const Icon(Icons.handyman),
                ),
              ],
              selected: {st.mode},
              onSelectionChanged: (v) => st.setMode(v.first),
            ),
          ),
        ),
      ),
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.home_outlined), label: s.t('home')),
          NavigationDestination(
              icon: const Icon(Icons.receipt_long_outlined),
              label: s.t('bookings')),
          NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              label: s.t('settings')),
        ],
      ),
    );
  }
}

class _Cat {
  final String key;
  final IconData icon;
  const _Cat(this.key, this.icon);
}

const List<_Cat> _cats = [
  _Cat('cat_ac', Icons.ac_unit),
  _Cat('cat_electrician', Icons.electrical_services),
  _Cat('cat_plumber', Icons.plumbing),
  _Cat('cat_cleaning', Icons.cleaning_services),
  _Cat('cat_carpenter', Icons.carpenter),
  _Cat('cat_painter', Icons.format_paint),
  _Cat('cat_appliance', Icons.build),
  _Cat('cat_pest', Icons.bug_report),
];

class CustomerHome extends StatefulWidget {
  final S s;
  const CustomerHome({super.key, required this.s});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final s = widget.s;
    final q = _query.trim().toLowerCase();
    final shown = _cats
        .where((c) => q.isEmpty || s.t(c.key).toLowerCase().contains(q))
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: s.t('searchHint'),
            border: const OutlineInputBorder(),
          ),
          onChanged: (v) => setState(() => _query = v),
        ),
        const SizedBox(height: 12),
        Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text('${s.t('demoNotice')}\n${s.t('availability')}'),
          ),
        ),
        const SizedBox(height: 16),
        Text(s.t('categories'),
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (shown.isEmpty)
          Padding(
            padding: const EdgeInsets.all(24),
            child: Center(child: Text(s.t('noResults'))),
          )
        else
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              for (final c in shown)
                Card(
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(s.t('comingSoon'))),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(c.icon, size: 36),
                        const SizedBox(height: 8),
                        Text(s.t(c.key), textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class ProviderHome extends StatelessWidget {
  final S s;
  final AppState state;
  const ProviderHome({super.key, required this.s, required this.state});

  @override
  Widget build(BuildContext context) {
    final approved = state.providerApproved;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: Icon(approved ? Icons.verified : Icons.lock_outline),
            title: Text(s.t('verification')),
            subtitle: Text(approved ? '' : s.t('notApproved')),
          ),
        ),
        const SizedBox(height: 12),
        if (!approved) Text(s.t('providerLocked')),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: approved ? () {} : null,
          child: Text(s.t('acceptJobs')),
        ),
      ],
    );
  }
}

class BookingsPage extends StatelessWidget {
  final S s;
  const BookingsPage({super.key, required this.s});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(s.t('bookingsEmpty')));
  }
}

class SettingsPage extends StatelessWidget {
  final AppState state;
  final S s;
  const SettingsPage({super.key, required this.state, required this.s});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(s.t('language'), style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        SegmentedButton<String>(
          segments: [
            ButtonSegment(value: 'en', label: Text(s.t('english'))),
            ButtonSegment(value: 'bn', label: Text(s.t('bangla'))),
          ],
          selected: {state.lang},
          onSelectionChanged: (v) => state.setLang(v.first),
        ),
        const SizedBox(height: 24),
        Text(s.t('version')),
      ],
    );
  }
}
