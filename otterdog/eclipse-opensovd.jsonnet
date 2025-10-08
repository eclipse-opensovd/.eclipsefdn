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
      description: "🚗 ODX to MDD Converter 🚀",
      homepage: "",
      topics+: [
        "automotive",
        "odx",
        "sovd"
      ],
      variables: [
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-opensovd_odx-converter",
        },
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-opensovd",
        },
      ],
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.opensovd/sonarcloud.io/token-odx-converter",
        },
      ],
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
      homepage: "",
      code_scanning_default_setup_enabled: true,
      description: "🚗 Classic Diagnostic Adapter 🏥",
      variables: [
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-opensovd_classic-diagnostic-adapter",
        },
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-opensovd",
        },
      ],
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.opensovd/sonarcloud.io/token-classic-diagnostic-adapter",
        },
      ],
      rulesets: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
      topics+: [
        "automotive",
        "classic-diagnostic-adapter",
        "doip",
        "sovd",
        "uds"
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
      variables: [
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-opensovd_opensovd-core",
        },
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-opensovd",
        },
      ],
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.opensovd/sonarcloud.io/opensovd-core",
        },
      ],
      rulesets: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
    },
    orgs.newRepo('uds2sovd-proxy') {
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
      description: "Proxy component mapping UDS requests to SOVD ones",
      variables: [
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-opensovd_uds2sovd-proxy",
        },
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-opensovd",
        },
      ],
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.opensovd/sonarcloud.io/token-uds2sovd-proxy",
        },
      ],
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
