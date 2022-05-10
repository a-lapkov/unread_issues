Redmine::Plugin.register :unread_issues do
  project_module :issue_tracking do
    permission :view_issue_view_stats, issue_view_stats: [:view_stats]
  end
end

require_dependency File.dirname(__FILE__) + '/lib/unread_issues/hooks_views'
require_dependency File.dirname(__FILE__) + '/lib/unread_issues/issue_patch'
require_dependency File.dirname(__FILE__) + '/lib/unread_issues/issue_query_patch'
require_dependency File.dirname(__FILE__) + '/lib/unread_issues/issues_controller_patch'
require_dependency File.dirname(__FILE__) + '/lib/unread_issues/queries_controller_patch'
require_dependency File.dirname(__FILE__) + '/lib/unread_issues/user_patch'

unless Issue.included_modules.include?(UnreadIssues::IssuePatch)
  Issue.send(:include, UnreadIssues::IssuePatch)
end
unless IssueQuery.included_modules.include?(UnreadIssues::IssueQueryPatch)
  IssueQuery.send(:include, UnreadIssues::IssueQueryPatch)
end  
unless IssuesController.included_modules.include?(UnreadIssues::IssuesControllerPatch)
  IssuesController.send(:include, UnreadIssues::IssuesControllerPatch)
end  
unless QueriesController.included_modules.include?(UnreadIssues::QueriesControllerPatch)
  QueriesController.send(:include, UnreadIssues::QueriesControllerPatch)
end  
unless User.included_modules.include?(UnreadIssues::UserPatch)
  User.send(:include, UnreadIssues::UserPatch)
end  
