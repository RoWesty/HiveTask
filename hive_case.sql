SELECT cs.company, cs.subscriptions_year, pe.age_group
FROM customers as cs INNER JOIN people as pe ON pe.indexs = cs.indexs INNER JOIN organizations as os ON os.indexs = cs.indexs
WHERE os.name = cs.company
ORDER BY cs.subscriptions_year