package model.boarddata;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import model.ConnectionPool;

public class BoardDAO {
	protected Connection conn;
	protected Statement stat = null;
	protected ResultSet rs = null;

	public BoardDAO() {
		conn = ConnectionPool.getInstance().getConnection();
		try {
			stat = conn.createStatement();
		} catch (SQLException ex) {
		}
	}

	public void insert(Board board) {
		try {
			String format = "INSERT INTO %s(userId, userName, bdTitle, bdContent, bdViewCnt, bdType) VALUES('%s', '%s', '%s', '%s', %d, '%s')";
			String query = String.format(format, "gromiBoard", board.getUserId(), board.getUserName(), board.getBdTitle(),
					board.getBdContent(), board.getBdViewCnt(), board.getbdType());
			stat.executeUpdate(query);
		} catch (SQLException ex) {
		}
	}

	public List<Board> findByBdType(String boardType) {
		ArrayList<Board> boards = new ArrayList();
		try {
			String format = "SELECT * FROM %s WHERE bdType = '%s' ORDER BY bdNo DESC";
			String query = String.format(format, "gromiBoard", boardType);
			rs = stat.executeQuery(query);
			while (rs.next()) {
				boards.add(new Board(rs.getString("userId"), rs.getString("userName"), rs.getString("bdTitle"),
						rs.getString("bdContent"), rs.getTimestamp("bdDate"), rs.getInt("bdViewCnt"),
						rs.getString("bdType"), rs.getInt("bdNo")));
			}
		} catch (SQLException ex) {
		}
		return boards;
	}

	public Board findById(Integer id) {
		Board board = null;
		try {
			String format = "SELECT * FROM %s WHERE bdNo = %s";
			String query = String.format(format, "gromiBoard", id);
			rs = stat.executeQuery(query);
			while (rs.next()) {
				board = new Board(rs.getString("userId"), rs.getString("userName"), rs.getString("bdTitle"),
						rs.getString("bdContent"), rs.getTimestamp("bdDate"), rs.getInt("bdViewCnt"),
						rs.getString("bdType"), rs.getInt("bdNo"));
			}
		} catch (SQLException ex) {
		}
		return board;
	}

	public void update(Integer id, Board board) {
		Board p = findById(id);
		if (p != null) {
			try {
				String format = "UPDATE %s SET  userId = '%s', userName = '%s', bdTitle='%s', bdContent='%s', bdDate='%s', bdViewCnt=%d, bdType='%s' WHERE bdNo = %d";
				String query = String.format(format, "gromiBoard", board.getUserId(), board.getUserName(),
						board.getBdTitle(), board.getBdContent(), board.getBdDate(), board.getBdViewCnt(),
						board.getbdType(), board.getBdNo());
				stat.executeUpdate(query);
			} catch (SQLException ex) {
			}
		}
	}

	public void delete(Board board) {
		deleteById(board.getBdNo());
	}

	public void deleteById(Integer id) {
		try {
			String format = "DELETE FROM %s WHERE bdNo = %s";
			String query = String.format(format, "gromiBoard", id);
			stat.executeUpdate(query);
		} catch (SQLException ex) {
		}
	}
}
