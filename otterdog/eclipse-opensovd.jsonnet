local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local default_review_rule = orgs.newPullRequest() {
  dismisses_stale_reviews: true,
  required_approving_review_count: 1,
  requires_code_owner_review: true,
};


orgs.newOrg('automotive.opensovd', 'eclipse-opensovd') {
  settings+: {
    description: "",
    name: "Eclipse OpenSOVD",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('website') {
      allow_merge_commit: false,
      allow_squash_merge: true,
      allow_rebase_merge: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "OpenSOVD website",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('.github') {
      allow_merge_commit: false,
      allow_rebase_merge: true,
      allow_squash_merge: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      has_discussions: false,
      has_issues: true,
      has_projects: false,
      has_wiki: false,
      description: "OpenSOVD org readme",
      rulesets+: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
    },
    orgs.newRepo('opensovd') {
      allow_merge_commit: false,
      allow_rebase_merge: true,
      allow_squash_merge: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      dependabot_alerts_enabled: true,
      dependabot_security_updates_enabled: true,
      has_discussions: true,
      has_issues: true,
      has_projects: true,
      has_wiki: true,
      code_scanning_default_setup_enabled: true,
      code_scanning_default_languages+: [
        "actions",
      ],
      description: "OpenSOVD main repository",
      rulesets+: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
    },
    orgs.newRepo('odx-converter') {
      allow_merge_commit: false,
      allow_rebase_merge: true,
      allow_squash_merge: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      dependabot_alerts_enabled: true,
      dependabot_security_updates_enabled: true,
      has_discussions: true,
      has_issues: true,
      has_projects: true,
      has_wiki: true,
      code_scanning_default_setup_enabled: true,
      description: "odx converter repository",
      rulesets: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
    },
    orgs.newRepo('classic-diagnostic-adapter') {
      allow_merge_commit: false,
      allow_rebase_merge: true,
      allow_squash_merge: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      dependabot_alerts_enabled: true,
      dependabot_security_updates_enabled: true,
      has_discussions: true,
      has_issues: true,
      has_projects: true,
      has_wiki: true,
      code_scanning_default_setup_enabled: true,
      description: "classic diagnostic adapter repository",
      rulesets: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
    },
    orgs.newRepo('opensovd-core') {
      allow_merge_commit: false,
      allow_rebase_merge: true,
      allow_squash_merge: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      dependabot_alerts_enabled: true,
      dependabot_security_updates_enabled: true,
      has_discussions: true,
      has_issues: true,
      has_projects: true,
      has_wiki: true,
      code_scanning_default_setup_enabled: true,
      description: "OpenSOVD core containing Server, Client and Gateway",
      rulesets: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
    },
  ],
}
