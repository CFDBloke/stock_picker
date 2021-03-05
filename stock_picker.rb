def stock_picker(stock_array)
    
    profit_arrays = []

    # Create an array of profit arrays where the index of the stock array is subtracted from all other values in the stock array
    stock_array.each { |buy_at| profit_arrays.push(stock_array.map { |sell_at| sell_at - buy_at }) }

    # Discount all values that appear before the zero value in each profit array by setting the value to -2
    profit_arrays.map do |profit_array|
        profit_array.fill(-2, 0..(profit_array.index(0)-1)) unless profit_array[0] == 0
    end

    # Select the profit array which has the highest profit in it out of all the profit arrays
    selected_profit_array = profit_arrays.reduce() do |max_profit_array, profit_array|
        if max_profit_array.max < profit_array.max then max_profit_array = profit_array end
        max_profit_array
    end

    # Output the buy/sell array which indicates the buy and sell points
    buy_sell_array = [selected_profit_array.index(0),selected_profit_array.index(selected_profit_array.max)]

end

p stock_picker([17,3,6,9,15,8,6,1,10,85])