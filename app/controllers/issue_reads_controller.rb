class IssueReadsController < ApplicationController

  def view_stats
    if User.current.admin? || User.current.allowed_to?(:view_issue_view_stats, @issue.project)
      @issue = Issue.find(params[:id])
      @issue_reads = @issue.issue_reads
    else
      render_403
    end
  end

end
