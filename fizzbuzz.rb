array = [*1..100]

def fizzbuzz(array)
  array.each do |n|
    if n%3 == 0 && n%5 == 0
      puts "FizzBuzz"
    elsif n%3 == 0 && n%5 != 0
      puts "Fizz"
    elsif n%5 == 0 && n%3 != 0
      puts "Buzz"
    else
      puts n
    end  
  end
end

fizzbuzz(array)