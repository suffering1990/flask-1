CREATE TABLE IF NOT EXISTS `artists` (
	`id`	INTEGER NOT NULL,
	`artistId`	VARCHAR ( 16 ) UNIQUE,
	`artistName`	VARCHAR ( 32 ),
	`artistViewUrl`	VARCHAR ( 256 ),
	PRIMARY KEY(`id`)
);
INSERT INTO `artists` (id,artistId,artistName,artistViewUrl) VALUES (1,'393078584','HNA Group Co.,Ltd.','https://itunes.apple.com/cn/developer/hna-group-co-ltd/id393078584?uo=4'),
 (2,'955684530','渤海国际信托股份有限公司','https://itunes.apple.com/cn/developer/%E6%B8%A4%E6%B5%B7%E5%9B%BD%E9%99%85%E4%BF%A1%E6%89%98%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/id955684530?uo=4'),
 (3,'1080256087','渤海人寿保险股份有限公司','https://itunes.apple.com/cn/developer/%E6%B8%A4%E6%B5%B7%E4%BA%BA%E5%AF%BF%E4%BF%9D%E9%99%A9%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/id1080256087?uo=4'),
 (4,'555257011','西部航空有限责任公司','https://itunes.apple.com/cn/developer/%E8%A5%BF%E9%83%A8%E8%88%AA%E7%A9%BA%E6%9C%89%E9%99%90%E8%B4%A3%E4%BB%BB%E5%85%AC%E5%8F%B8/id555257011?uo=4'),
 (5,'517198358','Gopay Information Technology Co.,Ltd.','https://itunes.apple.com/cn/developer/gopay-information-technology-co-ltd/id517198358?uo=4'),
 (6,'830285991','易生支付有限公司(Easy pay co., LTD)','https://itunes.apple.com/cn/developer/%E6%98%93%E7%94%9F%E6%94%AF%E4%BB%98%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8-easy-pay-co-ltd/id830285991?uo=4'),
 (7,'465617432','海南航空控股股份有限公司','https://itunes.apple.com/cn/developer/%E6%B5%B7%E5%8D%97%E8%88%AA%E7%A9%BA%E6%8E%A7%E8%82%A1%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/id465617432?uo=4'),
 (8,'1086528244','Fuzhou Airlines Co., Ltd.','https://itunes.apple.com/cn/developer/fuzhou-airlines-co-ltd/id1086528244?uo=4'),
 (9,'452663183','天津航空有限责任公司','https://itunes.apple.com/cn/developer/%E5%A4%A9%E6%B4%A5%E8%88%AA%E7%A9%BA%E6%9C%89%E9%99%90%E8%B4%A3%E4%BB%BB%E5%85%AC%E5%8F%B8/id452663183?uo=4'),
 (10,'1190196574','海南供销大集金服信息科技有限公司','https://itunes.apple.com/cn/developer/%E6%B5%B7%E5%8D%97%E4%BE%9B%E9%94%80%E5%A4%A7%E9%9B%86%E9%87%91%E6%9C%8D%E4%BF%A1%E6%81%AF%E7%A7%91%E6%8A%80%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/id1190196574?uo=4'),
 (11,'1042174599','深圳前海航空航运交易中心有限公司','https://itunes.apple.com/cn/developer/%E6%B7%B1%E5%9C%B3%E5%89%8D%E6%B5%B7%E8%88%AA%E7%A9%BA%E8%88%AA%E8%BF%90%E4%BA%A4%E6%98%93%E4%B8%AD%E5%BF%83%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/id1042174599?uo=4'),
 (12,'1059333659','海航通信有限公司','https://itunes.apple.com/cn/developer/%E6%B5%B7%E8%88%AA%E9%80%9A%E4%BF%A1%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/id1059333659?uo=4'),
 (13,'450759666','首都航空','https://itunes.apple.com/cn/developer/%E9%A6%96%E9%83%BD%E8%88%AA%E7%A9%BA/id450759666?uo=4'),
 (14,'1053793620','掌合天下(北京)信息技术有限公司','https://itunes.apple.com/cn/developer/%E6%8E%8C%E5%90%88%E5%A4%A9%E4%B8%8B-%E5%8C%97%E4%BA%AC-%E4%BF%A1%E6%81%AF%E6%8A%80%E6%9C%AF%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/id1053793620?uo=4');
