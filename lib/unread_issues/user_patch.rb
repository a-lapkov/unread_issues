module UnreadIssues
  module UserPatch
    def self.included(base)
      base.class_eval do
        has_many :issue_reads, dependent: :delete_all
        has_many :assigned_issues, class_name: 'Issue' , foreign_key: 'assigned_to_id'
      end
    end
  end
end
