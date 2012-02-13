INSERT INTO goods (name,`desc`,user_id) SELECT title,`desc`,user_id FROM prices group by `title` ON DUPLICATE KEY UPDATE updated_at = NOW();
INSERT INTO price_goods (price_id,good_id,user_id) SELECT prices.id,goods.id,prices.user_id FROM goods INNER JOIN prices ON goods.name = prices.title ON DUPLICATE KEY UPDATE updated_at = NOW();
INSERT INTO prices (id,good_id) SELECT prices.id,goods.id FROM goods INNER JOIN prices ON goods.name = prices.title ON DUPLICATE KEY UPDATE good_id = goods.id;
UPDATE price_goods SET created_at = NOW() ,updated_at = NOW();
