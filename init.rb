Redmine::Plugin.register :unread_issues do
  project_module :issue_tracking do
    permission :view_issue_view_stats, issue_view_stats: [:view_stats]
  end
end

Rails.application.config.to_prepare do
  require 'unread_issues/hooks_views'

  unless Issue.included_modules.include?(UnreadIssues::IssuePatch)
    Issue.send(:include, UnreadIssues::IssuePatch)
  end
  unless User.included_modules.include?(UnreadIssues::UserPatch)
    User.send(:include, UnreadIssues::UserPatch)
  end
  unless IssuesController.included_modules.include?(UnreadIssues::IssuesControllerPatch)
    IssuesController.send(:include, UnreadIssues::IssuesControllerPatch)
  end
  unless IssueQuery.included_modules.include?(UnreadIssues::IssueQueryPatch)
    IssueQuery.send(:include, UnreadIssues::IssueQueryPatch)
  end
  unless QueriesController.included_modules.include?(UnreadIssues::QueriesControllerPatch)
    QueriesController.send(:include, UnreadIssues::QueriesControllerPatch)
  end
end

Rails.application.config.after_initialize do
  plugins = {}
  plugin = Redmine::Plugin.find(:unread_issues)
  plugins.each do |k,v|
    begin
      plugin.requires_redmine_plugin(k, v)
    rescue Redmine::PluginNotFound
      raise(Redmine::PluginNotFound, "Plugin requires #{k} not found")
    end
  end
end
