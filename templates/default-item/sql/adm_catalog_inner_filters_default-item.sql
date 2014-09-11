DROP TABLE IF EXISTS `adm_catalog_inner_filters_default-item`;

CREATE TABLE IF NOT EXISTS `adm_catalog_inner_filters_default-item` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `stringid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `query` text NOT NULL,
  `limit` int(5) unsigned DEFAULT NULL,
  `catids` varchar(255) DEFAULT NULL,
  `targetpage` varchar(255) DEFAULT NULL,
  `template` varchar(255) NOT NULL,
  `perpage` int(5) unsigned DEFAULT NULL,
  `maxpages` int(5) unsigned DEFAULT NULL,
  `groupid` int(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stringid` (`stringid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

INSERT INTO `adm_catalog_inner_filters_default-item` (`id`, `stringid`, `name`, `query`, `limit`, `catids`, `targetpage`, `template`, `perpage`, `maxpages`, `groupid`) VALUES
(1, 'Novyi-tovar-index', 'Новый товар на главной', 'true\r\norder by items.`id` DESC', 10, '0', '', 'filtr_list.html', 10, 1, 0),
(2, 'Novinki-in-page-Novinki', 'Новинки (на странице Новинки)', 'true \r\norder by id desc', 100, '0', '', 'filtr_list.html', 20, 100, 0),
(5, 'rasprodazha', 'Распродажа (на странице Распродажа)', '`oldprice` IS NOT NULL\r\norder by `price` ASC', 500, '0', '', 'filtr_list.html', 20, 15, 0),
(6, 'price', 'Фильтр по цене и производителю', 'true\r\nREMOVE_NOT_SET[ AND `items`.`price`>=param[price-from]]\r\nREMOVE_NOT_SET[ AND `items`.`price`<=param[price-to]]\r\nREMOVE_NOT_SET[ AND `items`.`vendor` IN (param[vendor])]', 10000, '', '', 'tovar_list.html', 20, 10, 0),
(8, 'pricedown', 'Сортировка по цене (по возрастанию)', 'true order by `price` ASC', 10000, '', '', 'tovar_list.html', 20, 15, 0),
(9, 'priceup', 'Сортировка по цене (по убыванию)', 'true order by `price` DESC', 225, '', 'catalog', 'tovar_list.html', 12, 15, 0),
(10, 'sort-name', 'Сортировка по названию', 'true order by `name` ASC', 500, '', 'catalog', 'tovar_list.html', 12, 15, 0),
(11, 'sort-sale', 'Сортировка по наличию скидки', '`oldprice` IS NOT NULL\norder by `price` ASC', 10000, '', 'catalog', 'tovar_list.html', 12, 15, 0),
(16, 'search', 'Поиск по каталогу', 'true\r\nREMOVE_NOT_SET[ AND `items`.`name` LIKE ''%param[search]%'']\r\nREMOVE_NOT_SET[ OR `items`.`advcampaign_name` LIKE ''%param[search]%'']\r\nREMOVE_NOT_SET[ OR `items`.`description` LIKE ''%param[search]%'']', 10000, '0', '', 'filtr_list.html', 20, 10, NULL),
(17, 'common', 'Общий фильтр каталога', 'true\r\nREMOVE_NOT_SET[ AND `items`.`price`>=param[pf]]\r\nREMOVE_NOT_SET[ AND `items`.`price`<=param[pt]]\r\nREMOVE_NOT_SET[ AND `items`.`vendor` IN (param[vn])]\r\nREMOVE_NOT_SET[ AND `items`.`advcampaign_name` IN (param[ac])]\r\norder by param[sort] param[order]', 1000, '', '', 'tovar_list.html', 16, 10, NULL);
