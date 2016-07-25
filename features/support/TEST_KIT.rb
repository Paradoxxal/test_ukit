# encoding: UTF-8
module TEST_KIT

	def fill_in(field, text) # заполнение полей
		element = find ".ul-tf-input[placeholder='#{field}']"
		element.set text
	end

	def button_click(caption) # поиск и нажаите по кнопке
		element = find_button caption
		element.click
	end

	def check_user_name(user_name) # потдвержение авторизации
		element = find '.w-user__name'
		expect(element).to have_text user_name
	end

	def logout #разавторизация
		element = find ".pull-right[title='Выйти']"
		element.click
	end

	def check_soc_net(caption) # проверка работоспособновсти авторизации через соц сети
		matcher = {'ВКонтакте'=> 'vkontakte', 'Facebook' => 'facebook', 'uID.me' => 'ucoz', 'Яндекс' => 'yandex', 'Google+' => 'google', 'Одноклассники' => 'odnoklassniki', 'Twitter' => 'twitter', 'Disqus' => 'disqus', 'LinkedIn' => 'linkedin'}
		# hash matcher стаивт в соотвествие атрибут с отображемым названием кнопки
		element = find ".ul-button[data-soc='#{matcher[caption]}']"
		expect(element).to have_text caption
		new_window = window_opened_by { element.click } # нажимаем на кнопку авторизации через соц сеть
		expect(new_window).to exist # проверям что окно открылось
		new_window.close
	end

	def full_list_soc_net # вывод полного списка соц сетей
		find('.auth-soc-others-open-text').click
	end

	def check_erorr(text) # проверка теста ошибок аторизации
		find '.node', :text => text
	end

	def heck_disable_btn(caption) #  проверка, что кнопка недоступна
	element = find '.ul-button', text: caption
	expect(element.disabled?).to should_be truthy
	end
end
