define
	pages: [
		level: 0
		question: 'Для кого ви шукаєте подарунок?'
		answer: [
			'Чоловік'
			'Жінка'
		]
		next: [1, 1]
	,
		level: 1
		question: 'Хто для вас ця людина?'
		answer: [
			'Подруга/друг'
			'Брат/сестра'
			'Батьки'
			'Чоловік/дружина'
		]
		next: [2, 2, 2, 2]
	,
		level: 2
		question: 'Який тип подарунку ви шукаєте?'
		answer: [
			'Особистий'
			'Щось для дому'
		]
		next: [3, 4]
	,
		level: 3
		question: 'Який стиль життя цієї людини?'
		answer: [
			'Мандрівник'
			'Party guy'
			'Workaholic'
			'Home boy'
		]
		next: [5, 5, 5, 5]
	,
		level: 3
		question: 'Який стиль життя цієї людини?'
		answer: [
			'Любитель чистоти'
			'Гурман'
			'Поціновувач кіно'
			'Спортсмен'
		]
		next: [6, 6, 6, 6]
	,
		level: 4
		question: 'Що подобається найбільше цій людині?'
		answer: [
			'Фото'
			'Музика'
			'Відео'
		]
		next: [7, 7, 7]
	,
		level: 4
		question: 'Яка кількість людей живуть разом з одержувачем подарунка?'
		answer: [
			'Живе самостійно'
			'Сім\'я / більше 3 осіб'
			'Пара'
		]
		next: [7, 7, 7]
	,
		level: 5
		question: 'Наш подарунок-порада для вас:'
		answer: [
			'Телевізор'
			'Мікрохвильова піч'
			'Холодильник'
		]
	]

	answers:
		'aaa': [0, 1]
		'aac': [0]
		'aca': [1, 4]
		'abb': [2]
		'adb': [2]
		'acc': [3]
		'acb': [3, 6]
		'ada': [4]
		'adc': [5]
		'aab': [6]
		'bbb': [7]
		'bdb': [7]
		'bba': [8]
		'bac': [9, 11]
		'bdc': [9]
		'bab': [10]
		'baa': [10]
		'bcb': [10]
		'bca': [10, 12]
		'bbc': [11]
		'bda': [12]
		'bcc': [13]

	categorys: [
		'Smartphones'
		'Pocket Photo'
		'Audio'
		'Laptops'
		'Monitors'
		'TVs'
		'Tablets'
		'Fridges'
		'Microwave ovens'
		'Vacuum cleaner'
		'Washing machines'
		'Dish washers'
		'Conditioners'
		'Home Cinema / Video'
	]
