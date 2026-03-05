import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Shared Expandable List Emails
// ─────────────────────────────────────────────────────────────────────────────

const List<(String, String)> expandableEmails = [
  (
    'Team standup notes',
    'Here are the key points from today\'s standup meeting. We discussed sprint progress, blockers, and upcoming deadlines for the Q3 release.\nSarah mentioned the API integration is 80% complete, while Dave is still investigating the memory leak in the navigation stack.\nWe need to finalize the PR reviews by EOD Thursday to stay on track for the staging deployment.\nPlease update your Jira tickets before the next sync on Monday morning.',
  ),
  (
    'Design review feedback',
    'Attached are the design review comments. Please update the card corner radius to 24dp for outer and 4dp for inner as per the M3 Expressive spec.\nThe current elevation shadows are too harsh on dark mode and need to be softened using the new design system tokens.\nSpecifically, check the contrast ratio on the disabled state of the dropdown chips to ensure WCAG AA compliance.\nWe also need to align the padding of the "more" badge with the primary action items for visual consistency.',
  ),
  (
    'Build pipeline fix',
    'The CI build failure has been resolved. The issue was a missing dependency in the pubspec.yaml that was accidentally stripped during the last merge.\nI have also optimized the Docker layer caching which should reduce our total build time by approximately 45 seconds per run.\nPlease perform a "flutter clean" and "flutter pub get" to ensure your local environment matches the remote build state.\nIf you encounter any further 403 errors during the fetching phase, please reach out to the DevOps channel immediately.',
  ),
  (
    'Lunch plan tomorrow',
    'Anyone up for trying that new ramen place on 5th? Thinking 12:30 PM works best to beat the rush from the neighboring offices.\nI checked the menu and they have several vegetarian and gluten-free options available for those with dietary restrictions.\nI can make a reservation for 6-8 people if we get a headcount by the end of today\'s afternoon break.\nOtherwise, we might end up waiting in line for 30 minutes, which would eat into our scheduled sprint planning session.',
  ),
  (
    'Quarterly planning',
    'The Q4 planning doc is ready for review. Key initiatives include the new dropdown component and expandable list widget for the mobile SDK.\nWe are prioritizing developer experience improvements, specifically around the documentation and auto-generated code examples.\nProduct management has signaled that we need to increase our velocity on the "Expressive" design implementation to meet the holiday deadline.\nPlease leave your comments and suggestions directly in the shared document by Friday at noon.',
  ),
  (
    'Release v2.1 checklist',
    'Final checklist before release: 1) Run full test suite across all supported platforms (iOS, Android, Web), 2) Update CHANGELOG with latest bug fixes.\n3) Bump version in pubspec.yaml and verify the build number, 4) Tag the release in Git and trigger the production deployment pipeline.\nWe also need to verify that the analytics event tracking is firing correctly for the new onboarding flow.\nOnce the smoke tests pass on production, we will send out the internal announcement to the stakeholders.',
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Helpers
// ─────────────────────────────────────────────────────────────────────────────

Widget buildSectionHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8, left: 4),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  );
}

SliverToBoxAdapter sliverHeader(BuildContext context, String title) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: buildSectionHeader(context, title),
    ),
  );
}
