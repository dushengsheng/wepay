-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2020-12-01 22:38:39
-- 服务器版本： 5.6.49-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wepay_959`
--

-- --------------------------------------------------------

--
-- 表的结构 `cnf_balance_log`
--

CREATE TABLE IF NOT EXISTS `cnf_balance_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `fkey` varchar(16) DEFAULT NULL COMMENT '外键',
  `money` decimal(16,2) DEFAULT NULL,
  `ori_balance` decimal(16,2) DEFAULT '0.00',
  `new_balance` decimal(16,2) DEFAULT '0.00',
  `create_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_day` int(11) DEFAULT '0',
  `remark` varchar(128) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4224 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `cnf_bank`
--

CREATE TABLE IF NOT EXISTS `cnf_bank` (
  `id` int(11) NOT NULL,
  `bank_code` varchar(16) DEFAULT NULL COMMENT '简码',
  `bank_name` varchar(64) DEFAULT NULL COMMENT '银行名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '0或1',
  `sort` mediumint(9) DEFAULT '100' COMMENT '从小到大'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `cnf_bank`
--

INSERT INTO `cnf_bank` (`id`, `bank_code`, `bank_name`, `status`, `sort`) VALUES
(1, 'ICBC', '中国工商银行', 1, 100),
(2, 'ABC', '中国农业银行', 1, 100),
(3, 'BOC', '中国银行', 1, 100),
(4, 'CCB', '中国建设银行', 1, 100),
(5, 'BCOM', '交通银行', 1, 100),
(6, 'ECITIC', '中信银行', 1, 100),
(7, 'CEBB', '中国光大银行', 1, 100),
(8, 'HXB', '华夏银行', 1, 100),
(9, 'CMBC', '中国民生银行', 1, 100),
(10, 'CGB', '广发银行', 1, 100),
(11, 'SDB', '深圳发展银行', 1, 100),
(12, 'CMB', '招商银行', 1, 100),
(13, 'CIB', '兴业银行', 1, 100),
(14, 'SPDB', '上海浦东发展银行', 1, 100),
(15, 'HFBACNSD', '恒丰银行', 1, 100),
(16, 'CZB', '浙商银行', 1, 100),
(17, 'CBHB', '渤海银行', 1, 100),
(18, 'PSBC', '中国邮政储蓄银行', 1, 100),
(19, 'BBGB', '广西北部湾银行', 1, 100),
(20, 'BEA', '东亚银行', 1, 100),
(21, 'PAB', '平安银行', 1, 100);

-- --------------------------------------------------------

--
-- 表的结构 `cnf_banklog`
--

CREATE TABLE IF NOT EXISTS `cnf_banklog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `bank_id` mediumint(9) DEFAULT NULL,
  `bank_account` varchar(32) DEFAULT NULL COMMENT '银行账号',
  `bank_realname` varchar(16) DEFAULT NULL COMMENT '持卡人姓名',
  `bank_phone` varchar(20) DEFAULT '' COMMENT '手机号',
  `bank_idcard` varchar(20) DEFAULT '' COMMENT '身份证号',
  `branch_name` varchar(128) DEFAULT NULL COMMENT '支行名称',
  `create_time` int(11) DEFAULT NULL,
  `wx_account` varchar(32) DEFAULT NULL COMMENT '微信账号',
  `wx_qrcode` varchar(128) DEFAULT NULL COMMENT '微信收款码',
  `zfb_account` varchar(32) DEFAULT NULL COMMENT '支付宝账号',
  `zfb_qrcode` varchar(128) DEFAULT NULL COMMENT '支付宝收款码'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `cnf_cashlog`
--

CREATE TABLE IF NOT EXISTS `cnf_cashlog` (
  `id` int(11) NOT NULL,
  `csn` varchar(32) DEFAULT NULL COMMENT '单号',
  `uid` int(11) DEFAULT NULL,
  `money` decimal(16,2) DEFAULT NULL,
  `real_money` decimal(16,2) DEFAULT '0.00' COMMENT '实到',
  `fee` decimal(16,2) DEFAULT '0.00',
  `dpay_money` decimal(16,2) DEFAULT '0.00' COMMENT '已拨款金额',
  `fpay_money` decimal(16,2) DEFAULT '0.00' COMMENT '已完成拨款金额',
  `ori_balance` decimal(16,2) DEFAULT NULL,
  `new_balance` decimal(16,2) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_day` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '1待审核 2审核通过 3审核不通过 99已删除',
  `pay_status` tinyint(2) DEFAULT '1' COMMENT '1待支付 3已支付',
  `pay_time` int(11) DEFAULT '0',
  `blog_id` int(11) DEFAULT NULL COMMENT '绑定记录',
  `bank_idcard` varchar(32) DEFAULT NULL,
  `bank_phone` varchar(16) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL COMMENT '支行名字',
  `bank_account` varchar(32) DEFAULT NULL,
  `bank_realname` varchar(32) DEFAULT NULL,
  `par_msg` varchar(128) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `check_id` int(11) DEFAULT '0',
  `check_time` int(11) DEFAULT '0',
  `banklog` text
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `cnf_cashlog_bklog`
--

CREATE TABLE IF NOT EXISTS `cnf_cashlog_bklog` (
  `id` int(11) NOT NULL,
  `cash_id` int(11) DEFAULT NULL COMMENT '提现记录id',
  `aid` int(11) DEFAULT NULL COMMENT '代理id',
  `money` decimal(16,2) DEFAULT NULL COMMENT '拨款金额',
  `status` tinyint(2) DEFAULT '1' COMMENT '1=待处理,2=已提交,3=已通过,4=不通过',
  `create_time` int(11) DEFAULT '0',
  `submit_time` int(11) DEFAULT '0',
  `check_time` int(11) DEFAULT '0',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `banners` varchar(256) DEFAULT NULL COMMENT '凭证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `cnf_notice`
--

CREATE TABLE IF NOT EXISTS `cnf_notice` (
  `id` int(11) NOT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '1码商新订单',
  `fkey` varchar(128) DEFAULT NULL COMMENT '关键数据',
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '0待发 1发送失败 2发送成功',
  `send_time` int(11) DEFAULT '0',
  `send_msg` varchar(128) DEFAULT NULL COMMENT '发送返回消息',
  `remark` varchar(128) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1217 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `cnf_paylog`
--

CREATE TABLE IF NOT EXISTS `cnf_paylog` (
  `id` int(11) NOT NULL,
  `aid` int(11) DEFAULT '0' COMMENT '代理用户id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `money` decimal(16,2) DEFAULT '0.00' COMMENT '金额',
  `ori_balance` decimal(16,2) DEFAULT '0.00',
  `new_balance` decimal(16,2) DEFAULT '0.00',
  `order_sn` varchar(32) DEFAULT NULL COMMENT '订单号',
  `skbank_id` varchar(32) DEFAULT NULL,
  `pay_status` tinyint(2) DEFAULT '1' COMMENT '1待支付 2已提交 3已确认',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `tj_time` int(11) DEFAULT NULL COMMENT '提交截图时间',
  `check_time` int(11) DEFAULT '0',
  `check_id` int(11) DEFAULT '0',
  `check_remark` varchar(128) DEFAULT NULL,
  `pay_account` varchar(32) DEFAULT NULL,
  `pay_realname` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL COMMENT '用户提交备注',
  `banners` varchar(256) DEFAULT NULL COMMENT '凭证图片',
  `pay_order_sn` varchar(32) DEFAULT NULL COMMENT '外部单号',
  `pay_msg` varchar(255) DEFAULT NULL COMMENT '回调信息',
  `skbank` text
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `cnf_paytype`
--

CREATE TABLE IF NOT EXISTS `cnf_paytype` (
  `id` int(11) NOT NULL,
  `ptype` varchar(16) DEFAULT NULL COMMENT '支付方式',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `aname` varchar(32) DEFAULT NULL COMMENT '别称',
  `is_pass` tinyint(2) DEFAULT '0' COMMENT '是否需要通道',
  `is_open` tinyint(2) DEFAULT '0' COMMENT '是否开放',
  `is_qrcode` tinyint(2) DEFAULT '0' COMMENT '是否使用二维码支付',
  `is_default` tinyint(2) DEFAULT '0' COMMENT '默认勾选',
  `is_form` tinyint(2) DEFAULT '0' COMMENT '是否使用表单提交',
  `sort` mediumint(8) DEFAULT '100',
  `cover` varchar(128) DEFAULT NULL COMMENT '图标',
  `banner` varchar(128) DEFAULT NULL COMMENT '弹出图片',
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `cnf_pc`
--

CREATE TABLE IF NOT EXISTS `cnf_pc` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `cname` varchar(64) DEFAULT NULL,
  `ename` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `cnf_pc`
--

INSERT INTO `cnf_pc` (`id`, `pid`, `cname`, `ename`) VALUES
(11, 0, '北京市', 'Beijing'),
(12, 0, '天津市', 'Tianjin'),
(13, 0, '河北省', 'Hebei'),
(14, 0, '山西省', 'Shanxi'),
(15, 0, '内蒙古', 'Mogolia'),
(21, 0, '辽宁省', 'Liaoning'),
(22, 0, '吉林省', 'Jilin'),
(23, 0, '黑龙江省', 'Heilongjiang'),
(31, 0, '上海市', 'Shanghai'),
(32, 0, '江苏省', 'Jiangsu'),
(33, 0, '浙江省', 'Zhejiang'),
(34, 0, '安徽省', 'Anhui'),
(35, 0, '福建省', 'Fujian'),
(36, 0, '江西省', 'Jiangxi'),
(37, 0, '山东省', 'Shandong'),
(41, 0, '河南省', 'Henan'),
(42, 0, '湖北省', 'Hubei'),
(43, 0, '湖南省', 'Hunan'),
(44, 0, '广东省', 'Guangdong'),
(45, 0, '广西', 'Guangxi'),
(46, 0, '海南省', 'Hainan'),
(50, 0, '重庆市', 'Chongqing'),
(51, 0, '四川省', 'Sichuan'),
(52, 0, '贵州省', 'Guizhou'),
(53, 0, '云南省', 'Yunnan'),
(54, 0, '西藏', 'Tibet'),
(61, 0, '陕西省', 'Shanxi'),
(62, 0, '甘肃省', 'Gansu'),
(63, 0, '青海省', 'Qinghai'),
(64, 0, '宁夏', 'Ningxia'),
(65, 0, '新疆', 'Xinjiang'),
(1000, 11, '北京市', 'Beijing'),
(1100, 12, '天津市', 'Tianjin'),
(1210, 13, '石家庄市', 'Shijiazhuang'),
(1240, 13, '唐山市', 'Tangshan'),
(1260, 13, '秦皇岛市', 'Qinhuangdao'),
(1270, 13, '邯郸市', 'Handan'),
(1310, 13, '邢台市', 'Xingtai'),
(1340, 13, '保定市', 'Baoding'),
(1380, 13, '张家口市', 'Zhangjiakou'),
(1410, 13, '承德市', 'Chengde'),
(1430, 13, '沧州市', 'Cangzhou'),
(1460, 13, '廊坊市', 'Langfang'),
(1480, 13, '衡水市', 'Hengshui'),
(1610, 14, '太原市', 'Taiyuan'),
(1620, 14, '大同市', 'Datong'),
(1630, 14, '阳泉市', 'Yangquan'),
(1640, 14, '长治市', 'Changzhi'),
(1680, 14, '晋城市', 'Jingcheng'),
(1690, 14, '朔州市', 'Shuozhou'),
(1710, 14, '忻州市', 'Xinzhou'),
(1730, 14, '吕梁市', 'Lvliang'),
(1750, 14, '晋中市', 'Jingzhong'),
(1770, 14, '临汾市', 'Linfeng'),
(1810, 14, '运城市', 'Yuncheng'),
(1910, 15, '呼和浩特市', 'Hohhot'),
(1920, 15, '包头市', 'Baotou'),
(1930, 15, '乌海市', 'Wuhai'),
(1940, 15, '赤峰市', 'Chifeng'),
(1960, 15, '呼伦贝尔市', 'Hulunbeier'),
(1980, 15, '兴安盟', 'Hinggan'),
(1990, 15, '通辽市', 'Tongliao'),
(2010, 15, '锡林郭勒盟', 'Xilin'),
(2030, 15, '乌兰察布市', 'Ulanqab'),
(2050, 15, '鄂尔多斯市', 'Erdos'),
(2070, 15, '巴彦淖尔市', 'Bayan'),
(2080, 15, '阿拉善盟', 'Alxa'),
(2210, 21, '沈阳市', 'Shenyang'),
(2220, 21, '大连市', 'Dalian'),
(2230, 21, '鞍山市', 'Anshan'),
(2240, 21, '抚顺市', 'Fushun'),
(2250, 21, '本溪市', 'Benxi'),
(2260, 21, '丹东市', 'Dandong'),
(2270, 21, '锦州市', 'Jinzhou'),
(2276, 21, '葫芦岛市', 'Huludao'),
(2280, 21, '营口市', 'Yingkou'),
(2290, 21, '阜新市', 'Fuxin'),
(2310, 21, '辽阳市', 'Liaoyang'),
(2320, 21, '盘锦市', 'Panjing'),
(2330, 21, '铁岭市', 'Tieling'),
(2340, 21, '朝阳市', 'Chaoyang'),
(2410, 22, '长春市', 'Changchun'),
(2420, 22, '吉林市', 'Jilin'),
(2430, 22, '四平市', 'Siping'),
(2440, 22, '辽源市', 'Liaoyuan'),
(2450, 22, '通化市', 'Tonghua'),
(2460, 22, '白山市', 'Baishan'),
(2470, 22, '白城市', 'Baicheng'),
(2490, 22, '延边朝鲜族自治州', 'Yanbian'),
(2520, 22, '松原市', 'Songyuan'),
(2610, 23, '哈尔滨市', 'Harbin'),
(2640, 23, '齐齐哈尔市', 'Qiqihar'),
(2650, 23, '大庆市', 'Daqing'),
(2660, 23, '鸡西市', 'Jixi'),
(2670, 23, '鹤岗市', 'Hegang'),
(2680, 23, '双鸭山市', 'Shuangyashan'),
(2690, 23, '佳木斯市', 'Jiamusi'),
(2710, 23, '伊春市', 'Yichun'),
(2720, 23, '牡丹江市', 'Mudanjiang'),
(2740, 23, '七台河市', 'Qitaihe'),
(2760, 23, '绥化市', 'Suihua'),
(2780, 23, '黑河市', 'Heihe'),
(2790, 23, '大兴安岭地区', 'Daxinganling'),
(2900, 31, '上海市', 'Shanghai'),
(3010, 32, '南京市', 'Nanjing'),
(3020, 32, '无锡市', 'Wuxi'),
(3030, 32, '徐州市', 'Xuzhou'),
(3040, 32, '常州市', 'Changzhou'),
(3050, 32, '苏州市', 'Suzhou'),
(3060, 32, '南通市', 'Nantong'),
(3070, 32, '连云港市', 'Lianyungang'),
(3080, 32, '淮安市', 'Huai'),
(3090, 32, '宿迁市', 'Suqian'),
(3110, 32, '盐城市', 'Yancheng'),
(3120, 32, '扬州市', 'Yangzhou'),
(3128, 32, '泰州市', 'Taizhou'),
(3140, 32, '镇江市', 'Zhenjiang'),
(3310, 33, '杭州市', 'Hangzhou'),
(3320, 33, '宁波市', 'Ningbo'),
(3330, 33, '温州市', 'Wenzhou'),
(3350, 33, '嘉兴市', 'Jiaxing'),
(3360, 33, '湖州市', 'Huzhou'),
(3370, 33, '绍兴市', 'Shaoxing'),
(3380, 33, '金华市', 'Jinhua'),
(3410, 33, '衢州市', 'Quzhou'),
(3420, 33, '舟山市', 'Zhoushan'),
(3430, 33, '丽水市', 'Lishui'),
(3450, 33, '台州市', 'Taizhou'),
(3610, 34, '合肥市', 'Hefei'),
(3620, 34, '芜湖市', 'Wuhu'),
(3630, 34, '蚌埠市', 'Bengbu'),
(3640, 34, '淮南市', 'Huainan'),
(3650, 34, '马鞍山市', 'Ma’anshan'),
(3660, 34, '淮北市', 'Huaibei'),
(3670, 34, '铜陵市', 'Tongling'),
(3680, 34, '安庆市', 'Anqing'),
(3710, 34, '黄山市', 'Huangshan'),
(3720, 34, '阜阳市', 'Fuyang'),
(3722, 34, '亳州市', 'Bozhou'),
(3740, 34, '宿州市', 'Suzhou'),
(3750, 34, '滁州市', 'Chuzhou'),
(3760, 34, '六安市', 'Liu’an'),
(3771, 34, '宣城市', 'Xuancheng'),
(3781, 34, '巢湖市', 'Chaohu'),
(3790, 34, '池州市', 'Chizhou'),
(3910, 35, '福州市', 'Fuzhou'),
(3930, 35, '厦门市', 'Xiamen'),
(3940, 35, '莆田市', 'Putian'),
(3950, 35, '三明市', 'Sanming'),
(3970, 35, '泉州市', 'Quanzhou'),
(3990, 35, '漳州市', 'Zhangzhou'),
(4010, 35, '南平市', 'Nanping'),
(4030, 35, '宁德市', 'Ningde'),
(4050, 35, '龙岩市', 'Longyan'),
(4210, 36, '南昌市', 'Nanchang'),
(4220, 36, '景德镇市', 'Jingdezhen'),
(4230, 36, '萍乡市', 'Pingxiang'),
(4240, 36, '九江市', 'Jiujiang'),
(4260, 36, '新余市', 'Xinyu'),
(4270, 36, '鹰潭市', 'Yingtan'),
(4280, 36, '赣州市', 'Ganzhou'),
(4310, 36, '宜春市', 'Yichun'),
(4330, 36, '上饶市', 'Shangrao'),
(4350, 36, '吉安市', 'Ji’an'),
(4370, 36, '抚州市', 'Fuzhou'),
(4510, 37, '济南市', 'Jinan'),
(4520, 37, '青岛市', 'Qingdao'),
(4530, 37, '淄博市', 'Zibo'),
(4540, 37, '枣庄市', 'Zaozhuang'),
(4550, 37, '东营市', 'Dongying'),
(4560, 37, '烟台市', 'Yantai'),
(4580, 37, '潍坊市', 'Weifang'),
(4610, 37, '济宁市', 'Jining'),
(4630, 37, '泰安市', 'Tai’an'),
(4634, 37, '莱芜市', 'Laiwu'),
(4650, 37, '威海市', 'Weihai'),
(4660, 37, '滨州市', 'Binzhou'),
(4680, 37, '德州市', 'Dezhou'),
(4710, 37, '聊城市', 'Liaocheng'),
(4730, 37, '临沂市', 'Linyi'),
(4732, 37, '日照市', 'Rizhao'),
(4750, 37, '菏泽市', 'Heze'),
(4910, 41, '郑州市', 'Zhengzhou'),
(4920, 41, '开封市', 'Kaifeng'),
(4930, 41, '洛阳市', 'Luoyang'),
(4950, 41, '平顶山市', 'Pingdingshan'),
(4960, 41, '安阳市', 'Anyang'),
(4970, 41, '鹤壁市', 'Hebi'),
(4980, 41, '新乡市', 'Xinxiang'),
(5010, 41, '焦作市', 'Jiaozuo'),
(5020, 41, '濮阳市', 'Puyang'),
(5030, 41, '许昌市', 'Xuchang'),
(5040, 41, '漯河市', 'Luohe'),
(5050, 41, '三门峡市', 'Sanmenxia'),
(5060, 41, '商丘市', 'Shangqiu'),
(5080, 41, '周口市', 'Zhoukou'),
(5110, 41, '驻马店市', 'Zhumendian'),
(5130, 41, '南阳市', 'Nanyang'),
(5150, 41, '信阳市', 'Xinyang'),
(5210, 42, '武汉市', 'Wuhan'),
(5220, 42, '黄石市', 'Huangshi'),
(5230, 42, '十堰市', 'Shiyan'),
(5260, 42, '宜昌市', 'Yichang'),
(5280, 42, '襄樊市', 'Xiangfan'),
(5286, 42, '随州市', 'Suizhou'),
(5310, 42, '鄂州市', 'Ezhou'),
(5320, 42, '荆门市', 'Jinmen'),
(5330, 42, '黄冈市', 'Huanggang'),
(5350, 42, '孝感市', 'Xiaogan'),
(5360, 42, '咸宁市', 'Xianning'),
(5370, 42, '荆州市', 'Jinzhou'),
(5410, 42, '恩施州', 'Enshi'),
(5510, 43, '长沙市', 'Changsha'),
(5520, 43, '株州市', 'Zhuzhou'),
(5530, 43, '湘潭市', 'Xiangtan'),
(5540, 43, '衡阳市', 'Hengyang'),
(5550, 43, '邵阳市', 'Shaoyang'),
(5570, 43, '岳阳市', 'Yueyang'),
(5580, 43, '常德市', 'Changde'),
(5590, 43, '张家界市', 'Zhangjiajie'),
(5610, 43, '益阳市', 'Yiyang'),
(5620, 43, '娄底市', 'Loudi'),
(5630, 43, '郴州市', 'Chenzhou'),
(5650, 43, '永州市', 'Yongzhou'),
(5670, 43, '怀化市', 'Huaihua'),
(5690, 43, '吉首市', 'Jishou'),
(5810, 44, '广州市', 'Guangzhou'),
(5820, 44, '韶关市', 'Shaoguan'),
(5840, 44, '深圳市', 'Shenzhen'),
(5850, 44, '珠海市', 'Zhuhai'),
(5860, 44, '汕头市', 'Shantou'),
(5865, 44, '揭阳市', 'Jieyang'),
(5869, 44, '潮州市', 'Chaozhou'),
(5880, 44, '佛山市', 'Foshan'),
(5890, 44, '江门市', 'Jiangmen'),
(5910, 44, '湛江市', 'Zhanjiang'),
(5920, 44, '茂名市', 'Maoming'),
(5930, 44, '肇庆市', 'Zhaoqing'),
(5937, 44, '云浮市', 'Yunfu'),
(5950, 44, '惠州市', 'Huizhou'),
(5960, 44, '梅州市', 'Meizhou'),
(5970, 44, '汕尾市', 'Shanwei'),
(5980, 44, '河源市', 'Heyuan'),
(5990, 44, '阳江市', 'Yangjiang'),
(6010, 44, '清远市', 'Qingyuan'),
(6020, 44, '东莞市', 'Dongguan'),
(6030, 44, '中山市', 'Zhongshan'),
(6110, 45, '南宁市', 'Nanning'),
(6128, 45, '崇左市', 'Chongzuo'),
(6140, 45, '柳州市', 'Liuzhou'),
(6155, 45, '来宾市', 'Laibing'),
(6170, 45, '桂林市', 'Guilin'),
(6210, 45, '梧州市', 'Wuzhou'),
(6225, 45, '贺州市', 'Hezhou'),
(6230, 45, '北海市', 'Beihai'),
(6240, 45, '玉林市', 'Yulin'),
(6242, 45, '贵港市', 'Guigang'),
(6261, 45, '百色市', 'Baise'),
(6281, 45, '河池市', 'Hechi'),
(6311, 45, '钦州市', 'Qingzhou'),
(6330, 45, '防城港市', 'Fangchenggang'),
(6410, 46, '海口市', 'Haikou'),
(6420, 46, '三亚市', 'Sanya'),
(6510, 51, '成都市', 'Chengdu'),
(6530, 50, '重庆市', 'Chongqing'),
(6550, 51, '自贡市', 'Zigong'),
(6560, 51, '攀枝花市', 'Panzhihua'),
(6570, 51, '泸州市', 'Luzhou'),
(6580, 51, '德阳市', 'Deyang'),
(6590, 51, '绵阳市', 'Mianyang'),
(6610, 51, '广元市', 'Guangyuan'),
(6620, 51, '遂宁市', 'Suining'),
(6630, 51, '内江市', 'Neijiang'),
(6636, 51, '资阳市', 'Ziyang'),
(6650, 51, '乐山市', 'Leshan'),
(6652, 51, '眉山市', 'Meishan'),
(6670, 50, '万州区', 'Wanzhou'),
(6690, 50, '涪陵区', 'Fuling'),
(6710, 51, '宜宾市', 'Yibing'),
(6730, 51, '南充市', 'Nanchong'),
(6737, 51, '广安市', 'Guang’an'),
(6750, 51, '达州市', 'Dazhou'),
(6758, 51, '巴中市', 'Bazhong'),
(6770, 51, '雅安市', 'Ya’an'),
(6790, 51, '阿坝藏族羌族自治州', 'Aba'),
(6810, 51, '甘孜藏族自治州', 'Garze'),
(6840, 51, '凉山彝族自治州', 'Yi'),
(6870, 50, '黔江区', 'Qianjiang'),
(7010, 52, '贵阳市', 'Guiyang'),
(7020, 52, '六盘水市', 'Liupanshui'),
(7030, 52, '遵义市', 'Zunyi'),
(7050, 52, '铜仁地区', 'Tongren'),
(7070, 52, '黔西南州', 'Qianxinan'),
(7090, 52, '毕节地区', 'Bijie'),
(7110, 52, '安顺市', 'Anshun'),
(7130, 52, '黔东南州', 'Qiandongnan'),
(7150, 52, '黔南州', 'Qianan'),
(7310, 53, '昆明市', 'Kunming'),
(7340, 53, '昭通市', 'Zhaotong'),
(7360, 53, '曲靖市', 'Qujing'),
(7380, 53, '楚雄市', 'Chuxiong'),
(7410, 53, '玉溪市', 'Yuxi'),
(7430, 53, '红河哈尼族彝族自治州', 'Honghe'),
(7450, 53, '文山壮族苗族自治州', 'Wenshan'),
(7470, 53, '思茅市', 'Simao'),
(7490, 53, '西双版纳傣族自治州', 'Xishuangbanna'),
(7510, 53, '大理白族自治州', 'Dali'),
(7530, 53, '保山市', 'Baoshan'),
(7540, 53, '德宏傣族景颇族自治州', 'Dehong'),
(7550, 53, '丽江市', 'Lijiang'),
(7560, 53, '怒江傈僳族自治州', 'Nujiang'),
(7570, 53, '迪庆藏族自治州', 'Diqing'),
(7580, 53, '临沧市', 'Lincang'),
(7700, 54, '拉萨市', 'Lhasa'),
(7720, 54, '昌都地区', 'Changdu'),
(7740, 54, '山南地区', 'Shannan'),
(7760, 54, '日喀则地区', 'Shigatse'),
(7790, 54, '那曲地区', 'Naqu'),
(7811, 54, '阿里地区', 'Ali'),
(7830, 54, '林芝地区', 'Linzhi'),
(7910, 61, '西安市', 'Xi’an'),
(7920, 61, '铜川市', 'Tongchuan'),
(7930, 61, '宝鸡市', 'Baoji'),
(7950, 61, '咸阳市', 'Xianyang'),
(7970, 61, '渭南市', 'Weinan'),
(7990, 61, '汉中市', 'Hanzhong'),
(8010, 61, '安康市', 'Ankang'),
(8030, 61, '商洛市', 'Shangluo'),
(8040, 61, '延安市', 'Yan’an'),
(8060, 61, '榆林市', 'Yulin'),
(8210, 62, '兰州市', 'Lanzhou'),
(8220, 62, '嘉峪关市', 'Jiayuguan'),
(8230, 62, '金昌市', 'Jinchang'),
(8240, 62, '白银市', 'Baiyin'),
(8250, 62, '天水市', 'Tianshui'),
(8260, 62, '酒泉市', 'Jiuquan'),
(8270, 62, '张掖市', 'Zhangye'),
(8280, 62, '武威市', 'Wuwei'),
(8290, 62, '定西市', 'Dingxi'),
(8310, 62, '陇南市', 'Longnan'),
(8330, 62, '平凉市', 'Pingliang'),
(8340, 62, '庆阳市', 'Qingyang'),
(8360, 62, '临夏州', 'Linxia'),
(8380, 62, '甘南州', 'Gannan'),
(8510, 63, '西宁市', 'Xining'),
(8520, 63, '海东地区', 'Haidong'),
(8540, 63, '海北藏族自治州', 'Haibei'),
(8550, 63, '黄南藏族自治州', 'Huangnan'),
(8560, 63, '海南藏族自治州', 'Hainan'),
(8570, 63, '果洛藏族自治州', 'Guoluo'),
(8580, 63, '玉树藏族自治州', 'Yushu'),
(8590, 63, '海西蒙古族藏族自治州', 'Haixi'),
(8710, 64, '银川市', 'Yinchuan'),
(8720, 64, '石嘴山市', 'Shizuishan'),
(8731, 64, '吴忠市', 'Wuzhong'),
(8733, 64, '中卫市', 'Zhongwei'),
(8741, 64, '固原市', 'Guyuan'),
(8810, 65, '乌鲁木齐市', 'Urumqi'),
(8820, 65, '克拉玛依市', 'Karamay'),
(8830, 65, '吐鲁番市', 'Turpan'),
(8840, 65, '哈密市', 'Hami'),
(8844, 65, '阿勒泰地区', 'Altay'),
(8850, 65, '昌吉回族自治州', 'Hui'),
(8870, 65, '博尔塔拉蒙古自治州', 'Bortala'),
(8880, 65, '巴音郭楞蒙古自治州', 'Bayingolin'),
(8910, 65, '阿克苏地区', 'Akesu'),
(8930, 65, '克孜勒苏柯尔克孜自治州', 'Kizilsu'),
(8940, 65, '喀什地区', 'Kashi'),
(8960, 65, '和田地区', 'Hotan'),
(8980, 65, '伊犁哈萨克自治州', 'Kazak'),
(9010, 65, '塔城地区', 'Tacheng'),
(9020, 65, '阿勒泰地区', 'Altay'),
(9028, 65, '石河子市', 'Shihezi');

-- --------------------------------------------------------

--
-- 表的结构 `cnf_reward_log`
--

CREATE TABLE IF NOT EXISTS `cnf_reward_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `rate` varchar(8) DEFAULT NULL,
  `money` decimal(16,2) DEFAULT '0.00',
  `create_time` int(11) DEFAULT NULL,
  `create_day` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `shop_goods`
--

CREATE TABLE IF NOT EXISTS `shop_goods` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '1待上架 2已上架 9已删除',
  `price` int(11) DEFAULT NULL COMMENT '积分单价',
  `tnum` int(11) DEFAULT '0' COMMENT '总数量',
  `qnum` varchar(255) DEFAULT '0' COMMENT '已兑换数量',
  `create_time` int(255) DEFAULT NULL COMMENT '创建时间',
  `ginfo` text COMMENT '商品详情',
  `banners` varchar(255) DEFAULT NULL COMMENT '商品封面图片 数组',
  `sort` mediumint(255) DEFAULT '500' COMMENT '从大到小',
  `create_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `shop_goods_order`
--

CREATE TABLE IF NOT EXISTS `shop_goods_order` (
  `id` int(11) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `order_sn` varchar(32) DEFAULT NULL COMMENT '订单号',
  `g_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `g_num` mediumint(9) DEFAULT '1' COMMENT '兑换数量 默认1',
  `g_price` int(10) DEFAULT NULL COMMENT '兑换积分价格',
  `g_banners` varchar(255) DEFAULT NULL COMMENT '商品封面图',
  `create_time` int(11) DEFAULT NULL COMMENT '兑换时间',
  `deliver_time` int(11) DEFAULT '0' COMMENT '发货时间',
  `receive_id` int(11) DEFAULT NULL COMMENT '收货信息id',
  `realname` varchar(64) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `status` tinyint(2) DEFAULT '0' COMMENT '0待发货 1已发货 2已签收 9已删除',
  `express_sn` varchar(64) DEFAULT NULL COMMENT '快递单号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sk_agent_hklog`
--

CREATE TABLE IF NOT EXISTS `sk_agent_hklog` (
  `id` int(11) NOT NULL,
  `aid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT '0' COMMENT '订单表的id',
  `osn` varchar(32) DEFAULT NULL COMMENT '订单表单号',
  `need_recover` tinyint(2) DEFAULT '0' COMMENT '是否需要恢复接单余额',
  `money` decimal(16,2) DEFAULT '0.00' COMMENT '回款金额',
  `ori_balance` decimal(16,2) DEFAULT '0.00',
  `new_balance` decimal(16,2) DEFAULT '0.00',
  `order_sn` varchar(32) DEFAULT NULL,
  `skbank_id` int(11) DEFAULT '0',
  `status` tinyint(2) DEFAULT '1' COMMENT '回款状态 1=待审核,2=已提交,3=已通过,4=未通过',
  `banners` text,
  `cover` varchar(128) DEFAULT NULL COMMENT '回款凭证',
  `check_time` int(11) DEFAULT '0' COMMENT '审核时间',
  `check_id` int(11) DEFAULT '0' COMMENT '审核者',
  `create_time` int(11) DEFAULT NULL,
  `tj_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT '0',
  `pay_account` varchar(32) DEFAULT NULL,
  `pay_realname` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `skbank` text
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sk_bank`
--

CREATE TABLE IF NOT EXISTS `sk_bank` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT '0' COMMENT '所属用户id',
  `province_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `bank_id` int(11) DEFAULT NULL,
  `bank_account` varchar(32) DEFAULT NULL,
  `bank_realname` varchar(32) DEFAULT NULL,
  `branch_name` varchar(128) DEFAULT NULL COMMENT '开户支行',
  `max_tmoney` decimal(16,2) DEFAULT '0.00' COMMENT '最大收款额度',
  `now_tmoney` decimal(16,2) DEFAULT '0.00' COMMENT '当前已收款额度',
  `last_money` decimal(16,2) DEFAULT '0.00' COMMENT '最后收款额度',
  `status` tinyint(2) DEFAULT NULL COMMENT '1下线 2上线',
  `sort` mediumint(8) DEFAULT '100' COMMENT '排序值',
  `create_time` int(11) DEFAULT NULL,
  `cover` varchar(128) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sk_ma`
--

CREATE TABLE IF NOT EXISTS `sk_ma` (
  `id` int(11) NOT NULL,
  `ma` char(16) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '所属用户',
  `province_id` int(11) DEFAULT '0' COMMENT '所属省份',
  `city_id` int(11) DEFAULT '0' COMMENT '所属城市',
  `mtype_id` int(11) DEFAULT NULL COMMENT '类型id',
  `ma_account` varchar(32) DEFAULT NULL COMMENT '支付宝 微信 银行卡账号',
  `ma_realname` varchar(32) DEFAULT NULL COMMENT '姓名',
  `ma_qrcode` varchar(128) DEFAULT NULL COMMENT '收款码',
  `ma_zkmoney` float(32,0) DEFAULT NULL,
  `ma_zkling` varchar(255) DEFAULT NULL COMMENT '吱口令',
  `ma_zfbuid` varchar(32) DEFAULT NULL,
  `bank_id` int(11) DEFAULT '0' COMMENT '开户行',
  `branch_name` varchar(128) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '1下线 2上线 99删除',
  `apikey` varchar(64) DEFAULT NULL,
  `fz_time` int(11) DEFAULT '0',
  `mt_money` decimal(16,2) DEFAULT '0.00' COMMENT '最大总收款额度',
  `nt_money` decimal(16,2) DEFAULT '0.00' COMMENT '当前总收款额度',
  `min_money` decimal(16,2) DEFAULT '0.00',
  `max_money` decimal(16,2) DEFAULT '1000000.00',
  `queue_time` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sk_matchlog`
--

CREATE TABLE IF NOT EXISTS `sk_matchlog` (
  `id` int(11) NOT NULL,
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `ori_maid` int(11) DEFAULT NULL COMMENT '原码id',
  `new_maid` int(11) DEFAULT NULL,
  `create_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sk_ma_log`
--

CREATE TABLE IF NOT EXISTS `sk_ma_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `money` varchar(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sk_mtype`
--

CREATE TABLE IF NOT EXISTS `sk_mtype` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '1' COMMENT '类型 1基本 2二维码 3银行卡 4吱口令',
  `is_open` tinyint(2) DEFAULT '1',
  `sort` mediumint(8) DEFAULT '100',
  `min_money` decimal(16,2) DEFAULT '0.00',
  `max_money` decimal(16,2) DEFAULT '100000.00'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sk_mtype`
--

INSERT INTO `sk_mtype` (`id`, `name`, `type`, `is_open`, `sort`, `min_money`, `max_money`) VALUES
(1, '支付宝扫码', 2, 1, 100, '0.00', '100000.00'),
(2, '微信扫码', 2, 1, 100, '0.00', '100000.00'),
(3, '银行卡转账', 3, 1, 100, '0.00', '100000.00'),
(4, '微信转手机', 1, 1, 100, '0.00', '100000.00'),
(5, '微信银行卡', 3, 1, 100, '0.00', '100000.00'),
(6, '云闪付', 2, 1, 100, '0.00', '100000.00'),
(11, '吱口令', 4, 1, 100, '0.00', '100000.00'),
(12, '支付宝转账码', 5, 1, 100, '0.00', '100000.00');

-- --------------------------------------------------------

--
-- 表的结构 `sk_order`
--

CREATE TABLE IF NOT EXISTS `sk_order` (
  `id` int(10) unsigned NOT NULL,
  `order_sn` varchar(32) DEFAULT NULL,
  `out_order_sn` varchar(64) DEFAULT NULL COMMENT '商户订单号',
  `suid` int(11) DEFAULT NULL COMMENT '商户id',
  `ptype` tinyint(4) DEFAULT '0' COMMENT '支付类型',
  `muid` int(11) DEFAULT '0' COMMENT '码商id',
  `ma_id` int(11) DEFAULT '0' COMMENT '使用码',
  `ma_account` varchar(32) DEFAULT NULL,
  `ma_realname` varchar(32) DEFAULT NULL,
  `ma_qrcode` varchar(128) DEFAULT NULL,
  `ma_bank_id` int(11) DEFAULT '0',
  `ma_branch_name` varchar(128) DEFAULT NULL,
  `ma_zkmoney` float(32,0) DEFAULT NULL,
  `ma_zkling` varchar(255) DEFAULT NULL,
  `ma_zfbuid` varchar(32) DEFAULT NULL,
  `money` decimal(16,2) DEFAULT NULL COMMENT '金额',
  `real_money` decimal(16,2) DEFAULT NULL COMMENT '应结算',
  `rate` varchar(8) DEFAULT NULL COMMENT '费率',
  `fee` decimal(16,2) DEFAULT '0.00' COMMENT '手续费',
  `pay_status` tinyint(2) DEFAULT '1' COMMENT '1待支付 2已提交 3已超时 4已取消 9已支付',
  `over_time` int(11) DEFAULT '0' COMMENT '超时时间',
  `cancel_time` int(11) DEFAULT '0' COMMENT '取消时间',
  `submit_time` int(11) DEFAULT '0' COMMENT '提交支付时间',
  `pay_time` int(11) DEFAULT '0',
  `pay_day` int(11) DEFAULT '0',
  `check_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_day` int(11) DEFAULT '0',
  `notice_status` tinyint(2) DEFAULT NULL COMMENT '1待通知 2未回复 3回复失败 4回复成功',
  `notice_msg` varchar(256) DEFAULT NULL,
  `js_status` tinyint(2) DEFAULT '1' COMMENT '1待结算 2已结算',
  `js_time` int(11) DEFAULT '0' COMMENT '结算时间',
  `hk_money` decimal(16,2) DEFAULT '0.00' COMMENT '应回款金额',
  `hk_status` tinyint(2) DEFAULT '0' COMMENT '0待回款 1已提交 3通过 4未通过',
  `hk_time` int(11) DEFAULT '0',
  `goods_desc` varchar(128) DEFAULT NULL COMMENT '商品描述',
  `order_ip` varchar(16) DEFAULT NULL,
  `notify_url` varchar(255) DEFAULT NULL COMMENT '异步回调地址',
  `return_url` varchar(255) DEFAULT NULL COMMENT '暂时不需要同步回调',
  `reffer_url` varchar(255) DEFAULT NULL,
  `is_test` tinyint(2) DEFAULT '0',
  `is_rebate` tinyint(2) DEFAULT '0' COMMENT '是否已返佣 0/1/2',
  `is_create` tinyint(2) DEFAULT '0',
  `rebate_time` int(11) DEFAULT '0' COMMENT '返佣时间'
) ENGINE=InnoDB AUTO_INCREMENT=990 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sk_order_hkcsv`
--

CREATE TABLE IF NOT EXISTS `sk_order_hkcsv` (
  `id` int(11) NOT NULL,
  `csv` varchar(128) DEFAULT NULL,
  `is_load` tinyint(2) DEFAULT '0' COMMENT '是否已经导入',
  `load_time` int(11) DEFAULT '0',
  `create_gid` int(11) DEFAULT '0',
  `create_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sk_yong`
--

CREATE TABLE IF NOT EXISTS `sk_yong` (
  `id` int(11) NOT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '1码商 2商户',
  `uid` int(11) DEFAULT NULL COMMENT '所属用户id',
  `money` decimal(16,2) DEFAULT NULL,
  `level` varchar(8) DEFAULT NULL,
  `rate` varchar(8) DEFAULT NULL,
  `ori_balance` decimal(16,2) DEFAULT NULL,
  `new_balance` decimal(16,2) DEFAULT NULL,
  `fkey` varchar(16) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sys_access`
--

CREATE TABLE IF NOT EXISTS `sys_access` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT '0',
  `gid` int(11) DEFAULT '0',
  `node_ids` text
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sys_access`
--

INSERT INTO `sys_access` (`id`, `uid`, `gid`, `node_ids`) VALUES
(1, 0, 61, '101,102,103,104,105,106,141,257,267,268,271,284,304,209,254,256,260,262,272,276,278,279,282,283'),
(2, 0, 81, '101,102,103,257,267,304,209,254,260,262,272,276,278,279,282,283'),
(3, 1, 0, '10,11,12,13,14,15,152,16,17,18,19,2,20,3,4,5,9'),
(4, 1070, 0, '101,102,103,104,105,106,141,148,219,228,257,259,265,267,268,269,270,271,284'),
(5, 1071, 0, '1,10,11,12,13,14,15,152,16,17,18,19,2,20,3,4,5,9,101,102,103,104,105,106,141,148,219,228,257,259,265,267,268,269,270,271,284,201,202,203,234,236,237,238,240,247,209,210,242,249,254,256,260,261,262,263,264,280,281,285,286,287,213,214,215,217,232,243,244,245,246,272,273,274,275,276,277,278,279,282,283'),
(6, 1212, 0, '1,101,201,209,213,272'),
(7, 0, 41, '101,102,103,104,105,106,141,148,219,228,257,259,265,267,269,270,271,284,288,289,290,291,292,209,210,242,249,254,256,260,261,262,263,264,280,281,285,286,287,272,277,278,279,282,283'),
(8, 1570, 0, '101,102,103,104,105,106,141,257,265,267,268,269,270,271,284,289,209,254,256,260,261,262,264,280,281,294,295,296,298,272,276,278,279,283,293'),
(9, 0, 85, '101,103,104,269,270,288,289,305,306,209,249,254,256,260,261,262,263,264,280,281,298,272,273,274,275,278,279,282,283,293,299,301,302,303'),
(10, 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_config`
--

CREATE TABLE IF NOT EXISTS `sys_config` (
  `id` int(11) NOT NULL,
  `skey` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `single` tinyint(2) DEFAULT '0' COMMENT '0或1',
  `config` text,
  `update_time` int(11) DEFAULT NULL,
  `is_show` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sys_config`
--

INSERT INTO `sys_config` (`id`, `skey`, `name`, `single`, `config`, `update_time`, `is_show`) VALUES
(1, 'yes_or_no', '是/否', 0, '1=是,0=否', 1577754429, 1),
(2, 'rsa_pt_private', 'RSA平台私钥', 1, '-----BEGIN RSA PRIVATE KEY-----\nMIICXAIBAAKBgQCv+rxJ08U+BZJBvrlCMePgz5vbYjmUAFDAarDcaSaRIaHYjkAt\niTGWCDHlVuhZ+CjUGa+iB2Oo+srlcKP/ztOT9eM9e4VqySluwAfQZZvcenyZs/xe\n8iwa+xTDrVcYibDM5V0BR/Z+HoK9ftLjk3MIMMdHd0xENYXxxXYQtliAwQIDAQAB\nAoGAHDdLsVqvKX6jML9v3Nk6/HTNPKPHL5/NUszIhs6lTGfkF2DXkXWJ6dBuj6Mb\npjFP+pITwxsEM7fiiF9DLGTxL2gPPnRtpJka9g9dOkKsZnvnlD00Ehy2quu0g4+R\nOe7qIZuifG1nz7oS6nfC7mYIHtaroE+G7C354sTx2dMkiEECQQDXRfCq3OVLoCRx\nWi86ZY+THS/jk4Uv3KN6M4N8s0C3JyKuHoQXxfJg1CUvqHbU6Mg1Ib7YbrYe9yvB\nmZR88xtdAkEA0UW6phIIyRIIRv9AsjZeoddF1g3ZcpPio+DICF/JZX14kimJLVuX\nSqCMjNE0r/VsWhzWNgdFRXpjbLOvEZRItQJBAMqnNaOzpUunKwdmbbVcrGdCf7WO\nR0BCRcchPXOjz5VbiyM86P70QnLy4zrVLWDK7sZNyTo4JsxJxPBQ4t8pgKUCQC8t\n8Dl2gWKLXTBcZYKH/WexN75dWvOY4ZSenZo9thLaaa9SC+oc5wvdDDLHC4DL7MSY\nEbcWhoh2YinkjIiDDK0CQDHXOJcbniKUAMmCZWeRbqEWV1cK3uk7hfEzBgt2x4ZJ\nKHnpEhXfpIUWc5bEG9Wv0kyPZZoFVmI4+F3Xe2XWxxc=\n-----END RSA PRIVATE KEY-----', 1577690087, 1),
(3, 'rsa_pt_public', 'RSA平台公钥', 1, '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCv+rxJ08U+BZJBvrlCMePgz5vb\nYjmUAFDAarDcaSaRIaHYjkAtiTGWCDHlVuhZ+CjUGa+iB2Oo+srlcKP/ztOT9eM9\ne4VqySluwAfQZZvcenyZs/xe8iwa+xTDrVcYibDM5V0BR/Z+HoK9ftLjk3MIMMdH\nd0xENYXxxXYQtliAwQIDAQAB\n-----END PUBLIC KEY-----', 1577690803, 1),
(5, 'sys_version', '系统版本号', 1, 'v5.0.21', 1577691569, 1),
(6, 'cdn_domain', 'CDN加速域名', 1, 'www.abnma.com', 1599795761, 1),
(7, 'qr_domain', '二维码域名', 1, 'ms.kunbang.net', 1599762462, 1),
(8, 'sys_name', '项目名称', 1, '日月支付', 1599794797, 1),
(9, 'oauth_domain', '授权域名', 1, 'ms.kunbang.net', 1599762457, 1),
(10, 'user_sex', '用户性别', 0, '0=未知,1=男,2=女', 1520922045, 1),
(11, 'account_status', '账号状态', 0, '1=禁用,2=正常', 1520922154, 1),
(12, 'sys_group', '系统分组', 0, '1=超管,11=运营,31=财务,41=客服,61=商户代理,81=商户,85=码商代理,91=码商', 1575337998, 1),
(13, 'wx_gzh_config', '微信配置', 0, 'appid=appxxx,appsecret=xdedsxx', 1543115920, 1),
(14, 'sys_sms', '短信配置', 0, 'uid=QJG006116,pwd=YYp0990,tpl=尊敬的会员，您的验证码是{$code}。【阅付通】', 1577420274, 1),
(15, 'sys_switch', '开启关闭状态', 0, '1=开启,0=关闭', 1522048926, 1),
(16, 'domain_type', '域名类型', 0, '1=二维码域名,2=前端域名', 1541051155, 0),
(17, 'domain_status', '域名状态', 0, '0=未使用,1=使用中,2=已失效,4=已删除', 1541051544, 0),
(18, 'cnf_copyright', '网站备案信息', 1, 'Copyright © 2018 All rights reserved.   ICP备xx号', 1563349891, 1),
(29, 'sys_arc_status', '文章状态', 0, '1=待发布,2=已发布', 1560933669, 1),
(30, 'ad_reg_give_money', '注册赠送额度', 1, '0', 1544066527, 1),
(60, 'shop_goods_status', '商品上架状态', 0, '1=待上架,2=已上架', 1545128757, 1),
(61, 'shop_goods_log_status', '兑换商品发货状态', 0, '0=待发货,1=已发货,2=已签收', 1545185307, 1),
(114, 'cnf_pay_status', '商户订单支付状态', 0, '1=待支付,2=已提交,3=已超时,4=已取消,9=已支付', 1564051231, 1),
(125, 'cnf_balance_type', '资金变动记录类型', 0, '50=后台充值余额,51=前台充值余额,52=充值冻结,53=充值接单余额,54=充值应回款,55=接单可提余额互转,3=商户订单结算,4=码商订单分成,5=商户订单分成,6=夜间接单奖励,8=注册赠送余额,11=提现支出,12=提现退还,13=接单冻结,14=扣除冻结,15=冻结退还,16=补单扣除,20=订单回款,21=订单累计应回款,22=码商应回款扣除,23=码商应回款退还,24=审核增加应回款,31=用户提现应回款拨付,32=审核提现应回款退还', 1576661658, 1),
(126, 'min_cash_money', '单笔最小提现金额', 1, '100', 1550835726, 1),
(127, 'max_cash_money', '单笔最大提现金额', 1, '50000', 1572335685, 1),
(128, 'max_day_cash_money', '单日累计最大提现金额', 1, '10000000', 1572235736, 1),
(129, 'user_cash_status', '提现审核状态', 0, '1=待审核,2=已通过,3=不通过', 1543719761, 1),
(136, 'cash_charge_money', '码商每笔提现手续费', 0, '1=0.00,2=2', 1572165022, 1),
(167, 'cnf_pay_min_money', '单笔充值最小金额', 1, '3000', 1574648943, 1),
(168, 'cnf_pay_max_money', '单笔充值最大金额', 1, '100000', 1564039649, 1),
(181, 'cash_cnf', '可提现时间设置', 0, 'weekend=1,day_time=00:00-23:59', 1572358396, 1),
(202, 'cnf_work_list', '工单分类', 0, '1=账户问题,2=下单问题,3=充值问题,4=提现问题,99=其他问题', 1575337953, 1),
(205, 'service_qq', '在线客服QQ', 1, '1833475753', 1577330675, 1),
(206, 'cnf_skma_status', '收款码状态', 0, '1=下线,2=在线', 1563434663, 1),
(207, 'cnf_notice_status', '订单通知状态', 0, '1=待通知,2=未回复,3=回复失败,4=回复成功', 1563430332, 1),
(208, 'min_match_money', '最小可匹配金额', 1, '1', 1576553246, 1),
(209, 'cnf_yong_type', '分成类型', 0, '1=码商分成,2=商户分成', 1563598132, 1),
(210, 'cnf_skbank_status', '收款银行卡状态', 0, '1=下线,2=在线', 1563600795, 1),
(211, 'cnf_paylog_status', '充值订单状态', 0, '1=待支付,2=已提交,3=已确认', 1571727893, 1),
(212, 'cnf_cashpay_status', '提现支付状态', 0, '1=待支付,2=已提交,3=已支付', 1563629681, 1),
(213, 'cnf_user_online', '用户在线抢单状态', 0, '0=下线,1=在线', 1563774603, 1),
(214, 'cnf_user_offline_time', '用户自动下线时间（秒）', 1, '300000', 1577173417, 1),
(215, 'skorder_over_time', '商户订单超时时间（秒）', 1, '600', 1575431683, 1),
(216, 'cash_shcharge_money', '商户每笔提现手续费', 0, '1=0,2=3', 1572335800, 1),
(217, 'cnf_download_appurl', 'APP下载地址', 1, 'http://www.baidu.com', 1575341250, 1),
(218, 'cnf_msmin_fyrate', '码商最小分成比例', 0, '1=0.00,2=0.00,3=0,4=0.00', 1564647477, 1),
(219, 'cnf_mscheck_needpwd', '码商确认收款是否需要二级密码', 1, '否', 1576553536, 1),
(220, 'cnf_default_tj', '基本统计配置', 0, '订单总数=5203,订单总额=5583061.2,总手续费=180860,成功订单数=3760,成功订单总额=3238175.38,成功手续费=84563,成功率=57%', 1570590158, 0),
(221, 'cnf_forbid_time', '用户禁用时间（分钟=显示）', 0, 'max=永久,30=半小时,60=1小时,360=6小时,1440=1天', 1571732028, 1),
(222, 'cnf_reward_rate', '夜间接单额外奖励费率', 1, '0', 1575439831, 1),
(223, 'cnf_overtime_mdnum', '连续N单超时自动下线收款码', 1, '300', 1577086081, 1),
(224, 'cnf_tgqrcode_time', '推广二维码有效时间（秒）', 1, '900', 1571972485, 1),
(225, 'skorder_over_time2', '已提交状态订单超时时间（秒）', 1, '18000', 1577207971, 1),
(226, 'cnf_regms_open', '开放前台码商注册（是/否）', 1, '是', 1576915902, 1),
(227, 'cnf_zfbh5_open', '支付宝扫码开启H5跳转（是/否）', 1, '是', 1575169791, 1),
(229, 'cnf_bklog_status', '提现拨款明细状态', 0, '1=待处理,2=已提交,3=已通过,4=不通过,7=已取消', 1576332612, 1),
(234, 'cnf_order_hkstatus', '订单回款状态', 0, '0=待回款,1=待审核,3=已通过,4=未通过', 1577152552, 1),
(235, 'cnf_agent_hkstatus', '码商回款记录状态', 0, '1=待审核,2=已提交,3=已通过,4=未通过', 1576411119, 1),
(236, 'cnf_msappoint_other', '指定代理或码商匹配不到码时匹配其他码商（是/否）', 1, '是', 1575425205, 1),
(241, 'cnf_du_open', '下级码商接单开关状态', 0, '0=关闭接单,1=开放接单', 1575337593, 1),
(242, 'cnf_skm_min_money', '收款码默认最小金额', 1, '0', 1577343604, 1),
(243, 'cnf_skm_max_money', '收款码默认最大金额', 1, '20000', 1577343624, 1),
(244, 'cnf_trans_qrcode', '转换通道二维码（是/否）', 1, '是', 1576374619, 1),
(245, 'cnf_test_page_random', '测试界面需要开启随机数（是/否）', 1, '是', 1577173735, 1),
(246, 'cnf_xyhk_model', '开启信用回款模式（是/否）', 1, '否', 1577435292, 0),
(247, 'cnf_zkling_mitem', '支口令待选金额', 0, '1=100,2=200,3=300,4=500,5=1000,6=2000,7=5000,8=10000', 1576413647, 0),
(248, 'cnf_mshk_signle', '开启码商单笔回款-信用模式（是/否）', 1, '否', 1578058348, 0),
(250, 'cnf_whkbjjd_num', '未回款不可继续接单数量-信用单笔回款模式', 1, '230', 1577435202, 0),
(251, 'cnf_whkbjjd_money', '未回款不可继续接单金额-信用单笔回款模式', 1, '150000', 1577260252, 0),
(252, 'cnf_whkljjd_money', '未回款不可继续接单金额-信用累计回款模式', 1, '150000', 1577755838, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_gzh`
--

CREATE TABLE IF NOT EXISTS `sys_gzh` (
  `id` mediumint(9) NOT NULL,
  `uid` int(11) DEFAULT '0' COMMENT '所属用户',
  `name` varchar(32) DEFAULT NULL COMMENT '公众号名称',
  `appid` varchar(32) DEFAULT NULL,
  `appsecret` varchar(64) DEFAULT NULL,
  `mch_id` varchar(16) DEFAULT NULL COMMENT '微信支付商户号',
  `pay_key` varchar(32) DEFAULT NULL COMMENT '微信支付密钥',
  `token` varchar(32) DEFAULT NULL COMMENT '开发者模式的token',
  `access_token_time` int(11) DEFAULT NULL COMMENT 'token的更新时间',
  `access_token` text,
  `jsapi_ticket_time` int(11) DEFAULT NULL COMMENT 'ticket更新时间',
  `jsapi_ticket` text,
  `status` tinyint(2) DEFAULT '1' COMMENT '0或1',
  `gh_id` varchar(32) DEFAULT NULL COMMENT '原始id',
  `biz` varchar(32) DEFAULT NULL COMMENT '公众号标识',
  `tpl_id` varchar(64) DEFAULT NULL COMMENT '模板消息模板id'
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信公众号信息';

-- --------------------------------------------------------

--
-- 表的结构 `sys_log`
--

CREATE TABLE IF NOT EXISTS `sys_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `opt_name` varchar(255) DEFAULT NULL COMMENT '操作名称',
  `sql_str` text,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sys_news`
--

CREATE TABLE IF NOT EXISTS `sys_news` (
  `id` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `publish_time` int(11) DEFAULT NULL COMMENT '发布时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '1待发布 2已发布 4已删除',
  `create_id` int(11) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL COMMENT '作者',
  `cover` varchar(128) DEFAULT NULL COMMENT '封面图',
  `ndesc` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sys_news_cat`
--

CREATE TABLE IF NOT EXISTS `sys_news_cat` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(64) DEFAULT NULL,
  `sort` mediumint(8) DEFAULT '100',
  `create_timie` int(255) DEFAULT NULL,
  `is_show` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sys_news_cat`
--

INSERT INTO `sys_news_cat` (`id`, `cat_name`, `sort`, `create_timie`, `is_show`) VALUES
(1, '基本文章', 100, 0, 0),
(2, '系统消息', 100, 0, 1),
(3, '通知公告', 100, 0, 1),
(5, '其他杂项', 100, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sys_node`
--

CREATE TABLE IF NOT EXISTS `sys_node` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT '0',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `nkey` varchar(32) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '0节点1菜单',
  `ico` varchar(255) DEFAULT NULL,
  `public` tinyint(2) DEFAULT '0' COMMENT '是否是公共节点',
  `sort` mediumint(8) DEFAULT '100',
  `pre_path` varchar(64) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sys_node`
--

INSERT INTO `sys_node` (`id`, `pid`, `name`, `nkey`, `type`, `ico`, `public`, `sort`, `pre_path`, `url`, `remark`, `create_time`) VALUES
(1, 0, '系统管理', 'Sys', 1, '&#xe620;', 0, 100, '0', '', '', 1520833033),
(2, 1, '基础配置', 'Sys_bset', 1, NULL, 0, 100, '0-1', '', NULL, NULL),
(3, 1, '节点管理', 'Sys_node', 1, '', 0, 100, '0-1', '', '', NULL),
(4, 1, '权限管理', 'Sys_oauth', 1, '', 0, 100, '0-1', '', '', 1520934268),
(5, 1, '操作日志', 'Sys_log', 1, '', 0, 100, '0-1', '', '', 1520923168),
(9, 1, '后台首页界面', 'Default_index', 0, '', 1, 100, '0-1', '', '', 1520926646),
(10, 1, '节点管理_查询', 'Sys_node_list', 0, '', 0, 100, '0-1', '', '', 1520946050),
(11, 1, '节点管理_更新', 'Sys_node_update', 0, '', 0, 100, '0-1', '', '', 1520946081),
(12, 1, '节点管理_删除', 'Sys_node_delete', 0, '', 0, 100, '0-1', '', '', 1520946102),
(13, 1, '基础配置_查询', 'Sys_bset_list', 0, '', 0, 100, '0-1', '', '', 1520946251),
(14, 1, '基础配置_更新', 'Sys_bset_update', 0, '', 0, 100, '0-1', '', '', 1520946287),
(15, 1, '基础配置_删除', 'Sys_bset_delete', 0, '', 0, 100, '0-1', '', '', 1520946305),
(16, 1, '操作日志_查询', 'Sys_log_list', 0, '', 0, 100, '0-1', '', '', 1520946351),
(17, 1, '权限管理_查询', 'Sys_oauth_list', 0, '', 0, 100, '0-1', '', '', 1520946377),
(18, 1, '权限管理_更新', 'Sys_oauth_update', 0, '', 0, 100, '0-1', '', '', 1520946397),
(19, 1, '基本资料', 'Sys_userinfo', 0, '', 1, 100, '0-1', '', '', 1521366451),
(20, 1, '安全设置', 'Sys_safety', 0, '', 1, 100, '0-1', '', '', 1521366538),
(101, 0, '用户管理', 'User', 1, '', 0, 1, '0', '', '', NULL),
(102, 101, '用户列表', 'User_user', 1, '', 0, 100, '0-101', '', '', NULL),
(103, 101, '用户列表_查询', 'User_user_list', 0, '', 0, 100, '0-101', '', '', NULL),
(104, 101, '用户列表_更新', 'User_user_update', 0, '', 0, 100, '0-101', '', '', NULL),
(105, 101, '用户列表_删除', 'User_user_delete', 0, '', 0, 0, '0-101', '', '', 1521540866),
(106, 101, '用户列表_踢下线', 'User_user_kick', 0, '', 0, 0, '0-101', '', '', 1521553274),
(152, 1, '域名管理', 'Sys_domain', 0, '', 0, 101, '0-1', '', '', 1541045953),
(209, 0, '支付管理', 'Pay', 1, '', 0, 3, '0', '', '', 1545102953),
(249, 209, '收款码列表', 'Pay_skma', 1, '', 0, 1, '0-209', '', '', 1557731939),
(254, 209, '订单明细', 'Pay_order', 1, '', 0, 5, '0-209', '', '', 1558341189),
(256, 209, '分成记录', 'Pay_yong', 1, '', 0, 6, '0-209', '', '', 1558348213),
(257, 101, '商户通道费率', 'User_apikey', 1, '', 0, 127, '0-101', '', '', 1558404675),
(260, 209, '订单明细_查询', 'Pay_order_list', 0, '', 0, 0, '0-209', '', '', 1563508684),
(261, 209, '订单明细_确认收款', 'Pay_order_check', 0, '', 0, 0, '0-209', '', '', 1563508980),
(262, 209, '订单明细_回调', 'Pay_order_notice', 0, '', 0, 0, '0-209', '', '', 1563509012),
(263, 209, '收款码列表_删除', 'Pay_skma_delete', 0, '', 0, 0, '0-209', '', '', 1563509418),
(264, 209, '分成记录_查询', 'Pay_yong_list', 0, '', 0, 0, '0-209', '', '', 1563509487),
(265, 101, '用户列表_充值', 'User_pay_balance', 0, '', 0, 0, '0-101', '', '', 1563509672),
(267, 101, '商户通道费率_查询', 'User_apikey_list', 0, '', 0, 0, '0-101', '', '', 1563509802),
(268, 101, '商户通道费率_生成密钥', 'User_apikey_update', 0, '', 0, 0, '0-101', '', '', 1563509827),
(269, 101, '码商分成比例', 'User_rate', 1, '', 0, 137, '0-101', '', '', 1563528767),
(270, 101, '码商分成比例_更新', 'User_rate_update', 0, '', 0, 0, '0-101', '', '', 1563529971),
(271, 101, '商户通道费率_设置', 'User_tdrate_update', 0, '', 0, 0, '0-101', '', '', 1563540892),
(272, 0, '资金管理', 'Finance', 1, '', 0, 4, '0', '', '', 1563601073),
(273, 272, '收款银行卡', 'Finance_bank', 1, '', 0, 0, '0-272', '', '', 1563604473),
(274, 272, '充值记录', 'Finance_paylog', 1, '', 0, 0, '0-272', '', '', 1563606608),
(275, 272, '充值记录_审核', 'Finance_paylog_check', 0, '', 0, 0, '0-272', '', '', 1563608010),
(276, 272, '商户提现记录', 'Finance_cashlog', 1, '', 0, 10, '0-272', '', '', 1563615208),
(277, 272, '提现记录_审核', 'Finance_cashlog_check', 0, '', 0, 0, '0-272', '', '', 1563630097),
(278, 272, '提现银行卡', 'Finance_banklog', 1, '', 0, 0, '0-272', '', '', 1563683730),
(279, 272, '账户余额', 'Finance_balance', 1, '', 0, 0, '0-272', '', '', 1563686683),
(280, 209, '订单明细_取消订单', 'Pay_order_cancel', 0, '', 0, 0, '0-209', '', '', 1564051755),
(281, 209, '订单明细_更改匹配', 'Pay_order_match', 0, '', 0, 0, '0-209', '', '', 1564129266),
(282, 272, '资金变动明细', 'Finance_balancelog', 1, '', 0, 200, '0-272', '', '', 1565140445),
(283, 272, '资金变动明细_查询', 'Finance_balancelog_list', 0, '', 0, 0, '0-272', '', '', 1565140465),
(284, 101, '商户通道费率_通道开关', 'User_tdswitch_update', 0, '', 0, 0, '0-101', '', '', 1566543880),
(285, 209, '收款码回收站', 'Pay_skmaTrash', 1, '', 0, 2, '0-209', '', '', 1569640519),
(287, 209, '收款码回收站_恢复', 'Pay_skmaTrash_recovery', 0, '', 0, 0, '0-209', '', '', 1569640683),
(288, 101, '码商分成比例_查询', 'User_rate_list', 0, '', 0, 0, '0-101', '', '', 1571208244),
(289, 101, '码商列表', 'User_userms', 1, '', 0, 2, '0-101', '', '', 1571728916),
(290, 101, '数据统计', 'User_datatj', 1, '', 0, 0, '0-101', '', '', 1571792481),
(291, 101, '上级查询', 'User_sjuser', 1, '', 0, 0, '0-101', '', '', 1571895113),
(292, 101, '上级查询_查询', 'User_sjuser_list', 0, '', 0, 0, '0-101', '', '', 1571895167),
(293, 272, '码商提现记录', 'Finance_cashlogMs', 1, '', 0, 0, '0-272', '', '', 1572411571),
(298, 209, '订单明细_补单', 'Pay_order_budan', 0, '', 0, 0, '0-209', '', '', 1574477063),
(299, 272, '提现拨款明细', 'Finance_bklog', 0, '', 0, 10, '0-272', '', '', 1574739687),
(300, 1, '数据清理', 'Sys_cdata', 1, '', 0, 200, '0-1', '', '', 1574745864),
(301, 272, '收款银行卡_更新', 'Finance_bank_update', 0, '', 0, 0, '0-272', '', '', 1574750447),
(302, 272, '码商回款记录', 'Finance_agenthk', 0, '', 0, 100, '0-272', '', '', 1574824558),
(303, 272, '码商回款记录_审核', 'Finance_agenthk_check', 0, '', 0, 0, '0-272', '', '', 1574824573),
(304, 101, 'API对接', 'User_rsaset', 1, '', 0, 1, '0-101', '', '', 1574856718),
(305, 101, '码商代理', 'User_agent', 1, '', 0, 2, '0-101', '', '', 1575337512),
(306, 101, '码商分成比例_通道开关', 'User_tdswitch2_update', 0, '', 0, 0, '0-101', '', '', 1575337535),
(307, 209, '通道管理', 'Pay_mtype', 1, '', 0, 0, '0-209', '', '', 1575553240),
(309, 209, '订单明细_创建订单', 'Pay_order_create', 0, '', 0, 0, '0-209', '', '', 1576841042),
(310, 272, '码商回款记录_批量导入', 'Finance_agenthk_csv', 0, '', 0, 0, '0-272', '', '', 1576906812),
(311, 209, '收款码列表_批量设置', 'Pay_skma_allupdate', 0, '', 0, 0, '0-209', '', '', 1577343444),
(312, 272, '提现记录_拨款', 'Finance_cashlog_bkcf', 0, '', 0, 0, '0-272', '', '', 1577363651),
(313, 1, '后台首页界面', 'Index_index', 0, '', 1, 100, '0-1', '', '', 1520926646);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `gid` mediumint(9) DEFAULT '0' COMMENT '用户分组',
  `openid` varchar(32) DEFAULT NULL,
  `unionid` varchar(32) DEFAULT NULL,
  `account` varchar(32) DEFAULT NULL COMMENT '账号',
  `phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `password2` varchar(64) DEFAULT NULL COMMENT '二级密码',
  `coin` int(11) DEFAULT '0' COMMENT '积分',
  `balance` decimal(16,2) DEFAULT '0.00' COMMENT '可用余额',
  `sx_balance` decimal(16,2) DEFAULT '0.00',
  `fz_balance` decimal(16,2) DEFAULT '0.00' COMMENT '冻结中余额',
  `kb_balance` decimal(16,2) DEFAULT '0.00' COMMENT '可拨款余额',
  `fy_rate` varchar(128) DEFAULT NULL COMMENT '码商分成比例json',
  `td_rate` varchar(128) DEFAULT NULL COMMENT '通道费率json',
  `td_switch` varchar(64) DEFAULT NULL COMMENT '通道开关',
  `apikey` varchar(64) DEFAULT NULL,
  `is_rsa` tinyint(2) DEFAULT '0' COMMENT '是否开启rsa',
  `rsa_public` text,
  `rsa_private` text,
  `apiauto` tinyint(2) DEFAULT '0' COMMENT '是否接收自动回调',
  `appoint_agent` varchar(255) DEFAULT NULL COMMENT '指定代理',
  `appoint_ms` varchar(255) DEFAULT NULL COMMENT '指定码商',
  `nickname` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '昵称',
  `realname` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '真实姓名',
  `icode` varchar(8) DEFAULT NULL COMMENT '邀请码',
  `status` tinyint(2) DEFAULT '2' COMMENT '1禁用2正常',
  `forbid_time_flag` varchar(8) DEFAULT '0',
  `forbid_time` bigint(16) DEFAULT '0',
  `forbid_msg` varchar(128) DEFAULT NULL,
  `du_open` tinyint(2) DEFAULT '1',
  `du_open_flag` varchar(32) DEFAULT NULL,
  `forbid_day` int(11) DEFAULT '0',
  `is_online` tinyint(2) DEFAULT '0' COMMENT '是否在线',
  `online_time` int(11) DEFAULT '0' COMMENT '最后在线时间',
  `queue_time` int(11) DEFAULT '0' COMMENT '排队时间',
  `is_google` tinyint(2) DEFAULT '0' COMMENT '是否开启验证',
  `google_secret` varchar(32) DEFAULT NULL,
  `google_hide` tinyint(2) DEFAULT '0' COMMENT '隐藏谷歌信息',
  `ma_min_money` decimal(16,2) DEFAULT '0.00' COMMENT '收款码最小额度',
  `ma_max_money` decimal(16,2) DEFAULT '5000.00' COMMENT '收款码最大额度',
  `latitude` varchar(32) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(32) DEFAULT NULL COMMENT '经度',
  `address` varchar(200) DEFAULT NULL,
  `sex` tinyint(2) DEFAULT '0' COMMENT '1男2女0未知',
  `country` varchar(32) DEFAULT NULL COMMENT '国家',
  `province` varchar(32) DEFAULT NULL COMMENT '省份',
  `city` varchar(32) DEFAULT NULL COMMENT '城市',
  `reg_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `reg_ip` varchar(16) DEFAULT NULL COMMENT '注册ip',
  `login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `headimgurl` text COMMENT '头像'
) ENGINE=InnoDB AUTO_INCREMENT=1653 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`id`, `pid`, `gid`, `openid`, `unionid`, `account`, `phone`, `password`, `password2`, `coin`, `balance`, `sx_balance`, `fz_balance`, `kb_balance`, `fy_rate`, `td_rate`, `td_switch`, `apikey`, `is_rsa`, `rsa_public`, `rsa_private`, `apiauto`, `appoint_agent`, `appoint_ms`, `nickname`, `realname`, `icode`, `status`, `forbid_time_flag`, `forbid_time`, `forbid_msg`, `du_open`, `du_open_flag`, `forbid_day`, `is_online`, `online_time`, `queue_time`, `is_google`, `google_secret`, `google_hide`, `ma_min_money`, `ma_max_money`, `latitude`, `longitude`, `address`, `sex`, `country`, `province`, `city`, `reg_time`, `reg_ip`, `login_time`, `login_ip`, `headimgurl`) VALUES
(1, 0, 1, 'admin', 'admin', 'admin', '19999999999', '6e3f29b68d897f225bf0bd5fafe5186cce26be88', '6e3f29b68d897f225bf0bd5fafe5186cce26be88', 0, '0.00', '0.00', '0.00', '0.00', '', '', '', '', 0, '', NULL, 0, '', '', '管理员', '管理员', 'eu7832', 2, 'max', 3199592276, '', 1, NULL, 0, 0, 1576339572, 1576339570, 0, 'YCZFQ2GORHTBIYA6', 0, '0.00', '0.00', '', '', '', 0, '', '', '', 0, '', 1606819281, '27.18.26.78', 'public/images/head.png'),
(1026, 1, 61, '15888888888', '15888888888', '15888888888', '15888888888', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', 0, '0.00', '0.00', '0.00', '0.00', '', '{"1":"0.0100","2":"0.0100","3":"0.0100","4":"0.0100","5":"0.0100","6":"0.0100","11":"0.0100","12":"0.0100"}', '{"1":1,"4":1,"2":1,"5":1,"3":1,"6":1,"12":1,"11":1}', '5e4dd1d0d168598b0ae6381285fbbdf1c79f33d8', 0, NULL, NULL, 0, '', '', 'shdl001', 'shdl001', '38iujh', 2, 'max', 3153445416, '', 1, NULL, 0, 0, 1576034592, 1576034589, 0, '', 0, '0.00', '0.00', '', '', '', 1, '韩国', '首尔', '', 1541428379, '', 1576916899, '', 'public/images/head.png'),
(1027, 1026, 81, '13122222222', '13122222222', '13122222222', '13122222222', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', 0, '116.45', '0.00', '0.00', '0.00', '', '{"1":"0.0100","2":"0.0100","3":"0.0100","4":"0.0100","5":"0.0100","6":"0.0100","11":"0.0100","12":"0.0100"}', '{"1":1,"4":1,"11":1,"12":1,"5":1,"2":1,"3":1,"6":1}', '858f5901c59c18ff7996f816badb51656fc52053', 0, '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDeAGm+JmWfvR8ukERbpuFjd7y5\ncF26cxoHNFrFJp9LOvB21ieZT4ThKcNCizQrt0JJqZowLaMf1Hv/SiomjYKXnYdA\n+5TxqhOWOxGNdyiRfEa27lgJ+/8VHcy8Jx05HhYfsFwzQtS17txuROB7aaOU6XwG\n7mt9a1HPTWq3ruVIdwIDAQAB\n-----END PUBLIC KEY-----', '-----BEGIN RSA PRIVATE KEY-----\nMIICWwIBAAKBgQDeAGm+JmWfvR8ukERbpuFjd7y5cF26cxoHNFrFJp9LOvB21ieZ\nT4ThKcNCizQrt0JJqZowLaMf1Hv/SiomjYKXnYdA+5TxqhOWOxGNdyiRfEa27lgJ\n+/8VHcy8Jx05HhYfsFwzQtS17txuROB7aaOU6XwG7mt9a1HPTWq3ruVIdwIDAQAB\nAoGASffBQ8XvXkXZOd5/qDn2JvoiO3chA5qONZBQHhg8QwikTjQUhZRlJdCQan+P\nJnGs+HY2FY9fJp/ZoLnJSYck11iacjeeIO6UmHwLmdzSlMRI6iVAoUT3TW7mvogF\nL2/T9AaEc9k+vz9oIUNj00hppzhEOk/gisp4ifVni1OTYMECQQDw1LL7P3cq7JFF\n5STQGgExOijsNlAt/ewCe4Vd8SmtMI4R2xia+H2g/v2L5p/JEdGWXoDBKfcYtqwn\nJd0d1Sa5AkEA6/wZlWi+9INF2lk31HIybC8if98m9Se6IJFBfgyxo5jxrZlSNNfa\nWSCKDS/Ngk+lMg+Q6h2eZDMSep2SE8ZQrwJAceBRhYY8Bhr4knFIl/JD8BANO6xu\n+2BfEclwhbw8Nb2I4B6WouivFsqb/2Qc2AnJ7e1funbqdVAjVRuNU8bvWQJAf1pF\n1EP7CanugK+1WYlnfMrTK38aXyNZZ0n8tjHTjB52DuG3Y5050O+mkQdDORgSZrnP\n0wi4+go15sYyl0lnMQJAK9mMSXGfP7+fBGHapmMkfQ4qzxsC37EzGjKCV/AZaKuh\n24jEtvUIhqCe8vYu+UzeCFbFydpSFS5YHDv53ycSAQ==\n-----END RSA PRIVATE KEY-----', 1, '', '', '测试商户', '测试商户', 'skolu8', 2, 'max', 3199525596, '', 1, NULL, 0, 0, 1576199315, 1576199293, 0, '63UZEHXA6LJKMBO4', 0, '0.00', '0.00', '', '', '', 2, '韩国', '首尔', '', 1532875901, '', 1606751404, '117.152.77.115', 'public/images/head.png'),
(1028, 1, 85, '13622222222', '13622222222', '13622222222', '13622222222', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', 0, '1.76', '0.00', '0.00', '0.00', '{"1":0.02,"2":0.02,"3":0.02,"4":0.02,"5":0.02,"6":0.02,"11":0.02,"12":0.02}', '', '{"6":1,"5":1,"1":1,"2":1,"3":1,"11":1,"4":1,"12":1}', '', 0, NULL, NULL, 0, '', '', 'msdl001', 'msdl001', '209jki', 2, 'max', 3211073916, '', 1, NULL, 0, 0, 1605536959, 0, 0, 'GWUZXINW65CL4EPF', 0, '0.00', '10000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1575338132, '', 1606739117, '117.152.77.115', 'public/images/head.png'),
(1602, 1028, 85, '18812341234', '18812341234', '18812341234', '18812341234', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', 0, '0.00', '0.00', '0.00', '0.00', '{"1":0.012,"2":0.012,"3":0.012,"4":0.012,"5":0.012,"6":0.012,"11":0.012,"12":0.012}', '', '{"6":1,"5":1,"1":1,"2":1,"3":1,"11":1,"4":1,"12":1}', 'ba5e3ce5dd06f0f8d511abaee39b4cdffa536e19', 0, NULL, NULL, 1, '', '', '测试码商', '测试码商', '287892', 2, 'max', 3211889450, '', 1, NULL, 0, 0, 1599760474, 1578468219, 0, '', 0, '0.00', '5000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1576551969, '', 1599793533, '39.128.24.217', 'public/images/head.png'),
(1648, 1028, 91, '18888888889', '18888888889', '18888888889', '18888888889', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', 0, '709314.00', '585858.00', '0.00', '0.00', '{"1":0.012,"2":0.012,"3":0.012,"4":0.012,"5":0.012,"6":0.012,"11":0.012,"12":0.012}', NULL, '{"1":1,"5":1,"2":1,"6":1,"3":1,"11":1,"4":1,"12":1}', 'a65fc5333d4b09d5e49abbf61afcc3a0983d8519', 0, NULL, NULL, 1, NULL, NULL, 'abnma.com搬码资源网', '改源码', '422110', 2, 'max', 3211074104, '', 1, NULL, 0, 0, 1606739723, 1606739401, 0, NULL, 0, '0.00', '5000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1599793963, '39.128.24.217', 1606738996, '117.152.77.115', 'public/images/head.png'),
(1649, 1602, 91, '13212798700', '13212798700', '13212798700', '13212798700', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', 0, '0.00', '9999999.99', '0.00', '0.00', '{"1":0.012,"2":0.012,"3":0.012,"4":0.012,"5":0.012,"6":0.012,"11":0.012,"12":0.012}', NULL, '{"1":1,"5":0,"2":1}', '2099a0c2447e2150d87764e1b41a7951c9855427', 0, NULL, NULL, 0, NULL, NULL, 'nk33ea3e', NULL, '371334', 2, '0', 0, NULL, 1, NULL, 0, 0, 1606137462, 1606135079, 0, 'TKWYYW6SXKPRY5OH', 0, '0.00', '5000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1605680848, '111.26.108.168', 1606133839, '111.26.108.166', 'public/images/head.png'),
(1650, 1648, 91, '13800000000', '13800000000', '13800000000', '13800000000', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', 0, '2.61', '165336.37', '0.00', '0.00', '{"1":0.012,"2":0.012,"3":0.012,"4":0.012,"5":0.012,"6":0.012,"11":0.012,"12":0.012}', NULL, '{"1":1,"5":1,"2":1,"6":1,"11":1,"3":1,"4":1,"12":1}', '18e6c65535ccfb184836d1f82712475b9d16fb6e', 0, NULL, NULL, 1, NULL, NULL, 'xuebi001', 'xuebi001', '633593', 2, 'max', 3211890404, '', 1, NULL, 0, 1, 1606820921, 1606820921, 0, 'CRDWMADZ2GBGM6U2', 0, '0.00', '5000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1605680902, '221.232.107.52', 1606826079, '117.152.77.115', 'public/images/head.png'),
(1652, 1, 1, 'dage', NULL, 'dage', '', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', '67cd38717099e67e25e2e3995d4ca87eeb05e6c4', 0, '0.00', '0.00', '0.00', '0.00', NULL, NULL, NULL, NULL, 1, 'test ras aaaaaaaaaaaaaaaaaaa', NULL, 0, NULL, NULL, '大哥', '大哥', '127618', 2, 'max', 3213479806, '', 1, NULL, 0, 0, 0, 0, 0, NULL, 0, '0.00', '5000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1606739903, '117.152.77.115', 1606830887, '117.152.77.115', 'public/images/head.png');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_token`
--

CREATE TABLE IF NOT EXISTS `sys_user_token` (
  `id` int(11) NOT NULL,
  `account` varchar(32) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `token` char(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(255) DEFAULT '0' COMMENT '0或1'
) ENGINE=InnoDB AUTO_INCREMENT=1095 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_wechat`
--

CREATE TABLE IF NOT EXISTS `sys_user_wechat` (
  `id` int(11) NOT NULL,
  `openid` varchar(32) DEFAULT NULL,
  `unionid` varchar(32) DEFAULT NULL,
  `nickname` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `subscribe` tinyint(2) DEFAULT '0',
  `subscribe_time` int(11) DEFAULT NULL,
  `subscribe_scene` varchar(32) DEFAULT NULL,
  `headimgurl` text,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sys_vcode`
--

CREATE TABLE IF NOT EXISTS `sys_vcode` (
  `id` int(11) NOT NULL,
  `stype` tinyint(4) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0',
  `verify_num` tinyint(4) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_day` int(11) DEFAULT '0',
  `verify_time` int(11) DEFAULT '0',
  `create_ip` varchar(16) DEFAULT NULL,
  `scon` varchar(256) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cnf_balance_log`
--
ALTER TABLE `cnf_balance_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `ut` (`uid`,`type`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `ct` (`create_time`) USING BTREE;

--
-- Indexes for table `cnf_bank`
--
ALTER TABLE `cnf_bank`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cnf_banklog`
--
ALTER TABLE `cnf_banklog`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- Indexes for table `cnf_cashlog`
--
ALTER TABLE `cnf_cashlog`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ud` (`uid`,`create_day`) USING BTREE;

--
-- Indexes for table `cnf_cashlog_bklog`
--
ALTER TABLE `cnf_cashlog_bklog`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cnf_notice`
--
ALTER TABLE `cnf_notice`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `cnf_paylog`
--
ALTER TABLE `cnf_paylog`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `odsn` (`order_sn`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- Indexes for table `cnf_paytype`
--
ALTER TABLE `cnf_paytype`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cnf_pc`
--
ALTER TABLE `cnf_pc`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE;

--
-- Indexes for table `cnf_reward_log`
--
ALTER TABLE `cnf_reward_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `shop_goods`
--
ALTER TABLE `shop_goods`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `shop_goods_order`
--
ALTER TABLE `shop_goods_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sk_agent_hklog`
--
ALTER TABLE `sk_agent_hklog`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sk_bank`
--
ALTER TABLE `sk_bank`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sk_ma`
--
ALTER TABLE `sk_ma`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ma` (`ma`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `mtype_id` (`mtype_id`) USING BTREE,
  ADD KEY `mts` (`mtype_id`,`status`) USING BTREE;

--
-- Indexes for table `sk_matchlog`
--
ALTER TABLE `sk_matchlog`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sk_ma_log`
--
ALTER TABLE `sk_ma_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sk_mtype`
--
ALTER TABLE `sk_mtype`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sk_order`
--
ALTER TABLE `sk_order`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  ADD KEY `ma_id` (`ma_id`) USING BTREE,
  ADD KEY `suid` (`suid`) USING BTREE,
  ADD KEY `out_order_sn` (`out_order_sn`) USING BTREE,
  ADD KEY `ma_day` (`ma_id`,`create_day`) USING BTREE,
  ADD KEY `pay_status` (`pay_status`) USING BTREE,
  ADD KEY `ptype` (`ptype`) USING BTREE,
  ADD KEY `muid` (`muid`) USING BTREE;

--
-- Indexes for table `sk_order_hkcsv`
--
ALTER TABLE `sk_order_hkcsv`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sk_yong`
--
ALTER TABLE `sk_yong`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `level` (`level`) USING BTREE;

--
-- Indexes for table `sys_access`
--
ALTER TABLE `sys_access`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sys_config`
--
ALTER TABLE `sys_config`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `skey` (`skey`) USING BTREE;

--
-- Indexes for table `sys_gzh`
--
ALTER TABLE `sys_gzh`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `appid` (`appid`) USING BTREE;

--
-- Indexes for table `sys_log`
--
ALTER TABLE `sys_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- Indexes for table `sys_news`
--
ALTER TABLE `sys_news`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `cid` (`cid`) USING BTREE;

--
-- Indexes for table `sys_news_cat`
--
ALTER TABLE `sys_news_cat`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sys_node`
--
ALTER TABLE `sys_node`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `nkey` (`nkey`) USING BTREE;

--
-- Indexes for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `openid` (`openid`) USING BTREE,
  ADD UNIQUE KEY `account` (`account`) USING BTREE,
  ADD UNIQUE KEY `icode` (`icode`) USING BTREE,
  ADD KEY `phone` (`phone`) USING BTREE,
  ADD KEY `unionid` (`unionid`) USING BTREE;

--
-- Indexes for table `sys_user_token`
--
ALTER TABLE `sys_user_token`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `token` (`token`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- Indexes for table `sys_user_wechat`
--
ALTER TABLE `sys_user_wechat`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `openid` (`openid`) USING BTREE,
  ADD KEY `unionid` (`unionid`) USING BTREE;

--
-- Indexes for table `sys_vcode`
--
ALTER TABLE `sys_vcode`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sp` (`stype`,`phone`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cnf_balance_log`
--
ALTER TABLE `cnf_balance_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4224;
--
-- AUTO_INCREMENT for table `cnf_bank`
--
ALTER TABLE `cnf_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `cnf_banklog`
--
ALTER TABLE `cnf_banklog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cnf_cashlog`
--
ALTER TABLE `cnf_cashlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cnf_cashlog_bklog`
--
ALTER TABLE `cnf_cashlog_bklog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cnf_notice`
--
ALTER TABLE `cnf_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1217;
--
-- AUTO_INCREMENT for table `cnf_paylog`
--
ALTER TABLE `cnf_paylog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `cnf_paytype`
--
ALTER TABLE `cnf_paytype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cnf_reward_log`
--
ALTER TABLE `cnf_reward_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_goods`
--
ALTER TABLE `shop_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_goods_order`
--
ALTER TABLE `shop_goods_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sk_agent_hklog`
--
ALTER TABLE `sk_agent_hklog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `sk_bank`
--
ALTER TABLE `sk_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sk_ma`
--
ALTER TABLE `sk_ma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `sk_matchlog`
--
ALTER TABLE `sk_matchlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sk_ma_log`
--
ALTER TABLE `sk_ma_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sk_mtype`
--
ALTER TABLE `sk_mtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sk_order`
--
ALTER TABLE `sk_order`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=990;
--
-- AUTO_INCREMENT for table `sk_order_hkcsv`
--
ALTER TABLE `sk_order_hkcsv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sk_yong`
--
ALTER TABLE `sk_yong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=601;
--
-- AUTO_INCREMENT for table `sys_access`
--
ALTER TABLE `sys_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sys_config`
--
ALTER TABLE `sys_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=255;
--
-- AUTO_INCREMENT for table `sys_gzh`
--
ALTER TABLE `sys_gzh`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sys_log`
--
ALTER TABLE `sys_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1011;
--
-- AUTO_INCREMENT for table `sys_news`
--
ALTER TABLE `sys_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sys_news_cat`
--
ALTER TABLE `sys_news_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sys_node`
--
ALTER TABLE `sys_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=314;
--
-- AUTO_INCREMENT for table `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1653;
--
-- AUTO_INCREMENT for table `sys_user_token`
--
ALTER TABLE `sys_user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1095;
--
-- AUTO_INCREMENT for table `sys_user_wechat`
--
ALTER TABLE `sys_user_wechat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_vcode`
--
ALTER TABLE `sys_vcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
