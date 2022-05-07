# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'issues/:id/view_stats', controller: :issue_reads, action: :view_stats, id: /\d+/
