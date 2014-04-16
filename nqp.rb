
class NQueens

	@size = 0;
	@result = nil;
	@num_sol = 0;

	def initialize(size)
		@size = size;
		@result = Array.new
		@num_sol = 1;
		placeQueen(0, 0)
	end


	def showSolution
		board = Array.new(@size) { Array.new(@size) { |i| '.' }}
		print "Solution : #{@num_sol} "
		@result.each { |e| print e  }
		puts
		@size.times do |i|
			@size.times do |j|
				if @result.include?([i,j])
					print 'Q '
				else
					print '. '
				end
			end
			puts
		end
		@num_sol = @num_sol + 1
	end

	def isSafe(x, y)
		if x > @size - 1 or y > @size - 1
			return false
		end

		@result.each do |e|
			# not on the same line
			if e[1] == y
				return false
			end

			# simple way is to check for slope not being 1 or -1
			if (y-e[1].to_f).abs/(x-e[0]).abs == 1
				return false
			end
		end
		return true
	end

	def placeQueen(i, j)
		if i > @size - 1 and j > @size - 1
			return
		elsif @result.length == @size || j >= @size
			showSolution if @result.length == @size
			e = @result.pop
			return if e.nil?
			placeQueen(e[0], e[1] + 1)
		end

		if isSafe(i, j)
			@result.push([i,j])
			placeQueen(i + 1, 0)
		else
			placeQueen(i, j + 1)
		end
	end

end

NQueens.new(4)