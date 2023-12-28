group = ['A', 'B', 'C', 'D', 'E', 'F']

# groupから2〜4人を選んで取り出す

elect = group.sample(rand(2..4))
p elect.sort
remain = group - elect
p remain.sort