CREATE TABLE IF NOT EXISTS `apps` (
	`id`	INTEGER NOT NULL,
	`trackId`	VARCHAR ( 16 ) UNIQUE,
	`description`	TEXT,
	`screenShotUrls`	VARCHAR ( 1024 ),
	`genres`	VARCHAR,
	`artworkUrl60`	VARCHAR ( 256 ),
	`artworkUrl100`	VARCHAR ( 256 ),
	`artworkUrl512`	VARCHAR ( 256 ),
	`trackViewUrl`	VARCHAR ( 256 ),
	`appType`	VARCHAR ( 16 ),
	`registerDate`	DATE,
	`artistId`	VARCHAR ( 16 ),
	FOREIGN KEY(`artistId`) REFERENCES `artists`(`artistId`),
	PRIMARY KEY(`id`)
);
INSERT INTO `apps` (id,trackId,description,screenShotUrls,genres,artworkUrl60,artworkUrl100,artworkUrl512,trackViewUrl,appType,registerDate,artistId) VALUES (1,'989680116','【世界500强海航集团旗下互联网金融平台】

重磅：「组团理财」功能重磅上线，抱团理财有福利，自己建团更精彩！

【聚宝匯介绍】
聚宝匯，全称聚宝互联科技（深圳）股份有限公司，世界500强海航集团旗下互联网金融平台，2014年5月在深圳注册成立。平台依托海航集团优质实体产业资源优势，结合金融全球化发展与信息技术创新，专注从事金融产品网络营销互联网金融创新业务，致力打造安全、专业、便捷的互联网金融平台。

【低门槛高收益】
活期理财首选聚宝金，0.01元即可投资，快捷灵活，理财从这里开始！
定期投资就投聚收益，多种期限，7~11%年化收益，30倍活期存款收益，3倍定期存款收益。

【投资安全保障】
自2014年成立至今，交易额已突破900亿，0拖欠、0坏帐、0逾期；
AAA级担保公司进驻聚宝匯，超强风控、保障财富；
金融级安全系统架构，同卡取现，无盗刷风险。

【更多贴心服务】
理财随时随地，充值、提现均免费，投资过程中不收取任何附加费用；
劲爆活动：丰富的有奖活动等着您，iPhone 7、免费机票、免费国内游，让你爽到嗨！

【联系我们】
1、客服热线：950718
2、微信公众号：haihangjubaohui

聚宝匯 - 见证财富的力量！','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/44/9f/4e/449f4e2b-b4f4-33cb-8d13-127f9d1f40ca/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/98/6d/05/986d0566-0dd8-8649-d54c-e3df808c3d1e/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/bf/1a/ab/bf1aabcb-e56f-edc9-00df-52a67f7aa48f/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple62/v4/05/62/39/056239f7-c074-8073-83f4-ea16e6e38531/source/392x696bb.jpg'']','[u''\u8d22\u52a1'', u''\u5546\u52a1'']','https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/70/3a/ca/703aca40-b33d-0d56-0cc8-44f5e6023448/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/70/3a/ca/703aca40-b33d-0d56-0cc8-44f5e6023448/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/70/3a/ca/703aca40-b33d-0d56-0cc8-44f5e6023448/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E8%81%9A%E5%AE%9D%E5%8C%AF-%E6%B5%B7%E8%88%AA%E9%9B%86%E5%9B%A2%E6%97%97%E4%B8%8B%E4%BA%92%E8%81%94%E7%BD%91%E9%87%91%E8%9E%8D%E5%B9%B3%E5%8F%B0/id989680116?mt=8&uo=4','ios','2018-07-24','393078584'),
 (2,'588257595','海航会（HNA CLUB）提供国内外优惠机票、高品质旅游度假产品、品牌酒店、在线租车的预订服务，为航旅用户提供便捷的会员服务。 
  
【特惠机票购买】 
海航会整合了海航集团旗下的海南航空、大新华航空、首都航空、天津航空、祥鹏航空、乌鲁木齐航空的机票直销业务，机票价格、退改签政策与官网同步一致，同时覆盖25家航空公司的机票销售，每天都有特惠、秒杀活动，让您享受到最低的机票价格和优质服务。 
【航班动态查询】 
通过海航会可以实时查询各航空公司航班的动态信息，并有航班号、扫描登机牌二维码、航段等多种查询方式。 
【品质会员服务】 
用户可以通过积分累计换取各种优惠，并拥有免费享受机场贵宾服务的机会，海航会还整合了金鹏俱乐部，其是海南航空、大新华航空、香港航空、天津航空、祥鹏航空共享的常旅客计划，通过海航会可以注册或绑定金鹏会员，享受金鹏会员服务，累积里程换取优惠。 
【精品旅游线路】 
海航会推出城市印象系列自由行产品，每款产品皆特价精品，同时精选凯撒旅游的旅游线路，以优惠价格提供给用户。 
【优惠星级酒店】 
海航会精选海航酒店集团旗下的星级酒店，并提供超低价格和礼遇服务。 
【品质租车服务】 
海航会联手优质在线租车服务商，提供品质代驾租车产品，并提供首日免租金的优惠活动。 
【特殊机票服务】 
员工机票、协议机票、海航WiFi方便海航集团员工与合作客户。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple69/v4/63/98/ed/6398edcf-4d22-4fc9-8602-9e24eb1e41bb/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple3/v4/45/24/ff/4524ffcf-9c10-4101-0f94-d2638d1974d9/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple3/v4/a7/a0/05/a7a0056d-bb57-e069-b376-ff04661ffba7/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple62/v4/c6/b6/09/c6b609ba-e57b-5724-d433-f4bf560ee6a8/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple6/v4/14/50/b0/1450b05a-c65e-e136-298a-2ed6f292c856/source/392x696bb.jpg'']','[u''\u65c5\u6e38'', u''\u5546\u52a1'']','https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/c5/2c/17/c52c1792-c2ae-b951-9099-c343c1df80fb/source/60x60bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/c5/2c/17/c52c1792-c2ae-b951-9099-c343c1df80fb/source/100x100bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/c5/2c/17/c52c1792-c2ae-b951-9099-c343c1df80fb/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B5%B7%E8%88%AA%E4%BC%9A-hna-club/id588257595?mt=8&uo=4','ios','2018-07-24','393078584'),
 (3,'1180565266','三人行学堂是海航集团推出的首款移动学习平台，主旨为打造海航集团面授培训、移动学习和网上学习三位一体的培训模式，使员工全方位、多渠道快速获得知识信息，扩大培训覆盖面，改善学习体验度，提升培训效果。
主要作用：
1.打造分享、共享的学习型组织；
2.快速传播集团管理文化及精神文化；
3.提升培训响应速度，提高覆盖范围，降低培训成本。
课程形式：
包括直播课堂、视频课程、图文课程、游戏课程、测评练习，学习的同时更能兼具实用、趣味。
平台功能：
涵盖了课程配送、在线培训班管理、在线考试、课程直播、微课制作平台、问卷等，平台支持线上线下相结合O2O混合教学模式，可以实现一键推送课程，智能学习管理，全面数据监控等功能。','[u''https://is1-ssl.mzstatic.com/image/thumb/Purple19/v4/64/01/11/6401110c-3835-4ba7-e690-2398191754c6/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple19/v4/18/33/c8/1833c854-1ef7-1d3b-3b04-f57f8624c5f3/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple71/v4/79/cf/ef/79cfef6d-fa31-d3b9-ec2d-b71cceb695b6/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple71/v4/51/8a/5c/518a5c3b-ba43-151e-972d-a209a2e859aa/source/392x696bb.jpg'']','[u''\u6559\u80b2'']','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/44/76/68/44766875-3795-b993-fc89-8b339f9fc7dd/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/44/76/68/44766875-3795-b993-fc89-8b339f9fc7dd/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/44/76/68/44766875-3795-b993-fc89-8b339f9fc7dd/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E4%B8%89%E4%BA%BA%E8%A1%8C%E5%AD%A6%E5%A0%82/id1180565266?mt=8&uo=4','ios','2018-07-24','393078584'),
 (4,'1181770034','内容推荐与自主订阅携手并进，随时随地发现精彩时刻，热门内容一网打尽！

【订阅】订阅感兴趣的话题、标签、内容来源，自定义你的阅读生活
【个性化】基于你的个人标签，为你推送兴趣内容，阅读变得有滋有味
【体验】全新留白式设计，极致的阅读体验，不累不烦，享受阅读

欢迎关注微信公众号：uyutrip
如有任何意见或建议，请在游鱼APP的【意见反馈】中进行反馈，谢谢。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/90/1d/32/901d325a-98ae-6584-9c3d-024d710bf9a1/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/e9/38/f0/e938f036-d5ad-8251-ceee-792a286f1895/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/77/02/32/770232db-9e46-8e3a-53f9-41b58cc311a2/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/5d/fc/59/5dfc59d2-07d0-342c-63ed-83f3cff57eb7/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/3d/fc/ef/3dfcef6e-5777-8e34-8075-630929e33369/source/392x696bb.jpg'']','[u''\u56fe\u4e66'', u''\u65b0\u95fb'']','https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/01/d1/6b/01d16b4a-2e7a-eeed-ab21-3e65e3f3404f/source/60x60bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/01/d1/6b/01d16b4a-2e7a-eeed-ab21-3e65e3f3404f/source/100x100bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/01/d1/6b/01d16b4a-2e7a-eeed-ab21-3e65e3f3404f/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B8%B8%E9%B1%BCuyu/id1181770034?mt=8&uo=4','ios','2018-07-24','393078584'),
 (5,'1252195473','内容提要
 
NEW.DO采用移动端+PC端双端结合方式，融合日常各类工作场景的解决方案，打造企业级协同办公的超级应用平台。
聚合关系管理、沟通协作、办公应用、文件管理、全景运营管理平台等办公场景，助力工作效率的提升。
 
基本功能：
 
【沟通协作】
单聊、群聊、讨论组、团队，语音会议、视频会议等多样化即时沟通方式，降低沟通成本，提升沟通效率。
 
【专属的办公应用】
会议，督办，日程管理等功能，深度整合办公及业务系统，适配集团各类办公场景。
 
【全景运营管理平台】
督办统计、待办事项、办公应用聚合一处，便于以上帝视角管理工作。
 
【精准的关系管理】
海航同仁，手机通讯录，团队成员，常用联系人汇集一处，支持快捷查询搜索。
 
【文件管理】
强大的云盘功能让文件上传、分类聚合统一管理轻松自如。
 
【智能BOT】
让每位用户都拥有自己的智能助理。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/b5/df/bf/b5dfbf2a-5e79-fe66-9f03-6909dc319b84/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/bd/05/76/bd0576c6-4667-9e4a-53ca-8f8c03b0b75f/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/c2/4b/9c/c24b9c2c-f9df-673c-f323-6f5933728dfc/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/f5/aa/f9/f5aaf96d-53a2-87a1-0d1f-8c1bd5cd1a05/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/63/00/f8/6300f8af-1bfd-17ef-bcb7-e1c1f8ee1575/source/392x696bb.jpg'']','[u''\u5546\u52a1'', u''\u793e\u4ea4'']','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/87/e8/7b/87e87b3b-75aa-5b44-d91c-b7a8d24a5e9e/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/87/e8/7b/87e87b3b-75aa-5b44-d91c-b7a8d24a5e9e/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/87/e8/7b/87e87b3b-75aa-5b44-d91c-b7a8d24a5e9e/source/512x512bb.jpg','https://itunes.apple.com/cn/app/new-do/id1252195473?mt=8&uo=4','ios','2018-07-24','393078584'),
 (6,'1174744295','国民小黑卡系列产品是国民金融在消费升级背景下，面向青年群体、中产阶层及高收入群体推出的权益及礼遇类产品，通过私人助理一对一服务，精细化日程管理，为会员提供涵盖吃、住、行、游、购、娱、医美、体育、教育、金融的全产业链服务。
国民小黑卡的LOGO源于欧罗巴公主与宙斯的浪漫爱情传说，同时欧罗巴是拉丁语Europa的音译，含义为“文明、进步、科学富裕的象征”。国民小黑卡希望通过传播欧罗巴贵族精神，利用权益服务产品构建共享经济生态圈，促进国民消费体验升级，唤醒国人对品质生活的追求，让“人人都有享受更好生活的权利”。我们的目标用户是独立、自我、个性的社会群体代表，他们是生活的鉴赏家，积极拥抱变革，乐于享受智能精致的未来生活。','[u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/9d/8e/66/9d8e66c4-9b48-f1ec-50a1-e38db6055959/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/eb/7c/f5/eb7cf5f9-a081-cd6d-02ba-4e364936e17e/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/14/87/10/148710bb-2940-19b0-af64-e09ab9d3a253/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/9f/39/8c/9f398c37-ee97-79c5-8779-ec5126bb9af1/source/392x696bb.jpg'']','[u''\u65c5\u6e38'']','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/b2/52/4a/b2524aeb-968b-46d7-c36f-e467357ffc6c/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/b2/52/4a/b2524aeb-968b-46d7-c36f-e467357ffc6c/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/b2/52/4a/b2524aeb-968b-46d7-c36f-e467357ffc6c/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%9B%BD%E6%B0%91%E5%B0%8F%E9%BB%91%E5%8D%A1/id1174744295?mt=8&uo=4','ios','2018-07-24','393078584'),
 (7,'961509135','宠爱-宠物社交应用是一款陌生人垂直社交应用，有很强的交互性，致力于形成宠物社交第一社区。主要针对一二线城市白领女生，上下班的路上，下班回家及周末无聊的时候使用，在彼此互动的过程中得到乐趣，结交好友，简单说来就是有爱，好玩。目前1.0版完成了用户注册、登录，个人中心，发布宠物照片，查看热门萌图，养宠测试五个主要的功能。','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple3/v4/45/9b/d6/459bd61c-a658-4e92-687e-d132b7920bd7/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple5/v4/22/b1/70/22b17046-bd47-73f3-e5db-38e08996bdfe/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple1/v4/1a/5e/fd/1a5efd15-0ef7-b559-7abb-acfa60f751e5/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple1/v4/47/b6/92/47b692df-9645-e62f-82a2-255c15d289a3/source/392x696bb.jpg'']','[u''\u793e\u4ea4'', u''\u751f\u6d3b'']','https://is4-ssl.mzstatic.com/image/thumb/Purple1/v4/b8/b8/01/b8b801ad-694b-b272-3b97-15a0ab396e19/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple1/v4/b8/b8/01/b8b801ad-694b-b272-3b97-15a0ab396e19/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple1/v4/b8/b8/01/b8b801ad-694b-b272-3b97-15a0ab396e19/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%AE%A0%E7%88%B1-%E5%AE%A0%E7%89%A9%E7%A4%BE%E4%BA%A4/id961509135?mt=8&uo=4','ios','2018-07-24','393078584'),
 (8,'1137846043','游匣是海航旅业集团旗下企业国民假期金融服务有限公司（以下简称国民金融）面向大众提供的旅游金融平台。在游匣上，您不仅可以购买各种国民金融提供的独家高性价比的旅游产品（包括吃住行游购娱方方面面），还可以让您的财富增值。真正实现国民旅游既省钱还能赚钱！','[u''https://is3-ssl.mzstatic.com/image/thumb/Purple60/v4/7e/6f/22/7e6f2283-cc77-2b2a-6f47-8fb00a4505e0/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple18/v4/06/d8/df/06d8df48-a4f5-7d1f-7993-164d5c80c210/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple60/v4/5b/26/3b/5b263b8d-f34b-413e-15fa-bfc4c0f222b5/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple20/v4/65/7d/8b/657d8b95-2283-c8b6-7c0c-bc9510124ce4/source/392x696bb.jpg'']','[u''\u8d22\u52a1'', u''\u5546\u52a1'']','https://is3-ssl.mzstatic.com/image/thumb/Purple60/v4/0d/6b/64/0d6b64b5-9d71-3d90-16f6-5602de030221/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple60/v4/0d/6b/64/0d6b64b5-9d71-3d90-16f6-5602de030221/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple60/v4/0d/6b/64/0d6b64b5-9d71-3d90-16f6-5602de030221/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B8%B8%E5%8C%A3/id1137846043?mt=8&uo=4','ios','2018-07-24','393078584'),
 (9,'934371414','海航WiFi移动应用是海航集团秉承“大众分享”的文化理念而推出的针对海航旗下各单位对外提供免费WiFi网络服务的统一认证接入应用，用户使用该应用可在海航WiFi网络所有覆盖区域实现一键登录，也可以通过应用为笔记本电脑或PAD共享上网码，最大程度方便用户上网畅游，带来极致的用户体验。','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple3/v4/d2/4a/b3/d24ab3a6-5ed5-7d88-db76-9a5a46550c26/source/640x1136bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple3/v4/33/14/86/33148622-ddcd-1ced-d96a-3c645ff5f359/source/640x1136bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple1/v4/fc/61/fa/fc61fa59-dfd2-8a29-a50b-a4d020f2191e/source/640x1136bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple3/v4/3a/12/e1/3a12e1e6-ea6b-a4e8-94e6-391994308d88/source/640x1136bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple3/v4/7b/54/00/7b54001c-760f-0307-be20-6a746bdba478/source/640x1136bb.jpg'']','[u''\u751f\u6d3b'', u''\u5546\u52a1'']','https://is5-ssl.mzstatic.com/image/thumb/Purple3/v4/f4/03/b2/f403b29d-5d77-bcd3-a886-52ac686f244f/source/60x60bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple3/v4/f4/03/b2/f403b29d-5d77-bcd3-a886-52ac686f244f/source/100x100bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple3/v4/f4/03/b2/f403b29d-5d77-bcd3-a886-52ac686f244f/source/512x512bb.jpg','https://itunes.apple.com/cn/app/hna-wifi/id934371414?mt=8&uo=4','ios','2018-07-24','393078584'),
 (10,'927826314','1.小睡懒汉模式，可以自由设定小睡的间隔时间 
2.自定义闹钟铃声，有普通闹铃和歌曲的高潮闹铃可供选择 
3.无限制响铃，闹钟不手动关闭的话，闹铃会无限制循坏播放 
4.后台闹钟，即使闹钟APP不在运行状态，闹铃也会定时响起 
5.方便的应用软件设定，可以很容易找到你需要的选项 
6.不含任何广告 
7.大而方便的“小睡”、“停止”按钮 
8.即时开启、闭关闹钟 
9.采用亲切和活力的橘黄色为背景 
10.支持多种闹钟循环模式，可以对周一至周日随机组合循坏闹钟','[u''https://is1-ssl.mzstatic.com/image/thumb/Purple3/v4/8b/b5/d6/8bb5d67d-b71e-1b01-aa7e-0db8b1a142dc/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple1/v4/b1/e5/4b/b1e54b4f-6f7f-0871-c413-144735d837d6/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple1/v4/18/49/6a/18496a1c-2edb-8d0b-48e3-b4b9008b13e7/source/392x696bb.jpg'']','[u''\u751f\u6d3b'', u''\u5929\u6c14'']','https://is2-ssl.mzstatic.com/image/thumb/Purple3/v4/1f/3f/98/1f3f9802-bb4c-d6cf-b4e6-b06a61bb223c/source/60x60bb.jpg','https://is2-ssl.mzstatic.com/image/thumb/Purple3/v4/1f/3f/98/1f3f9802-bb4c-d6cf-b4e6-b06a61bb223c/source/100x100bb.jpg','https://is2-ssl.mzstatic.com/image/thumb/Purple3/v4/1f/3f/98/1f3f9802-bb4c-d6cf-b4e6-b06a61bb223c/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%87%92%E8%99%AB%E9%97%B9%E9%92%9F/id927826314?mt=8&uo=4','ios','2018-07-24','393078584'),
 (11,'492164733','海商城iPhone版是一款基于iPhone平台的店铺管理软件,方便店铺卖家实时管理和监控店铺,不仅具有商品上架、查询、修改,订单查询及状态修改,同时具有订单提醒,库存警告信息查询等特色功能。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple/v4/c2/b3/bf/c2b3bf8c-bd34-d6f6-c99c-610a84e339a6/source/320x480bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple/v4/d2/8d/3c/d28d3caa-3153-1f69-6a27-6cef59516e52/source/320x480bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple/v4/ee/22/3b/ee223b04-647f-1fa0-e605-1df7ce957b96/source/320x480bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple/v4/ef/12/a1/ef12a132-e8aa-1dbd-cab4-087670f12284/source/320x480bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple/v4/c8/89/26/c88926a4-4a94-5530-2b58-d391727a7df7/source/320x480bb.jpg'']','[u''\u8d22\u52a1'', u''\u6548\u7387'']','https://is1-ssl.mzstatic.com/image/thumb/Purple/v4/cf/2f/b9/cf2fb91e-bba0-49ac-c454-bf76b4a56a64/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple/v4/cf/2f/b9/cf2fb91e-bba0-49ac-c454-bf76b4a56a64/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple/v4/cf/2f/b9/cf2fb91e-bba0-49ac-c454-bf76b4a56a64/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B5%B7%E5%95%86%E5%9F%8E/id492164733?mt=8&uo=4','ios','2018-07-24','393078584'),
 (12,'1190820989','【海航资本财富俱乐部】
 
海航资本 “聚宝乐”
 
--------  加入理财达人的移动社交圈
 
--------  参加丰富的线上线下活动
 
--------  领取免费的积分、礼品','[u''https://is4-ssl.mzstatic.com/image/thumb/Purple122/v4/52/77/1f/52771f76-8623-8894-e87b-9dfb99851098/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple122/v4/b5/be/59/b5be5922-5bdf-d5f2-a9bc-d561b0a13267/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/e6/4c/4d/e64c4daf-9341-d061-a5ec-d2f6b58bfd40/source/392x696bb.jpg'']','[u''\u751f\u6d3b'']','https://is4-ssl.mzstatic.com/image/thumb/Purple117/v4/b5/2e/c2/b52ec2fd-1321-cac9-de41-eea6583a125e/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple117/v4/b5/2e/c2/b52ec2fd-1321-cac9-de41-eea6583a125e/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple117/v4/b5/2e/c2/b52ec2fd-1321-cac9-de41-eea6583a125e/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E8%81%9A%E5%AE%9D%E4%B9%90/id1190820989?mt=8&uo=4','ios','2018-07-24','393078584'),
 (13,'1316833028','为海航体检中心受检者提供移动端应用体验，主要功能包括体检预约、报告查询、消息通知、回访评价、中心介绍、新闻公告、健康教育及个人中心。','[u''https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/a2/63/e0/a263e07c-fdd4-bb89-a32f-50fc1b901316/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/b2/2b/86/b22b86e7-b9d3-b34f-dd23-061c5f347ba6/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/b2/d7/f2/b2d7f2c0-aa15-1a01-e324-62a5819afa7e/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/23/3b/46/233b46a9-772c-7296-5392-8d4941d7b718/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/a8/c4/8a/a8c48a67-a807-8c2e-34e6-6db53328df68/source/392x696bb.jpg'']','[u''\u5546\u52a1'', u''\u533b\u7597'']','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/19/80/df/1980df03-3d2e-49a3-4fd3-16cc944824f4/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/19/80/df/1980df03-3d2e-49a3-4fd3-16cc944824f4/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/19/80/df/1980df03-3d2e-49a3-4fd3-16cc944824f4/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B5%B7%E8%88%AA%E4%BD%93%E6%A3%80%E4%B8%AD%E5%BF%83/id1316833028?mt=8&uo=4','ios','2018-07-24','393078584'),
 (14,'1253795272','这是一款分享美的图片社交app。这里有美景、有美图、有美人、有美食，更有美好生活！
我们来到这个世界，要爱最可爱的，最好听的，最好看的，最好吃的，有趣的活着。有美，会玩会享受，分享生活、分享美！','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/5f/9d/57/5f9d5776-19f8-1db5-efa6-9a1003147a2d/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/3f/34/98/3f3498c8-3cff-8d36-a355-79f7e13e8470/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/07/05/47/07054734-f0fe-b134-a364-7b7ff84e63fa/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/4f/b3/2b/4fb32bd4-cbb5-772b-5b23-b201680797c0/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/7e/2c/4a/7e2c4a30-7499-0464-3c6f-64f2bdafa03a/source/392x696bb.jpg'']','[u''\u8d2d\u7269'', u''\u65c5\u6e38'']','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/2e/37/70/2e3770f7-6ba5-685a-8bc3-c8e3847c71ee/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/2e/37/70/2e3770f7-6ba5-685a-8bc3-c8e3847c71ee/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/2e/37/70/2e3770f7-6ba5-685a-8bc3-c8e3847c71ee/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%9C%89%E7%BE%8E/id1253795272?mt=8&uo=4','ios','2018-07-24','393078584'),
 (15,'955684531','渤海信托是渤海国际信托股份有限公司推出的集信托产品预约、客户增值服务及客户资产信息查询的移动信托服务平台。

截止2017年11月31日，渤海信托总资产134.09亿元，净资产112.36亿元，管理的信托资产规模7094亿元。

渤海信托鲲鹏财富是渤海信托主动财富管理的实施机构，为客户量身定制专业化个性化的财富规划方案及提供全方位的金融理财服务。

选信托，来渤海信托鲲鹏财富，官方机构，为您的财富增值。

理财热线：400-812-0198','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/1e/a0/40/1ea04062-3d56-54c6-c09f-53e7361926c1/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/bd/18/e7/bd18e741-61a7-1375-a8a7-7c11d73880d6/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/00/76/65/00766574-2c0b-a88b-9990-37ef5babfe4f/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/34/7b/4a/347b4ad4-b047-7c75-413a-e97998f35d73/source/392x696bb.jpg'']','[u''\u5546\u52a1'', u''\u8d22\u52a1'']','https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/2f/1c/6c/2f1c6cfe-1a4e-5c78-d147-e0c817eaddf5/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/2f/1c/6c/2f1c6cfe-1a4e-5c78-d147-e0c817eaddf5/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/2f/1c/6c/2f1c6cfe-1a4e-5c78-d147-e0c817eaddf5/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B8%A4%E6%B5%B7%E4%BF%A1%E6%89%98/id955684531?mt=8&uo=4','ios','2018-07-24','955684530'),
 (16,'1040453672','渤海信托移动业务平台是渤海信托“综合业务管理平台”在IOS上的客户端。旨在为渤海信托提供快速高效的处理日常业务。做到随时、随地、随行的处理日常业务流程，同时还可以查看当前重要消息和本部门及其他部门的项目信息。

     该应用免费提供给渤海信托“综合业务管理平台”的用户使用。其中使用步骤如下：
1、用户下载并安装本软件。
2、使用PC端的综合业务管理平台用户名、密码登陆软件即可使用。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple69/v4/66/75/7c/66757c55-0f88-b66c-fe71-d6b76bf8d989/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple41/v4/72/d8/ff/72d8ff9e-11bb-70fd-68be-827f877982fb/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple69/v4/b5/18/8a/b5188ab0-2834-8e6f-e8c7-c8d0a20c2fea/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple3/v4/ab/28/4e/ab284e01-95a6-6098-4cf6-79b97927b806/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple3/v4/30/6f/89/306f8963-f187-62de-46ad-704aa706a2ba/source/392x696bb.jpg'']','[u''\u5546\u52a1'']','https://is5-ssl.mzstatic.com/image/thumb/Purple32/v4/f9/23/ae/f923ae85-9170-0a49-9d22-cafdaefc0678/source/60x60bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple32/v4/f9/23/ae/f923ae85-9170-0a49-9d22-cafdaefc0678/source/100x100bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple32/v4/f9/23/ae/f923ae85-9170-0a49-9d22-cafdaefc0678/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B8%A4%E6%B5%B7%E4%BF%A1%E6%89%98%E7%A7%BB%E5%8A%A8%E5%AE%A1%E6%89%B9/id1040453672?mt=8&uo=4','ios','2018-07-24','955684530'),
 (17,'1181791590','渤海信托鲲鹏理财师是渤海信托专为理财师打造的移动客户管理平台。
帮助理财师随时了解产品动态、客户需求及个人账户相关信息。
协助理财师开拓和维护客户，分析客户的个性化资产需求配置。

服务热线：400-812-0198','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/b7/12/46/b7124622-f607-2411-7366-44ebc69e47d7/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/1c/39/46/1c3946ab-7ce3-d00e-4fdc-b921369ac4a0/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/3c/9c/78/3c9c78a8-ac14-72fe-b7f8-5d77ae03b7a0/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/d3/ed/88/d3ed88d0-44f6-2f82-78e5-506aa336f298/source/392x696bb.jpg'']','[u''\u5de5\u5177'']','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/af/f2/ef/aff2efc4-c9cd-9820-67f1-4ebdb996d8e8/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/af/f2/ef/aff2efc4-c9cd-9820-67f1-4ebdb996d8e8/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/af/f2/ef/aff2efc4-c9cd-9820-67f1-4ebdb996d8e8/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B8%A4%E6%B5%B7%E4%BF%A1%E6%89%98%E9%B2%B2%E9%B9%8F%E7%90%86%E8%B4%A2%E5%B8%88/id1181791590?mt=8&uo=4','ios','2018-07-24','955684530'),
 (18,'1259017864','"渤海保呗"是渤海人寿保险股份有限公司旗下互联网保险服务平台，致力于普及保险知识，让民众更了解保险。功能包括：知识分享，在线投保，在线保单服务等。“渤海保呗”正处于快速发展期，每天给您不一样的体验。','[u''https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/d6/d2/29/d6d2296d-a05b-2333-3d7d-e61e87f01565/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/b2/c4/59/b2c459f3-ac00-9904-d1b9-8f68ffbbab20/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/75/5b/2a/755b2a59-7bf3-66ef-5ef9-3e9439fd8538/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/e2/08/44/e20844ad-4262-54ad-6ac7-4776d75fa54d/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple62/v4/b4/6e/85/b46e8585-a348-354f-9b5b-70fe9884c7be/source/392x696bb.jpg'']','[u''\u8d22\u52a1'']','https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/7a/31/e8/7a31e8dc-df06-454f-4af7-f18d7f2aa809/source/60x60bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/7a/31/e8/7a31e8dc-df06-454f-4af7-f18d7f2aa809/source/100x100bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/7a/31/e8/7a31e8dc-df06-454f-4af7-f18d7f2aa809/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B8%A4%E6%B5%B7%E4%BF%9D%E5%91%97/id1259017864?mt=8&uo=4','ios','2018-07-24','1080256087'),
 (19,'1080256088','“掌上渤海”是渤海人寿保险股份有限公司（Bohai Life Insurance Co., Ltd.）打造的一款移动办公产品。
用户可以通过“掌上渤海”在iPhone上突破时间和地域的局限，处理工作流程，阅读公司最新动态，查找联系人员。
请注意这个应用免费提供给已经拥有“掌上渤海”的用户使用。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple69/v4/ec/5e/df/ec5edf44-5c35-5bc0-f9ec-16eff27411c0/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple69/v4/14/3c/fe/143cfe98-27b9-4150-87a9-bec8740d21f0/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple49/v4/18/b1/cf/18b1cf5f-9ae4-ada6-6b1b-fc789ef6e632/source/392x696bb.jpg'']','[u''\u6548\u7387'', u''\u5546\u52a1'']','https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/70/59/6e/70596ee2-7b0d-7321-c243-a5a04a9083e3/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/70/59/6e/70596ee2-7b0d-7321-c243-a5a04a9083e3/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/70/59/6e/70596ee2-7b0d-7321-c243-a5a04a9083e3/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%8E%8C%E4%B8%8A%E6%B8%A4%E6%B5%B7/id1080256088?mt=8&uo=4','ios','2018-07-24','1080256087'),
 (20,'1174626593','飞行加，为飞行增加无限可能!
尽享海量专属特价机票！


【飞行加】作为西部航空和北部湾航空唯一官方APP购票平台，是一款为用户提供航空公司产品及服务预定的移动应用产品，用户可以通过本应用订购多家航司的直销机票、预购增值服务、旅游度假、周边礼品及办理旅途中必要的出行服务等。

【西部航空】
西部航空有限责任公司（简称西部航空）是国内领先的低成本航空公司，旨在打造具有中国特色的低成本航空品牌，已获得“中国领先低成本航空”、“亚洲领先高效低成本航空”等殊荣。西部航空以重庆、郑州作为运营基地，已拥有空客A319/A320飞机30架，并已开通海口、广州、上海、深圳、新加坡等60余条国际、国内航线。 

【北部湾航空】
广西北部湾航空有限责任公司（简称北部湾航空）以南宁为主基地，目前已拥有飞机22架，在飞航线62条，通航66个城市，包括南宁至天津、海口、西安、青岛、合肥等多条国内航线，以及毕节、临沂、榆林、晋江、南通等支线航线。


【功能简介】
(1)	多家航司提供机票预订
飞行加APP作为西部航空和北部湾航空唯一官方APP购票平台，可为您提供上百条丰富的航线选择，机票搜索及预订功能操作便捷，您还可根据不同的需求选择适合的机票类型。
(2) 尽享海量专属优惠
拥有专属特价产品，国内外机票0元起，海量特价信息尽在“掌握”中。
(3) 独享退改费全免权益
行程有变，想改期？临时有事，要退票？APP购票让你不再担心退改费问题。
凡在飞行加APP购买指定航班机票，即可独享14天外（含）退改费用全免权益。
(4) 多种支付方式
支持支付宝和微信支付等多种支付方式，安全且操作简单。
(5) 个性化增值服务选择
您可以根据行程需求订购托运行李、机上餐食、贵宾厅等增值服务，让您的行程轻松无忧。
(6) 个人中心
随时查看个人航班信息，登陆账户后，可轻松编辑、更改和获取即将搭乘的航班信息。添加常用乘机人信息，让您的订票过程更加方便快捷。
⑺ 航班动态查询
随时随地获得航班出发和到达的即时信息。


【热门城市】
国内：重庆、三亚、海口、乌鲁木齐、库尔勒、拉萨、泉州、厦门、合肥、昆明、丽江、西双版纳、武汉、西安、郑州、深圳、广州、南宁、青岛、毕节、临沂、榆林、晋江、南通等。
国际/地区：新加坡','[u''https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/58/ce/a4/58cea429-5ead-4654-5828-50ddbbe1ef39/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/83/d6/f8/83d6f8ab-e877-e158-f886-c2b8923c63a0/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/c9/99/1f/c9991fa5-5124-d1eb-53f5-b235f3c302fe/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/e5/b2/dc/e5b2dcfd-3eed-b087-2300-1fca34bc1c53/source/392x696bb.jpg'']','[u''\u65c5\u6e38'']','https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/44/fc/8c/44fc8c54-2bcf-24eb-d155-27a3d369de89/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/44/fc/8c/44fc8c54-2bcf-24eb-d155-27a3d369de89/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/44/fc/8c/44fc8c54-2bcf-24eb-d155-27a3d369de89/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E9%A3%9E%E8%A1%8C%E5%8A%A0/id1174626593?mt=8&uo=4','ios','2018-07-24','555257011'),
 (21,'517198355','内容摘要：
国付宝钱包依托海航集团以有竞争力的理财产品吸引用户，持续采用资源整合、微创新及互动营销为用户不断提供有吸引力的功能服务，同时也为用户在生活所需付款场景及缴费场景提供安全、便捷的支付手段。

本期钱包满足用户基础收付款使用场景需求。整合城市信息服务、缴费充值、O2O消费等服务，致力服务于个人日常生活提供支付解决方案。现有的信用卡还款、手机话费充值、加油卡充值、充值、转账全免费，后续将提供理财保险、生活服务等一系列全新服务，多种红包玩法，让你和亲朋好友一起分享更多乐趣！','[u''https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/d2/69/ca/d269cab4-3515-2f96-55b2-42a77e3de236/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/80/3f/13/803f133d-a50b-8af8-4f41-9088c7a684e7/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/ec/f0/7a/ecf07ad9-8378-f90d-89a9-0e9fdeaffa2f/source/392x696bb.jpg'']','[u''\u8d22\u52a1'', u''\u5546\u52a1'']','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/2b/d6/ac/2bd6acf9-7fbc-85d4-b6ba-a850e1c67e2a/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/2b/d6/ac/2bd6acf9-7fbc-85d4-b6ba-a850e1c67e2a/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/2b/d6/ac/2bd6acf9-7fbc-85d4-b6ba-a850e1c67e2a/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%9B%BD%E4%BB%98%E5%AE%9D/id517198355?mt=8&uo=4','ios','2018-07-24','517198358'),
 (22,'1333435717','国付宝信息科技有限公司是由商务部中国国际电子商务中心与海航商业控股有限公司合作成立的独立第三方支付平台。通过深入了解政府及中小企业的支付需求，推出了一系列电子支付产品，为用户提供完整的在线支付解决方案。
国付宝商户版APP适用于所有网页版国付宝商户后台注册并且激活的商户。商户公司财务人员可以通过APP生成线下充值订单，再前往银行进行汇款充值；可以对账号下的账户相互划款/提现；可以审批商户发起的付款请求；还可以对收款成功的订单做退款处理，而且每笔交易后台都有记录可查。真正做到了“审批付款，快捷安全”、“资金划转，省心方便”和“充值提现，弹指瞬间”的三大操作特点。
国付宝商户版APP为商户公司财务人员管理资金提供了便捷，提高了效率，数字证书和短信验证等风控措施，稳妥保障企业资金的安全。“潜心研究，探索创新”将是我们不变的宗旨，我们致力于帮助商户解决企业账户管理方面的核心需求，积极助力企业发展。','[u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/95/3c/ab/953cabd2-5dd3-634f-4249-5d5a1795dd8f/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/bc/9e/be/bc9ebeaa-d0a7-fe07-fb22-0ad7f02c595d/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/0a/8e/11/0a8e11c3-1f51-3808-fad7-fa4e83dae55e/source/392x696bb.jpg'']','[u''\u8d22\u52a1'', u''\u5546\u52a1'']','https://is4-ssl.mzstatic.com/image/thumb/Purple115/v4/c4/66/e3/c466e337-f7cc-72d3-5020-e5689ece3c65/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple115/v4/c4/66/e3/c466e337-f7cc-72d3-5020-e5689ece3c65/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple115/v4/c4/66/e3/c466e337-f7cc-72d3-5020-e5689ece3c65/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%9B%BD%E4%BB%98%E5%AE%9D-%E5%95%86%E6%88%B7%E7%89%88/id1333435717?mt=8&uo=4','ios','2018-07-24','517198358'),
 (23,'830285988','易生支付有限公司是海航旅游集团旗下专业第三方支付公司，2008年12月30日在天津注册成立，注册资本十亿元人民币，是全国第一批获得中华人民共和国支付业务许可证（互联网支付、预付卡发行与受理）的非金融服务机构，同时在2016年成功获得“银行卡收单、移动电话支付”两项支付业务许可增项。
易生支付客户端是专为易生会员打造的移动服务平台。支持用户在手机端使用“易生卡管理、易商户查询、优惠券领取、扫一扫支付”等功能，发展成为融合了支付、生活服务等场景的平台。
【主要功能】
1、 随时随地查询易生卡余额、账单等信息
2、 支持代金券的领取，买单打折尽享优惠
3、 提供手机话费充值等生活服务','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple111/v4/29/40/d6/2940d66c-1ed0-63f0-0fe1-8cda68549e97/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple111/v4/14/29/42/142942fb-3a8f-8a90-a0bf-5dd5e5333de4/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/0f/81/7b/0f817b18-3b5e-7606-eb30-490a35909426/source/392x696bb.jpg'']','[u''\u8d22\u52a1'', u''\u5546\u52a1'']','https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/9f/00/8a/9f008afb-79ad-7bd6-8d05-48d4a182d50f/source/60x60bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/9f/00/8a/9f008afb-79ad-7bd6-8d05-48d4a182d50f/source/100x100bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/9f/00/8a/9f008afb-79ad-7bd6-8d05-48d4a182d50f/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%98%93%E7%94%9F%E6%94%AF%E4%BB%98-easypay/id830285988?mt=8&uo=4','ios','2018-07-24','830285991'),
 (24,'1001839898','易生支付商户端是一款独立的应用，它为易生的商户提供易支付的收银功能，商家可以在应用上进行收款、订单查询、当日的交易撤销。在pc端上配置不同的收银账号给收银员、进行权限分配。让商户的收银便捷化、移动化。','[u''https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/21/7c/7f/217c7f35-3e80-17c8-33de-7b227466c529/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple111/v4/da/50/87/da50875b-43a6-68ad-1b32-4ac6258adb7e/source/392x696bb.jpg'']','[u''\u8d22\u52a1'', u''\u5546\u52a1'']','https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/51/40/35/514035ab-5b46-636c-353b-e78307bad2e9/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/51/40/35/514035ab-5b46-636c-353b-e78307bad2e9/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/51/40/35/514035ab-5b46-636c-353b-e78307bad2e9/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%98%93%E7%94%9F%E6%94%AF%E4%BB%98%E5%95%86%E6%88%B7%E7%89%88/id1001839898?mt=8&uo=4','ios','2018-07-24','830285991'),
 (25,'1138173881','美妙入园，简单出行！
领先西安景区提供商，提供西安四大旅游景区介绍，省去排队的烦扰，让你轻松玩转特色景区，竭诚为您提供入园安心享受。
【入园】轻松一扫，一秒入园
【卡包】记录卡信息、游园日再也不用担心忘记和她出行的纪念日
【目的地推荐】身未动、心已远，提前掌握景点介绍','[u''https://is1-ssl.mzstatic.com/image/thumb/Purple22/v4/64/1c/64/641c6403-857b-eed7-3eb1-2542ef24c27b/source/392x696bb.jpg'']','[u''\u65c5\u6e38'', u''\u5546\u52a1'']','https://is5-ssl.mzstatic.com/image/thumb/Purple62/v4/09/35/2b/09352b7d-93da-07a3-070e-e6f16b7e4e8a/source/60x60bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple62/v4/09/35/2b/09352b7d-93da-07a3-070e-e6f16b7e4e8a/source/100x100bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple62/v4/09/35/2b/09352b7d-93da-07a3-070e-e6f16b7e4e8a/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%9B%B2%E6%B1%9F%E6%96%87%E6%97%85/id1138173881?mt=8&uo=4','ios','2018-07-24','830285991'),
 (26,'1295543693','1、清晰完成二维码每日对账，交易日期、交易金额、交易类型、一目了然，快捷安全；2、支持在线语音播报','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/42/39/97/423997f8-0b8b-cd40-bcf7-756257d7a314/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/09/72/77/097277f7-0afd-81d4-0d76-2fd62fe75d7d/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/e6/75/8f/e6758f78-5430-5ab8-4df1-08cd24aa69b5/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/7e/63/cf/7e63cfbd-ac4f-6c0d-ab6d-4be57a525069/source/392x696bb.jpg'']','[u''\u5de5\u5177'', u''\u751f\u6d3b'']','https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/bd/9e/20/bd9e207a-efe1-5ad6-3ba1-d57b672f7129/source/60x60bb.jpg','https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/bd/9e/20/bd9e207a-efe1-5ad6-3ba1-d57b672f7129/source/100x100bb.jpg','https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/bd/9e/20/bd9e207a-efe1-5ad6-3ba1-d57b672f7129/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%94%B6%E6%AC%BE%E5%95%A6-%E6%98%93%E7%94%9F%E6%94%AF%E4%BB%98%E5%95%86%E6%88%B7%E7%AB%AF/id1295543693?mt=8&uo=4','ios','2018-07-24','830285991'),
 (27,'465617429','海南航空控股股份有限公司（以下简称海南航空）于1993年1月成立，起步于中国最大的经济特区海南省，是中国发展最快和最有活力的航空公司之一，致力于为旅客提供全方位无缝隙的航空服务。2012年3月，海南航空蝉联SKYTRAX五星航空公司，同年7月，实现连续三年蝉联SKYTRAX中国最佳航空公司及中国地区卓越服务两项大奖，被国际著名品牌咨询评估机构Millward brown评选进入2013年BRANDZ 2013年中国品牌价值五十强。海南航空官方手机客户端提供机票预订和支付、航班动态查询、手机值机、会员里程查询等自助服务，随时随地为您提供“贴身、便捷、温馨”的出行服务。 
手机客户端操作简单实用、安全高效，欢迎安装使用，享受手机购票的全新体验。

联系我们: 
EMAIL: webeticket@hnair.com 
客户服务热线:95339','[u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/5b/2a/b6/5b2ab62b-503e-bff1-0304-d8688d83f306/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/9e/63/fd/9e63fdc8-5382-3407-47a4-187a6b991ba2/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/bc/32/f8/bc32f883-ae9b-81a3-5f2f-7013e40cceaa/source/392x696bb.jpg'']','[u''\u65c5\u6e38'', u''\u751f\u6d3b'']','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/46/9b/df/469bdfb8-dd41-a9a2-34c9-863450bd62a6/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/46/9b/df/469bdfb8-dd41-a9a2-34c9-863450bd62a6/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/46/9b/df/469bdfb8-dd41-a9a2-34c9-863450bd62a6/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B5%B7%E5%8D%97%E8%88%AA%E7%A9%BA-%E6%B5%B7%E8%88%AA%E5%AE%98%E6%96%B9%E7%89%88/id465617429?mt=8&uo=4','ios','2018-07-24','465617432'),
 (28,'1086528245','——福州航空手机客户端——竭诚为您服务。福州航空手机客户端现已上线。在手机完成安装后，即可方便的在移动终端上完成机票预订、一键支付、航班动态查询、订单管理等自助服务。福州航空手机客户端为您的旅行提供随心而动的温馨服务，并且优惠多多哦！欢迎广大旅客使用，体验手机订票的便利与舒服，并提出您的宝贵意见，帮助它越来越好。
福州航空官网：http://www.fuzhou-air.cn
客服热线：95071666
2.0.0升级说明：
【界面】整体界面风格优化，更加直观明了
【网上值机】实现个性化选座，为您省去排队时间
【特价机票】不定期推出特价机票
【价格走势】轻轻松松找准便宜
【乘务专区】轻松获取褔航招聘空乘信息，参与空乘海选活动
【机票验真】提供褔航销售的以666开头的客票或行程单的查询验真
【旅行助手】一键了解，助您畅游旅程','[u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/01/3d/a0/013da0d4-0b6c-e66f-cf0c-1f98e5e6eba1/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/e7/6c/24/e76c2450-2d9c-b74d-45e9-9c1e202e5f34/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/31/ea/d8/31ead8ca-068f-ef2f-0efc-b8da1c63a27a/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/db/be/1e/dbbe1e85-a3fa-510b-1a2e-91d867c0f927/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/e1/f5/c2/e1f5c2be-f68a-5bbf-242c-37b13af885e2/source/392x696bb.jpg'']','[u''\u5546\u52a1'', u''\u65c5\u6e38'']','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/ca/e8/45/cae845da-9581-4632-9d79-d84968cc1df1/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/ca/e8/45/cae845da-9581-4632-9d79-d84968cc1df1/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/ca/e8/45/cae845da-9581-4632-9d79-d84968cc1df1/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E7%A6%8F%E5%B7%9E%E8%88%AA%E7%A9%BA/id1086528245?mt=8&uo=4','ios','2018-07-24','1086528244'),
 (29,'1277389161','心之所想，天航所往。天津航空，您身边的航空公司。

【天津航空】
天津航空有限责任公司（简称天津航空）于2009 年6 月8 日成立。我们拥有以A330、A320、E190等机型为主的年轻豪华机队，总机队规模近90余架。拥有国际国内航线160余条，通航城市100余座，航线网络遍布全国以及日本、韩国、俄罗斯、泰国等周边国家和地区，并2016年相继开通伦敦、奥克兰洲际航线。
我们秉承“从你出发、亲近世界”的品牌定位，致力于为您提供便捷实用的产品和服务，以善解人意、热爱生活的态度与您共同创造美好的旅行体验，让世界更亲近。

【服务说明】
天津航空APP为您提供简单快捷的机票预订服务，让您用最低的价格购买您最需要的产品。
【功能简介】
机票预订：开门见山！首页直接搜索航线，预订机票，让您轻松成行。
在线退票：快捷方便！行程有变不用担心，APP在线退票帮您分忧。
订单管理：一目了然！APP在手，所有行程尽在掌握。

【热门城市】
国内：天津、长春、长沙、重庆、哈尔滨、海口、杭州、合肥、呼和浩特、昆明、兰州、南京、宁波、青岛、秦皇岛、上海虹桥、沈阳、塔城、乌兰浩特、武汉、西安','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple125/v4/cf/f1/ca/cff1ca2d-5832-0499-f714-c03b9929e546/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/1e/fc/77/1efc770b-ee8e-03d3-6fba-4880180f5b66/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple125/v4/a1/63/3a/a1633af1-eda6-0c0d-0729-2acb49ab00cf/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/ad/71/b7/ad71b76e-2a9f-b59c-b9de-56cde68b6454/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/8d/87/fa/8d87fad5-cd28-f56c-7ea0-3fd76f3154aa/source/392x696bb.jpg'']','[u''\u65c5\u6e38'', u''\u751f\u6d3b'']','https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/05/da/b7/05dab798-d9e7-413f-f4b8-88b086ebb088/source/60x60bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/05/da/b7/05dab798-d9e7-413f-f4b8-88b086ebb088/source/100x100bb.jpg','https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/05/da/b7/05dab798-d9e7-413f-f4b8-88b086ebb088/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%A4%A9%E6%B4%A5%E8%88%AA%E7%A9%BA%E5%AE%98%E6%96%B9%E5%BA%94%E7%94%A8/id1277389161?mt=8&uo=4','ios','2018-07-24','452663183'),
 (30,'1190196575','【公司介绍】
大集金服作为世界500强海航集团旗下的专业互联网金融平台，由中华全国供销合作总社与海航集团合作成立的大型涉农混合所有制企业海南供销大集控股有限公司下属企业。大集金服在海南供销大集授权下组织开展各项工作，对供销大集全国范围内的金融业务实施统筹，致力于成为“供销大集农业、电商、地产、食品、物流综合产业生态链‘现代化金融服务综合运营商’”。
 
【平台介绍】
大集金服梳理、优化供销大集供应链，依托大宗贸易、应收账款保理、基金、理财、投资、第三方支付、供应链金融、小货、融资租赁、消费金融、互联网金融等手段，为供应链B2B2C端客户提供丰富多样、自主灵活的金融产品和服务。大集金服是专业的理财平台，具有健全的风险控制体系。大集金服致力为机构及个人投资者提供“安全、可靠、便捷、专业”的普惠金融服务。
 
【银行存管 保障资金更安全】
西安银行对您的交易资金及平台自有运营资金进行分账监管，与资金相关操作需经用户授权后进行，西安银行对其进行管理，保障您的资金安全。
 
【联系我们】
1.客服热线：950711
2.微信公众号：ccoopfs
3.官网：www.ccoopfs.com
 
大集金服，让您幸福！','[u''https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/0d/79/8b/0d798bbe-3973-bb98-d9ac-67a9d30976cb/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/b7/17/7d/b7177d98-f281-af73-0125-289c7f79cf47/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/58/22/aa/5822aa84-1a0d-42f5-1a30-ec69fc536f2c/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/76/47/4b/76474b09-cbed-8e12-2651-e4751880452f/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/ae/f8/c8/aef8c8a6-a5b7-3879-d6fc-c559968b5449/source/392x696bb.jpg'']','[u''\u8d22\u52a1'']','https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/21/6f/59/216f59e9-2f88-135f-5224-a72d3d10047e/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/21/6f/59/216f59e9-2f88-135f-5224-a72d3d10047e/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/21/6f/59/216f59e9-2f88-135f-5224-a72d3d10047e/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%A4%A7%E9%9B%86%E9%87%91%E6%9C%8D/id1190196575?mt=8&uo=4','ios','2018-07-24','1190196574'),
 (31,'1042174600','前海航交所是深圳市政府批复的交易所牌照机构,由全球500强企业海航集团全资设立,专注于熟悉的航空航运、物流和金融的专业化领域，主要为个人和机构投资者提供专业、高效、安全的稳定收益回报。是深圳前海和粤港澳自贸区的创新企业代表。

年化利率高达7%~15%
新手注册送豪礼
活期理财日利是 高收益 灵活存取

【功能介绍】
1.	核心功能全。所有投资、充值、提现、债权转让等功能都可以通过手机进行操作；
2.	设置详细。项目详情、账户资产、交易明细、等全部清晰展示；
3.	信息透明。实时财务更新，成熟投资人和机构首选理财平台；
4.	安全稳定。多重保护，安心无忧、手势密码、信息加密双剑合璧；
5.      灵活存取。活期理财产品日利是，高收益，T+1起息，T+2日内赎回到账。

【联系方式】
官网： http://www.as-exchange.com/
客服热线：400-1616-566
官方微信：as-exchange','[u''https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/33/ba/b3/33bab3de-7ad2-c069-b675-8465028b9c61/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/cd/94/19/cd94199f-16ca-6ae6-ad27-908379a3f97f/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/ac/31/76/ac317659-c74b-24df-675d-ac87c1b56c53/source/392x696bb.jpg'']','[u''\u8d22\u52a1'']','https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/b8/d8/5c/b8d85c1e-6d74-1adb-a5c6-50c70d2e8e0c/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/b8/d8/5c/b8d85c1e-6d74-1adb-a5c6-50c70d2e8e0c/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/b8/d8/5c/b8d85c1e-6d74-1adb-a5c6-50c70d2e8e0c/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%89%8D%E6%B5%B7%E8%88%AA%E4%BA%A4%E6%89%80/id1042174600?mt=8&uo=4','ios','2018-07-25','1042174599'),
 (32,'1059333660','海航通信推出的移动客户端，可以实时掌握海航通信活动讯息。每日随时随地享受签到获取资源，在您方便查询资源余量的同时也可快速办理相关业务。提供全民充服务，支持移动、联通、电信充值话费流量，更有优惠活动领取丰富奖励。搭建白拿商城，体现话费升值的能量商城，提供存话费，送商品，到期话费全额退的新型话费白拿模式。','[u''https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/93/1a/8a/931a8a65-91db-cfcf-e273-278757e56abb/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/06/d4/11/06d41130-d77c-ff7b-a60a-561c00f6f79a/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/b5/c0/68/b5c0688b-4c4e-f832-7a4c-affd57c56e62/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/3b/d5/25/3bd525b8-b33e-7f96-223d-0737c64c70f7/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple111/v4/fc/85/1f/fc851fb4-a50f-95b2-f1de-f64d73e9045f/source/392x696bb.jpg'']','[u''\u5de5\u5177'']','https://is1-ssl.mzstatic.com/image/thumb/Purple125/v4/f3/13/e2/f313e2e6-7015-26e5-6dde-fadbb30dd5b4/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple125/v4/f3/13/e2/f313e2e6-7015-26e5-6dde-fadbb30dd5b4/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple125/v4/f3/13/e2/f313e2e6-7015-26e5-6dde-fadbb30dd5b4/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B5%B7%E8%88%AA%E9%80%9A%E4%BF%A1/id1059333660?mt=8&uo=4','ios','2018-07-25','1059333659'),
 (33,'1127692615','海游出境通app是一款为了解决国内游客短期出境通讯漫游问题的创新应用性服务，相比传统国际漫游资费可为您节省80%的漫游费用。游客依照旅游计划自由选择并且预先购买各国当地的通讯服务（上网流量等）；抵达目标国家，立即切换所购买的资费套餐便可实时上网、通话，与亲朋好友保持联系，分享喜悦。海游出境通绝对是出境旅游的必备通讯利器。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple60/v4/5a/49/f4/5a49f479-3441-a5e1-b570-7e54eeec046b/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple30/v4/64/82/dd/6482ddf6-b4ae-bacc-c111-54de1ec0c502/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple30/v4/92/53/e8/9253e8e4-9ede-5210-5929-f37c70d0214a/source/392x696bb.jpg'']','[u''\u65c5\u6e38'', u''\u751f\u6d3b'']','https://is3-ssl.mzstatic.com/image/thumb/Purple20/v4/4f/c5/12/4fc51279-abb2-0734-003e-c6a3230df47b/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple20/v4/4f/c5/12/4fc51279-abb2-0734-003e-c6a3230df47b/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple20/v4/4f/c5/12/4fc51279-abb2-0734-003e-c6a3230df47b/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%B5%B7%E6%B8%B8%E5%87%BA%E5%A2%83%E9%80%9A/id1127692615?mt=8&uo=4','ios','2018-07-25','1059333659'),
 (34,'1288466617','凡拨，拨动不平凡。
【产品简介】
凡拨是一款连接全球的免费通话神器。支持全球高清晰跨应用通话，可免费拨打长途、国际电话。无SIM卡亦可接打电话，让沟通无处不在。实现颠覆全球的通信功能，彻底解决出境人群的通话需求。
【产品特点】
●一省●
省心：不管您在国内还是国外，省电低能耗，凡拨在手，不漏接一通电话，彻底放心出行。
●两高●
高安全：凡拨采用高级别安全通信加密技术，通话、消息采用端对端的加密，沟通内容只有您和您的沟通对象才能听见和看到；
高质量：业界领先音质处理技术，让您的通话平稳高清。
●三免●
免开通国际功能：您的手机号无需开通国际长途、国际漫游功能，凡拨在手，通话全球；
免卡：拥有凡拨，您可在没有手机卡情况下，通过凡拨拨打电话；
免费：使用凡拨，接打电话、消息服务、手机号码托管全部免费。
【产品功能】
1、通话服务：支持国内、国际通话，实现凡拨好友间的免费通话，支持给没有安装凡拨的用户拨打电话，并凡拨可以接听到您所设置号码的所有来电；
2、通讯录：同步本地通讯录，有效防止陌生来电骚扰，备份通讯录；
3、消息服务：支持凡拨好友间的消息服务，包括文本、视频、音频、图片等消息服务，增加辅助您的交流方式；
4、拨号盘：取代手机系统拨号盘，提供智能检索通讯录功能，秉承用户使用习惯。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/06/36/5a/06365ae8-f2da-f22c-9d5b-2be3a8c38f6b/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/79/93/55/79935559-7690-c1ab-4d84-bd35d131c284/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/b6/05/56/b60556b8-ed2b-428b-4932-f6e9df8e7faa/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/2c/c2/fe/2cc2fef4-9c0b-d25c-513e-9d780e236f31/source/392x696bb.jpg'']','[u''\u793e\u4ea4'', u''\u5de5\u5177'']','https://is1-ssl.mzstatic.com/image/thumb/Purple62/v4/32/1b/67/321b6726-a50a-a09b-857b-dc29b117b8d3/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple62/v4/32/1b/67/321b6726-a50a-a09b-857b-dc29b117b8d3/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple62/v4/32/1b/67/321b6726-a50a-a09b-857b-dc29b117b8d3/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%87%A1%E6%8B%A8/id1288466617?mt=8&uo=4','ios','2018-07-25','1059333659'),
 (35,'763281937','首都航空手机客户端------随时随地为您服务！首都航空手机客户端更新啦！在手机上完成安装后，即可方便的在移动终端上完成飞机票预订、手机支付、航班动态查询、订单管理等自助服务。首都航空手机客户端为您的旅行保驾护航！为您提供随心而动的温馨服务，并且优惠多多哦！欢迎广大旅客使用，体验手机订票的便利与舒适！','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple115/v4/5a/b5/cf/5ab5cfc3-44fb-5777-c43d-166f1cf1c7c2/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple125/v4/d8/e5/52/d8e5520e-ff4b-bcaf-96c4-b15ea817257f/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple125/v4/68/e4/55/68e455b2-7810-266d-95d1-2a048f810c4b/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/48/85/b2/4885b2f1-4732-f9ad-cc88-81f28f15d216/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple115/v4/40/e0/19/40e0191e-c2c1-462f-b3a7-685469635c79/source/392x696bb.jpg'']','[u''\u65c5\u6e38'', u''\u5546\u52a1'']','https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/ee/96/cb/ee96cb7d-3cdb-a4c0-8aa9-a4144e200fa8/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/ee/96/cb/ee96cb7d-3cdb-a4c0-8aa9-a4144e200fa8/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/ee/96/cb/ee96cb7d-3cdb-a4c0-8aa9-a4144e200fa8/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E9%A6%96%E9%83%BD%E8%88%AA%E7%A9%BA-%E9%A6%96%E8%88%AA%E5%AE%98%E6%96%B9%E7%89%88/id763281937?mt=8&uo=4','ios','2018-07-25','450759666'),
 (36,'1060917397','空空是首都航空倾情为您打造的移动社交互联网产品，致力于为航空乘务员、空乘应聘者、空乘粉丝以及首航乘客创造互动交流的平台。
在这里，您可以随时地了解空乘的生活动态，与空乘在线互动；还可以报名空乘招聘，参与空乘海选活动，选出您心中的最美空乘。
航空人精彩空间，无远弗届。','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple69/v4/f1/2f/b1/f12fb1fd-bc77-0287-ab4e-33dec7a4caf8/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple49/v4/c1/4e/32/c14e32f1-8d54-9564-0666-0af1f38ab401/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple49/v4/a0/1a/0b/a01a0b0a-856a-95e4-216b-e366eb5fbabf/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple49/v4/f8/4e/df/f84edfaa-69d9-a528-2590-9dd9ad96aa56/source/392x696bb.jpg'']','[u''\u793e\u4ea4'']','https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/bf/46/f4/bf46f4cb-3eef-bc00-ee48-d7218d97de2c/source/60x60bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/bf/46/f4/bf46f4cb-3eef-bc00-ee48-d7218d97de2c/source/100x100bb.jpg','https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/bf/46/f4/bf46f4cb-3eef-bc00-ee48-d7218d97de2c/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E7%A9%BA%E7%A9%BA-%E5%BD%93%E7%A9%BA%E4%B9%98-%E9%80%89%E7%A9%BA%E4%B9%98-%E5%B0%B1%E7%94%A8%E7%A9%BA%E7%A9%BA/id1060917397?mt=8&uo=4','ios','2018-07-25','450759666'),
 (37,'1290001245','嗨途-轻松去享受，旅行不将就。

嗨途移动客户端提供机票、酒店、景点门票、出境游、跟团游、自由行、邮轮、签证、个性定制等旅游产品预订，并提供优质旅游攻略全方位旅游服务。
HiApp 基于全球云服务资源库，聚合全球最优质、最本地化、最具性价比的航旅产品服务，打造最智能、最人性化的AI 旅行服务系统。建设最全、最准、最细的旅游线下服务数据体系。构建精准、高效、专业、共享的航旅云平台，让内外部航旅生活服务商汇聚于此，建立开放的旅游资源服务共享平台，构建线上新社区，以“无微不至，以诚相待”的服务理念，为旅游消费者提供随身随行的一站式服务， 开启智能个性化新旅游时代，同时形成生生不息的旅游生态体系。
限时秒杀：特价机票、特价酒店、超值活动优惠送不停
限时秒杀：春运献礼—春节机票提前GO，特价酒店、超值活动优惠送不停
 
主要功能：
【特价机票】：
 一年之计在于“春”，这个春节我们带你启程。境内外特价机票让出行更便捷，海航旗下唯一直销平台，提供各航线特价机票，各种促销活动贴心满足旅游计划。
【精选酒店】
从民宿到五星豪华酒店，HiApp提供多样，经济、快捷、舒适、高档、豪华酒店，让你的旅程有一个温暖的“家”，超过145万家的酒店可供选择，无论是差旅还是休闲出行，方便的筛选和优惠的价格，都是出行必备。根据出行目的地，推荐可选优质酒店。
【MTS 服务】          
“嗨途” MTS 服务上线， Hi心接机、行李管家、餐食预订多种移动场景旅行服务模式开启，让你的旅途更便捷。多样化车型可供选择接送机，让你的旅程充满乐趣；旅程中解决行李管理问题，让出行更加清晰，节约更多时间；餐食预定独立入口新增搜索非HiApp渠道机票订单功能，让你的旅途更加丰富。
【特色专区】
  “邮”你所爱，精选邮轮，带你体验丰富轻松舒适的游玩乐趣，您的海上之家。HiApp还推出的面向青年群体的特色服务项目，帮助年轻人轻松实现北美旅行。嗨住酒店，全场让利抢，自营专享半价优惠不停歇。hi途优选，国内海外超值活动，无微不至，以诚相待。
【假日精选】
  趣出游，随心选，免签/落地签海岛，带上护照说走就走。春节机票提前go，早定早安心，还有超值特惠，买即送，送回程、送酒店，我们除了价格低，没什么优点。
 【当季推荐】
  在这个季节送上更好的去处，去体验不一样的泰式风情、文艺时尚的国际都市、流连忘返的贝加尔湖畔，或者到唐人街过一个值得纪念的春节，总之这个季节让你有一个“嗨途”。
【精选路线】
超值跟团游：丰富的国内、出境跟团旅游线路，价格实惠，透明团放心游，个性自由行：你负责自由玩乐，我提供舒适旅程，海量旅游攻略，尽在指尖，让旅行变得更自由。
【我的发现】
丰富的旅游生活资讯让闲暇时间不无趣，点开发现好玩的目的地，了解各地风情趣味，关注各城健康美食，体会他人的足迹心得，让有趣的故事，尽在你的掌中。
【联系我们】
官方微博：HiApp-嗨小兔
官方微信公众号：HiApp嗨小兔
官方交流QQ群：653528144
投诉建议：hiappmarketing@hnair.com','[u''https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/ef/11/4d/ef114d17-822c-37bf-9606-88a03744be6e/source/406x228bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/a5/0e/7b/a50e7bc5-77dc-9ac5-b462-6f7c52375a38/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/61/80/b9/6180b978-3f4f-fce8-854d-8f22cfbc0769/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/0f/50/1c/0f501c83-1b3e-735f-d27b-7dc4743c817d/source/392x696bb.jpg'']','[u''\u65c5\u6e38'', u''\u751f\u6d3b'']','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/c4/fa/38/c4fa3816-41f3-086c-d159-19b937e1e8fd/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/c4/fa/38/c4fa3816-41f3-086c-d159-19b937e1e8fd/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/c4/fa/38/c4fa3816-41f3-086c-d159-19b937e1e8fd/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%97%A8%E9%80%94-%E6%8F%90%E4%BE%9B%E6%9B%B4%E8%B4%B4%E5%BF%83%E7%9A%84%E6%97%85%E8%A1%8C%E6%9C%8D%E5%8A%A1/id1290001245?mt=8&uo=4','ios','2018-08-17','393078584'),
 (38,'1413593416','安途商旅APP是安途商务旅行服务有限责任公司为企业客户打造的差旅服务平台，致力于为商务人士提供全流程差旅服务：
1. 专业出行预订服务：提供机票、酒店、网约车等预订服务；
2. 定制化差旅管理：根据企业要求，量身定制差旅管理策略，通过移动审批管理、差旅标准管控、超标行为识别等方式规范用户差旅行为，提升企业精细化管理水平；
3. 资源集成：牵手全球领先资源供应商，打造全新的资源聚合平台，提供最合适的差旅方案；
4. 服务保障：安途商旅拥有7*24小时多语种呼叫中心、全国50多个机场柜台、专业的客户经理团队，可以全方位保障客户出行无忧。
 
更多信息请搜索“安途商旅”
企业官网：http://vip.easytravel.com.cn
服务热线：400-876-8999
联系邮箱：btservice@hnair.com','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/dc/66/ed/dc66ed27-65f2-708b-3d57-6b1362d4cf12/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/c5/a9/89/c5a9893f-1e5a-665d-a629-0f2272d9e6db/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/1b/79/f8/1b79f8bb-c350-1c02-5200-1fac82e66042/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/39/a8/a6/39a8a61b-9fab-eb20-1659-871533d71537/source/392x696bb.jpg'']','[u''\u5546\u52a1'']','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/76/f0/41/76f04137-736d-ee74-59cf-3bcc19adb72d/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/76/f0/41/76f04137-736d-ee74-59cf-3bcc19adb72d/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/76/f0/41/76f04137-736d-ee74-59cf-3bcc19adb72d/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E5%AE%89%E9%80%94%E5%95%86%E6%97%85/id1413593416?mt=8&uo=4','ios','2018-08-17','393078584'),
 (39,'1053793621','超市订货上掌合！
掌合商城App是掌合天下为广大中小型超市业主提供便捷订货的手机客户端，让用户随时随地便捷订货！

【产品简介】
掌合商城iPhone版是专门为iPhone、iPod touch用户打造，具有商品搜索/浏览、商品购买、在线支付、订单查询等功能，为超市业主提供简单、便捷的移动订货体验。

【功能特色】
1.限时特价尽在订货会！掌合订货会专区汇集诸多品类商品，进行限时特价促销活动，为广大超市业主提供更多优惠。
2.金牌供货商，品质有保障！掌合平台联合全国各地的优质供货商，为超市用户提供有质量保证的充足货源。
3.快速订货，操作方便！超市用户浏览的商品可直接加入进货单，便捷易用。
4.掌合服务站遍布全国各大省市，以地域垂直性的服务整合具有地方特色的商品种类，更好的为当地超市和广大消费者提供服务。','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/f2/d0/63/f2d06337-2d4e-795a-63a7-ac930d3999f0/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple125/v4/74/c1/a0/74c1a07f-20ac-31bb-145e-abe454caea26/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/f4/6d/88/f46d88e9-f379-6886-a1a9-5212e5599954/source/392x696bb.jpg'', u''https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/9d/11/e1/9d11e141-da61-6693-d4c5-c3932a9b9275/source/392x696bb.jpg'']','[u''\u751f\u6d3b'', u''\u8d2d\u7269'']','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/08/88/3d/08883d76-1796-af81-eff8-589fb2ff4c2e/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/08/88/3d/08883d76-1796-af81-eff8-589fb2ff4c2e/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/08/88/3d/08883d76-1796-af81-eff8-589fb2ff4c2e/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%8E%8C%E5%90%88%E5%95%86%E5%9F%8E/id1053793621?mt=8&uo=4','ios','2018-09-10','1053793620'),
 (40,'1067772229','掌合供货App是掌合天下为广大中小型供货商业主提供便捷订货的手机客户端，让用户随时随地便捷处理业务！

【产品简介】
掌合供货iPhone版是专门为iPhone、iPod touch用户打造，具有提现、商品管理、订单管理、账单查询等功能，为供货商业主提供简单、便捷的移动管理体验。

【功能特色】
1.便捷的订单管理功能，供货商用户随时随地可以对超市的订单进行管理，
2. 贴心的商品管理功能，用户可以随时随地对商品进行修改。
3. 账本余额统计，使我们的收入明细更加直观。
4.掌合服务站遍布全国各大省市，以地域垂直性的服务整合具有地方特色的商品种类，更好的为当地超市提供服务。','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/8b/64/39/8b643993-8ea3-0772-3999-9d91075463c8/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple125/v4/96/5f/dc/965fdc29-7edd-b498-cc11-4f2bbd582912/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple125/v4/3a/47/44/3a4744e7-8e1a-8483-3038-cc14500d4591/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/b0/26/78/b02678d3-9544-7db0-e86c-f4b564535ea4/source/392x696bb.jpg'']','[u''\u751f\u6d3b'']','https://is4-ssl.mzstatic.com/image/thumb/Purple125/v4/4d/06/12/4d0612df-f1a8-c1b8-8350-86ea10cc9a30/source/60x60bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple125/v4/4d/06/12/4d0612df-f1a8-c1b8-8350-86ea10cc9a30/source/100x100bb.jpg','https://is4-ssl.mzstatic.com/image/thumb/Purple125/v4/4d/06/12/4d0612df-f1a8-c1b8-8350-86ea10cc9a30/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%8E%8C%E5%90%88%E4%BE%9B%E8%B4%A7%E5%95%86/id1067772229?mt=8&uo=4','ios','2018-09-10','1053793620'),
 (41,'1171648757','掌合佣兵是针对掌合天下超市进货平台的业务员量身打造的一款移动应用，只有入驻掌合天下的供货商才可以添加和管理自己名下的业务员，业务员才能登录本应用。登录本应用可以随时随地的拜访超市客户，并支持帮助超市代下单，快速理货，下单，配送查看自己的业绩。
 特色功能:
 【客户】显示本业务员名下所有客户，支持搜索，直接在名字后面点击代下单即可完成下单 。
【订单】显示本业务员名下超市自主下单和业务员代下单数据，可以随时查看了解订单最新状态。
【首页】显示本业务员的个人新和业绩汇总。','[u''https://is5-ssl.mzstatic.com/image/thumb/Purple117/v4/d9/68/7d/d9687df2-6309-2255-a6d7-e3ea9b204529/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple117/v4/00/89/8c/00898c6b-956c-1c0b-3758-8edf010f41b2/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple117/v4/03/08/bc/0308bc6a-d436-8eb2-25c1-b663ff4d1894/source/392x696bb.jpg'', u''https://is2-ssl.mzstatic.com/image/thumb/Purple127/v4/f3/37/bb/f337bb3e-29dc-eaf4-5977-59ef7874e2ce/source/392x696bb.jpg'']','[u''\u5de5\u5177'', u''\u751f\u6d3b'']','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/5c/5a/42/5c5a4261-8a1f-7d80-9bd3-602c5ce2b973/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/5c/5a/42/5c5a4261-8a1f-7d80-9bd3-602c5ce2b973/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/5c/5a/42/5c5a4261-8a1f-7d80-9bd3-602c5ce2b973/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%8E%8C%E5%90%88%E4%BD%A3%E5%85%B5/id1171648757?mt=8&uo=4','ios','2018-09-10','1053793620'),
 (42,'1392209335','掌合好管家APP是掌合好管家ERP的 APP客户端。实现与客户端的无缝对接与数据实时同步，实现一账号多终端使用；
帮助管理层随时随地掌控企业运营状况
协助销售人员在外实时拜访、跟进客户、随地开单
基本功能包括
代客下单（销售开单、客户回款开单）
销售外勤（员工签到、客户分布）
报表查询（历史订单查询、回款查询、业绩查询）','[u''https://is2-ssl.mzstatic.com/image/thumb/Purple115/v4/c9/80/41/c980414a-9790-cb98-108f-852972b0b916/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple125/v4/0c/f9/c3/0cf9c3e9-6802-f017-678f-2e5b8a18e50d/source/392x696bb.jpg'', u''https://is3-ssl.mzstatic.com/image/thumb/Purple115/v4/30/11/ee/3011ee8f-5358-8dfb-7c4f-0423d2c6ce4e/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple125/v4/86/d5/a0/86d5a09f-14b6-5526-b535-79e9ab332bd3/source/392x696bb.jpg'', u''https://is1-ssl.mzstatic.com/image/thumb/Purple125/v4/65/71/7c/65717c41-7067-889b-3fed-6e259a02ba65/source/392x696bb.jpg'', u''https://is4-ssl.mzstatic.com/image/thumb/Purple125/v4/48/23/17/482317a0-23b0-8567-c08e-92e0093dd89e/source/392x696bb.jpg'']','[u''\u5546\u52a1'']','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/82/93/d1/8293d122-a753-808a-135b-3da0a88c84a8/source/60x60bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/82/93/d1/8293d122-a753-808a-135b-3da0a88c84a8/source/100x100bb.jpg','https://is1-ssl.mzstatic.com/image/thumb/Purple128/v4/82/93/d1/8293d122-a753-808a-135b-3da0a88c84a8/source/512x512bb.jpg','https://itunes.apple.com/cn/app/%E6%8E%8C%E5%90%88%E5%A5%BD%E7%AE%A1%E5%AE%B6/id1392209335?mt=8&uo=4','ios','2018-09-10','1053793620');
CREATE TABLE IF NOT EXISTS `updinfo` (
	`id`	INTEGER NOT NULL,
	`trackId`	VARCHAR ( 16 ),
	`trackCensoredName`	VARCHAR ( 32 ),
	`version`	VARCHAR ( 16 ),
	`releaseDate`	DATE,
	`releaseNotes`	TEXT,
	FOREIGN KEY(`trackId`) REFERENCES `apps`(`trackId`),
	PRIMARY KEY(`id`)
);
INSERT INTO `updinfo` (id,trackId,trackCensoredName,version,releaseDate,releaseNotes) VALUES (1,'989680116','聚宝匯-海航集团旗下互联网金融平台','7.2.4','2018-07-04','性能优化体验更流畅'),
 (2,'588257595','海航会-HNA CLUB','4.1.1','2016-02-10','1、  实时显示退改签规则，真正无坑购票
2、  升级消息推送，特价优惠及时掌握
3、  修复部分BUG，使用更流畅'),
 (3,'1180565266','三人行学堂','1.0.6','2017-12-15','本次更新
-UI升级：培训班、课程、直播、我的等页面比以前更清晰好用了
-音频课程：APP端支持音频类课件的播放，支持首页插件播放/锁屏播放等多种方式
-学习地图：体系化的学习路径，排行榜、结业证书、关卡设计，学习激励新玩法
-首页展示：首页栏目提供增加“更多”、“换一批”功能'),
 (4,'1181770034','游鱼UYU','2.2.0','2017-08-16','【changelog】
1.新增“不喜欢”功能，一键屏蔽，不感兴趣的文章或来源，再也不会出现了！
2.新增评论文章功能；
3.优化了搜索流程，找信息更便捷！
4.踩死了一些小bug，提高了响应速度，整体性能更赞了。

有任何建议或意见，欢迎添加游小鱼的微信号：tripuyu'),
 (5,'1252195473','New.Do','1.4.3','2018-07-20','1、APP客户端短信接口升级；
2、会议室功能入口中电话会议和预约会议卡片列表界面调整优化，电话会议卡片支持手动删除；
3、优化了安全登录的界面和操作等问题。'),
 (6,'1174744295','国民小黑卡','2.0.3','2018-01-26','1 bug修复;'),
 (7,'961509135','宠爱-宠物社交','1.0','2015-02-14',NULL),
 (8,'1137846043','游匣','1.0','2016-09-02','此更新已使用 Apple 最新的签名证书签名。未包括任何新功能。'),
 (9,'934371414','HNA WiFi','2.1.1','2015-01-02','UI界面全新改版，交互方式更加人性化，wifi认证逻辑更加简化，给用户带来更好的体验。'),
 (10,'927826314','懒虫闹钟','1.0','2014-11-06',NULL),
 (11,'492164733','海商城','1.00','2012-02-10',NULL),
 (12,'1190820989','聚宝乐','1.6','2017-06-14','1、界面布局全新优化，就是要美美哒
2、四类通知：产品预告、理财动态、到期提醒、等级权益，给您贴心的理财提醒
3、新增活动位，会有惊喜活动等着你参与哦'),
 (13,'1316833028','海航体检中心','1.0.2','2018-03-01','1.修复bugs；
2.新增升级提醒；
3.优化主界面显示。'),
 (14,'1253795272','有美','1.0','2017-08-23',NULL),
 (15,'955684531','渤海信托','1.6','2018-01-02','1. UI全面升级
2.新用户开放注册'),
 (16,'1040453672','渤海信托移动审批','1.0.0','2015-10-11',NULL),
 (17,'1181791590','渤海信托鲲鹏理财师','1.40','2018-01-04','1. UI全面升级
2.增加佣金功能'),
 (18,'1259017864','渤海保呗','2.7.3','2018-07-23','一、新功能上线
1、在线理赔案件超千元增加了短信、站内信寄送原始票据提醒
2、在线理赔案件超千元增加了查看票据功能
3、在线理赔人脸识别失败后可通过身份证号进行识别
二、功能与界面优化
1、优化在线理赔其他体验
2、优化健康计步积分记录'),
 (19,'1080256088','掌上渤海','1.2','2017-03-16','1.2版本更新内容如下：
1、修复公文审批异常闪退问题。'),
 (20,'1174626593','飞行加','2.6.2','2018-07-11','优化了实名认证功能，操作更便捷，帮助用户快速完成实名认证，享受每周三机票秒杀权益，还有网上值机等特权，快下载！'),
 (21,'517198355','国付宝','2.5.4','2018-07-18','修复已知bug'),
 (22,'1333435717','国付宝(商户版)','1.0.2','2018-06-29','调整版式细节及修改已知BUG'),
 (23,'830285988','易生支付-easypay','2.6.4','2017-10-10','修复无法登陆的问题'),
 (24,'1001839898','易生支付商户版','2.3','2017-01-18','增加收款明细，实收、优惠等条目一目了然'),
 (25,'1138173881','曲江文旅','1.0','2016-09-02','此更新已使用 Apple 最新的签名证书签名。未包括任何新功能。'),
 (26,'1295543693','收款啦-易生支付商户端','1.1.1','2017-11-30','版本优化'),
 (27,'465617429','海南航空（海航官方版）','6.13.0','2018-07-17','【预约选座】“得不到的永远在骚动，提前选座的都有恃无恐”
提前选定心仪座位，助您出行舒适顺心
【热门目的地】“我想要带你去浪漫的土耳其，然后一起去东京和巴黎”
网红景点任君挑选，助您发现旅行灵感
【生日礼包】“也许生日是一种解药，也是我现在所领到的礼包”
每月8日会员日，领取您的专属生日礼包
还有：
1、军警残客票销售
2、新版餐食预订
3、退票费发票申请
4、营销活动精准推荐
5、消息推送+消息中心改版
6、保险购买流程优化
7、航班动态操作优化
8、会员日购票提醒
9、兑换流增加显示互售航司中文名
10、机票查询条件优化
11、电子登机牌办理流程优化
更多功能，等你去探索，快快升级吧！'),
 (28,'1086528245','福州航空','4.0.7','2018-07-13','修复已知bug'),
 (29,'1277389161','天津航空官方应用','1.2.02','2018-07-06','修复已经问题'),
 (30,'1190196575','大集金服','1.2.1','2018-07-18','1、线下充值方式变更，请下载最新版本查看具体说明
2、优化流程，提升使用体验'),
 (31,'1042174600','前海航交所','3.4.7','2018-07-18','优化用户体验'),
 (32,'1059333660','海航通信','4.3.4','2018-07-06','优化了部分bug。'),
 (33,'1127692615','海游出境通','1.1','2016-08-05','1，优化激活套餐，设置APN等操作。
2，优化部分界面显示。
3，修复所有已知问题。'),
 (34,'1288466617','凡拨','2.0.2','2018-03-12','1、新增特惠邀请码；
2、修复连接超时等一些已知bug。'),
 (35,'763281937','首都航空（首航官方版）','3.6.9','2018-07-19','1、新增常用乘机人功能。
2、修复已知bug，提升体验。'),
 (36,'1060917397','空空-当空乘、选空乘、就用空空','1.8.3','2017-02-09','1.修复相关漏洞。
2.完善用户体验。'),
 (37,'989680116','聚宝匯-海航集团旗下互联网金融平台','7.2.5','2018-07-25','修复已知问题，提高稳定性'),
 (38,'1259017864','渤海保呗','2.7.4','2018-07-26','一、新功能上线
1、产品投保流程全新上线'),
 (39,'1277389161','天津航空官方应用','1.2.03','2018-07-30','1.优化注册流程 2.完善提示信息'),
 (40,'1042174600','前海航交所','3.4.8','2018-07-26','相关产品页面更新，投资、赎回等操作优化'),
 (42,'1316833028','海航体检中心','1.0.5','2018-08-01','1.新增短信注册登陆和验证功能；
2.新增体检须知和体检流程栏目。'),
 (44,'1174626593','飞行加','2.7.0','2018-08-01','1、机+酒自由行套餐来了！让你的出行更省时、更省心，超多款5星级酒店特价享受，快来体验！
2、优化了退改签规定展示页面。'),
 (46,'1190196575','大集金服','1.2.2','2018-08-01','1、更新客服电话。
2、优化线下充值提示。'),
 (47,'989680116','聚宝匯-海航集团旗下互联网金融平台','7.2.6','2018-08-07','修复已知问题，提高稳定性'),
 (48,'1252195473','New.Do','1.4.4','2018-08-03','1、调整优化了督办列表的展示效果；
2、对微应用中的头像插件进行了优化；
3、对使用中的断网状态提示等进行了优化。'),
 (49,'1259017864','渤海保呗','2.7.5','2018-08-06','一、新功能上线
1、新上线重疾险专题
二、功能与界面优化
1、适配ios11
2、优化产品投保流程
3、优化理赔银行卡选择界面'),
 (50,'763281937','首都航空（首航官方版）','3.7.0','2018-08-08','1、修复已知bug。'),
 (51,'1042174600','前海航交所','3.5.0','2018-08-09','优化用户体验'),
 (52,'1059333660','海航通信','4.3.6','2018-08-09','1）修复了一些已知BUG；
2）程序员小哥哥彻夜加班，只为给您最好的体验；

ヾ(@^▽^@)ノ'),
 (53,'989680116','聚宝匯-海航集团旗下互联网金融平台','7.2.7','2018-08-14','修复已知问题，提高稳定性'),
 (54,'1290001245','嗨途-提供更贴心的旅行服务','3.1.4','2018-08-10','1.算法优化，推荐心水的产品更精准！
2.支持199手机号注册啦！快呼唤小伙伴来使用嗨途吧！'),
 (55,'1413593416','安途商旅','1.0.0','2018-08-14',NULL),
 (56,'1259017864','渤海保呗','2.7.6','2018-08-17','一、新功能上线
1、新上线产品“渤海人寿爱心保终身重大疾病保险”
2、新上线“简单i重疾险”专题
3、购买保险增加意见反馈功能
二、功能与界面优化
1、优化极光消息与站内信体验'),
 (57,'1174626593','飞行加','2.7.2','2018-08-16','针对APP实名认证、增值服务产品购买、机票退改规定进行了全方位优化，让购票更便捷，使用更流畅，快来体验！'),
 (58,'1059333660','海航通信','4.4.0','2018-08-17','1）适配 iPhone X ，让刘海飘起来；
2）修复了一些已知BUG；
3）程序员小哥哥彻夜加班，只为给您最好的体验；

ヾ(@^▽^@)ノ'),
 (59,'1290001245','嗨途-提供更贴心的旅行服务','3.2.0','2018-08-21','1.新增特价机票预订条款，搜索结果页显示优化。
2.酒店频道全新改版，使用体验更佳！'),
 (60,'1259017864','渤海保呗','2.7.7','2018-08-23','一、新功能上线
1、新上线产品“渤海人寿母婴安康保障计划”'),
 (61,'465617429','海南航空（海航官方版）','6.13.3','2018-08-21','【预约选座】“得不到的永远在骚动，提前选座的都有恃无恐”
提前选定心仪座位，助您出行舒适顺心
【热门目的地】“我想要带你去浪漫的土耳其，然后一起去东京和巴黎”
网红景点任君挑选，助您发现旅行灵感
【生日礼包】“也许生日是一种解药，也是我现在所领到的礼包”
每月8日会员日，领取您的专属生日礼包
还有：
1、军警残客票销售
2、新版餐食预订
3、退票费发票申请
4、营销活动精准推荐
5、消息推送+消息中心改版
6、保险购买流程优化
7、航班动态操作优化
8、会员日购票提醒
9、兑换流增加显示互售航司中文名
10、机票查询条件优化
11、电子登机牌办理流程优化
更多功能，等你去探索，快快升级吧！'),
 (62,'1288466617','凡拨','2.0.5','2018-08-22','1、修复一些已知bug。
2、优化用户体验。'),
 (63,'1277389161','天津航空官方应用','1.2.05','2018-08-30','1.变更国际退改签规则 2.全新购票页面展示'),
 (64,'1290001245','嗨途-提供更贴心的旅行服务','3.3.0','2018-09-01','1.新增行程功能，按日期显示机票、酒店等订单，查找更方便！
2.新增行程管理和智能推荐，想要的服务一键预订！
3.优化服务通知功能，优惠券到期提醒、秒杀产品提醒……通通不错过！'),
 (65,'1252195473','New.Do','1.4.5','2018-08-31','1、O365云盘部分用户使用权限开通，支持指定目录搜索；
2、Newbot入口新增New.Do公告的推送和显示功能；
3、修复优化其它产品问题。'),
 (66,'1259017864','渤海保呗','2.7.9','2018-09-07','一、功能与界面优化
1、优化银行卡绑卡体验'),
 (67,'1174626593','飞行加','2.7.4','2018-09-05','新增乘机证件类型：港澳台居民居住证／外国人永久居民身份证'),
 (68,'1086528245','福州航空','4.0.9','2018-09-07','修复已知bug'),
 (69,'1042174600','前海航交所','3.5.1','2018-09-06','优化用户体验'),
 (70,'1288466617','凡拨','3.0.0','2018-08-31','有新版本啦！
1. 你可以看到国内和国际的资费信息
2. 还能看到你的通话记录及话单详情
3. 给凡拨进行充值，享受优质服务
4. 将凡拨推荐给好友，让更多人使用

ヾ(@^▽^@)ノ'),
 (71,'1053793621','掌合商城','4.2.6','2018-07-28','增加多个活动广告入口.
优化体验'),
 (72,'1067772229','掌合供货商','2.0.3','2018-07-06','性能优化与缺陷修复'),
 (73,'1171648757','掌合佣兵','1.2.7','2018-01-04','增加审核身份有效期验证
完善用户体验'),
 (74,'1392209335','掌合好管家','1.0.1','2018-08-14','新增支持一品多味下单
新增销售退货功能
新增销售换货功能
新增销售退货功能'),
 (75,'1413593416','安途商旅','1.0.1','2018-09-12','修复BUG : 国内机票预定联系人姓名长度限制问题处理'),
 (76,'1174626593','飞行加','2.7.10','2018-09-12','修复订单确认页面乘机人信息显示不全问题'),
 (77,'465617429','海南航空（海航官方版）','6.14.0','2018-09-11','【新增功能及优化】
【国际会员日折上折】“确认过眼神，是关注海航会员日活动的人”
尽情享受，每月8日会员狂欢日
【随行儿童单独值机】“最美的不是下雨天，而是和你坐在一起欣赏下雨天”
安心落意，就要和家人坐在一起
【付费行李提前购】“超级实用的技能了解一下”
早订舒适，每一次出发都省时省心
还有：
1、支持兑换多人及儿童国际固定舱、多等级
2、金鹏贵宾资格挑战赛活动报名
3、登机口升舱支持分舱定价和国际航班
4、预订流高端舱位推荐
5、价格日历显示农历节假日
6、兑换票出票及订单取消增加邮件通知
7、城市机场列表增加定位城市 
8、退改费用展示高、中、低
等等一系列的优化~
【近期更新】
1、预约选座，提前选定心仪座位
2、热门目的地介绍和推荐
3、新增伤残军人、警察优惠购票
4、每月8日会员日生日礼包领取
5、支持海南航空及旗下多家航司的现金机票互售和兑换
6、新版餐食预订，提前预订免费机上美味餐食
若您有任何疑问或建议，请在APP相应页面截图并点击反馈，系统将自动跳转到“意见反馈”模块，我们将对您的问题进行专项处理。'),
 (78,'763281937','首都航空（首航官方版）','3.7.2','2018-09-12','1、增加接送机功能
2、优化结构，使用更流畅
3、修复已知bug'),
 (79,'989680116','聚宝匯-海航集团旗下互联网金融平台','7.2.8','2018-09-13','修复已知问题，提高稳定性'),
 (80,'1290001245','嗨途-提供更贴心的旅行服务','3.3.1','2018-09-14','行程频道大升级！新增一大波一键预订功能！
1.一键预订返程机票和机上餐食，身份证号、航班号等乘机人信息通通免填写！
2.一键预订酒店和一键导航功能，省去选择城市、入住日期等繁琐手续，出发去酒店更方便！'),
 (81,'1259017864','渤海保呗','2.8.0','2018-09-14','一、新功能上线
1、续期用户增加站内信、极光交费提醒
2、知识页面全新视觉设计
3、理赔服务新上线理赔须知页面
二、功能与界面优化
1、提升欢迎页访问体验'),
 (82,'1277389161','天津航空官方应用','1.2.06','2018-09-17','1.新产品体系上线
2.增加金鹏积分展示
3.国际退改手续费变更
4.增加港澳台、外国人永远居留证件购票和值机'),
 (83,'1059333660','海航通信','4.5.0','2018-09-14','1）优化产品体验，让你感受我们细致的服务；
2）修复了一些已知BUG；
3）程序员小哥哥彻夜加班，只为给您最好的体验；
ヾ(@^▽^@)ノ'),
 (84,'1288466617','凡拨','3.1.1','2018-09-14','1）点击相应的国家资费后可以自动加上区号
2）修复了线路不稳定的问题
3）优化产品体验，让你感受我们细致的服务；
4）修复了一些已知BUG；
ヾ(@^▽^@)ノ'),
 (85,'989680116','聚宝匯-海航集团旗下互联网金融平台','7.2.9','2018-09-25','修复已知问题，提高稳定性'),
 (86,'1252195473','New.Do','1.5.0','2018-09-22','1、产品安全整体优化和升级，支持加密；
2、O365云盘部分用户使用权限开通，支持微软文件的转存；
3、修复优化产品其它问题。');
 CREATE TABLE IF NOT EXISTS `tags` (
	`tagId`	INTEGER NOT NULL,
	`tagName`	VARCHAR ( 32 ),
	PRIMARY KEY(`tagId`)
);
INSERT INTO `tags` (tagId,tagName) VALUES (1,'newdo'),
 (2,'海南航空'),
 (3,'易生支付'),
 (4,'国付宝'),
 (5,'西部航空');
 CREATE TABLE IF NOT EXISTS `projects` (
	`proId`	INTEGER NOT NULL,
	`proName`	VARCHAR ( 32 ),
	PRIMARY KEY(`proId`)
);
INSERT INTO `projects` (proId,proName) VALUES (6,'测试1'),
 (8,'海航重点业务app');
 CREATE TABLE IF NOT EXISTS `proreltags` (
	`id`	INTEGER NOT NULL,
	`tagId`	INTEGER,
	`proId`	INTEGER,
	PRIMARY KEY(`id`),
	FOREIGN KEY(`tagId`) REFERENCES `tags`(`tagId`),
	FOREIGN KEY(`proId`) REFERENCES `projects`(`proId`)
);
INSERT INTO `proreltags` (id,tagId,proId) VALUES (4,1,6),
 (7,3,6),
 (8,5,6),
 (13,2,8);
 CREATE TABLE IF NOT EXISTS `tagrelapps` (
	`id`	INTEGER NOT NULL,
	`tagId`	INTEGER,
	`trackId`	INTEGER,
	`fav`	BOOLEAN,
	FOREIGN KEY(`trackId`) REFERENCES `apps`(`trackId`),
	PRIMARY KEY(`id`),
	FOREIGN KEY(`tagId`) REFERENCES `tags`(`tagId`)
);