#Ben Rogers
#06/27/15
#theOdinProject.com

def stock_picker stock
	buy_day = 0 
	sell_day = 0
	buy_price = 0
	sell_price = 0 
	max_profit = 0

	#must buy first
	stock.each_with_index do |buy, i|
		#check every index to the right of the "bought" index
		stock[i+1..stock.length-1].each_with_index do |sell, j|
			if (sell - buy) > max_profit
				max_profit = (sell - buy)
				buy_day = i
				#i + 1 = earliest possible sell_day
				sell_day = (i + 1) + j 
				buy_price = buy
				sell_price = sell
			end
		end
	end
	puts "[#{buy_day}, #{sell_day}] for a profit of $#{sell_price} - $#{buy_price} = $#{max_profit}"
	return [buy_day, sell_day]
end

stock = [17,3,6,9,15,8,6,1,10]
buy_sell_dates = stock_picker(stock)
