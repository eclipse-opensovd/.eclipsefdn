local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local default_review_rule = {
  dismisses_stale_reviews: true,
  required_approving_review_count: 1,
  requires_code_owner_review: true,
};


orgs.newOrg('automotive.opensovd', 'eclipse-opensovd') {
  settings+: {
    #discussion_source_repository: "eclipse-opensovd/opensovd",
    #has_discussions: true,
    description: "",
    name: "Eclipse OpenSOVD",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
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
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      rulesets: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
    },
    orgs.newRepo('module_template') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      description: "OpenSOVD module template repository",
      is_template: true,  // Enable template repository functionality
      rulesets: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: default_review_rule,
        },
      ],
    },
    orgs.newRepo('.github') {
      description: "Houses the organisation README",
      code_scanning_default_setup_enabled: true,
      code_scanning_default_languages+: [
        "actions",
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
    orgs.newRepo('mdd-converter') {
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
      template_repository: "eclipse-opensovd/module_template",
      code_scanning_default_setup_enabled: true,
      code_scanning_default_languages+: [
        "c-cpp",
      ],
      description: "mdd converter repository",
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
      template_repository: "eclipse-opensovd/module_template",
      code_scanning_default_setup_enabled: true,
      code_scanning_default_languages+: [
        "c-cpp",
      ],
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
  ],
}
