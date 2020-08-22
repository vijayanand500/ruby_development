# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
    neighbors = [[1,0], [1,-1], [0,-1], [-1,-1], [-1,0], [-1,1], [0,1], [1,1]]
    row_length = board.length
    col_length = board[0].length
    for row in (0...row_length)
        for col in (0...col_length)
            live_neighbors = 0
            for neighbor in neighbors
                r = row + neighbor[0]
                c = col + neighbor[1]
                if (r < row_length and r >= 0) and (c < col_length and c >= 0) and (board[r][c]).abs == 1
                    live_neighbors += 1
                end
            end
            if board[row][col] == 1 && (live_neighbors < 2 || live_neighbors > 3)
                board[row][col] = -1 
            end
            if board[row][col] == 0 && live_neighbors == 3
                board[row][col] = 2
            end
        end
    end
    for row in (0...board.length)
        for col in (0...board[0].length)
            if board[row][col] > 0
                board[row][col] = 1
            else
                board[row][col] = 0
            end
        end
    end
    return board
end

def print_grid(board)
    for row in board
        print("#{row}\n")
    end
end

state = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
print("Number of rounds: \n")
rounds = gets 

for each in (0...rounds.to_i)
    print("\nIteration number - #{each}\n")
    state = game_of_life(state)
    print_grid(state)
end