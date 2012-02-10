insert into goods (name,`desc`,user_id) select title,`desc`,user_id from prices ON DUPLICATE KEY UPDATE updated_at = NOW();
INSERT into price_goods (price_id,good_id,user_id) select goods.id,prices.id,prices.user_id from goods INNER JOIN prices on goods.name = prices.title ON DUPLICATE KEY UPDATE updated_at = NOW();
UPDATE price_goods set created_at = NOW() ,updated_at = NOW();
