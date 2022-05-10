module UnreadIssues
  module HooksViews
    class Hooks < Redmine::Hook::ViewListener
      render_on(:view_layouts_base_html_head, partial: 'hooks/unread_isues/add_css', layout: false)
      render_on(:view_issues_sidebar_queries_bottom, partial: 'hooks/unread_isues/issue_bottom_details', layout: false)
    end
  end
end