require "minitest/autorun"
require_relative 'new_board.rb'

 class TestTicTacToeBoard < Minitest::Test

     def test_create_new_3x3_board
         board = Board.new(3)
         assert_equal(["","","","","","","","",""], board.grid)
     end

     def test_create_new_4x4_board
         board = Board.new(4)
         assert_equal(["","","","","","","","","","","","","","","",""], board.grid)
     end

     def test_create_new_27x27_board
         board = Board.new(27)
         assert_equal(729, board.grid.count)
     end

    def test_for_valid_input_3x3_board
        board = Board.new(3)
        assert_equal(false, board.valid_input?("11"))
        assert_equal(true, board.valid_input?("5"))
    end

    def test_for_valid_input_4X4_board
        board = Board.new(4)
        assert_equal(false, board.valid_input?("20"))
        assert_equal(true, board.valid_input?("5"))
    end

    def test_for_valid_input_9x9_board
        board = Board.new(9)
        assert_equal(false, board.valid_input?("100"))
        assert_equal(true, board.valid_input?("5"))
    end

    def test_for_occupied_space_3X3_board
        board = Board.new(3)
        board.grid = ["X","O","","","","","","",""]
        assert_equal(false, board.valid_space?(1))
        assert_equal(true, board.valid_space?(4))
    end

    def test_for_occupied_space_4x4_board
        board = Board.new(4)
        board.grid = ["X","","","","","O","","","","","X","","","","",""]
        assert_equal(false, board.valid_space?(0))
        assert_equal(true, board.valid_space?(4))
    end

    def test_for_occupied_space_5x5_board
        board = Board.new(5)
        board.grid = ["X","","","","","O","","","","","X","","","","","","","","","O","","","","","X"]
        assert_equal(false, board.valid_space?(0))
        assert_equal(true, board.valid_space?(24))
    end

    def test_for_update_board_turn_2_3x3_board
        board = Board.new(3)
        board.grid = ["X","","","","","","","",""]
        board.update(1, "O")
        assert_equal(["X","O","","","","","","",""], board.grid)
    end

    def test_for_update_board_turn_1_3x3_board
        board = Board.new(3)
        board.grid = ["","","","","","","","",""]
        board.update(0, "X")
        assert_equal(["X","","","","","","","",""], board.grid)
    end

    def test_empty_board_9_grid
        board = Board.new(9)
		assert_equal(Array.new(81, ""), board.grid)
	end	

    def test_empty_board_4_grid
        board = Board.new(4)
        assert_equal(Array.new(16, ""), board.grid)
    end

    def test_for_full_board_3x3_board
        board = Board.new(3)
        board.grid = ["X","O","O","X","O","X","O","X","O"]
        assert_equal(true, board.full_board?)
    end

    def test_partial_3x3_board_returns_false
        board = Board.new(3)
        board.grid = ["X","O","","","","","","",""]
        assert_equal(false, board.full_board?)
    end

#     def test_for_winner_X
#         board = Board.new()
#         symbol = "X"
#         board.grid = ["X","X","X","","","","","",""]
#         assert_equal(true, board.winner?(symbol))
#     end

#     def test_for_winner_O
#         board = Board.new()
#         symbol = "O"
#         board.grid = ["O","O","O","","","","","",""]
#         assert_equal(true, board.winner?(symbol))
#     end

#     def test_for_winner_X_diagonal
#         board = Board.new()
#         symbol = "X"
#         board.grid = ["X","","","","X","","","","X"]
#         assert_equal(true, board.winner?(symbol))
#     end

#     def test_for_winner_O_diagonal
#         board = Board.new()
#         symbol = "O"
#         board.grid = ["","","O","","O","","O","",""]
#         assert_equal(true, board.winner?(symbol))
#     end

#     def test_for_false_win
#         board = Board.new()
#         symbol = "O"
#         board.grid = ["","O","","","O","","O","",""]
#         assert_equal(false, board.winner?(symbol))
#     end 
end
