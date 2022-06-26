class IssueReadsController < ApplicationController

  def view_stats
    @issue = Issue.find(params[:id])
    @issue_reads = @issue.issue_reads
  end

end
