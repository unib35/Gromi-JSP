package model.boarddata;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.ConnectionPool;

public class CommentDAO {
	protected Connection conn;
	protected Statement stat = null;
	protected ResultSet rs = null;

	public CommentDAO() {
		conn = ConnectionPool.getInstance().getConnection();
		try {
			stat = conn.createStatement();
		} catch (SQLException ex) {
		}
	}

	public void insert(Comment comment) {
		try {
			String format = "INSERT INTO %s(bdNo, userId, userName, bdComment) VALUES(%d, '%s', '%s', '%s')";
			String query = String.format(format, "gromiComment", comment.getBdNo(), comment.getUserId(),
					comment.getUserName(), comment.getBdComment()
					);
			stat.executeUpdate(query);
		} catch (SQLException ex) {
		}
	}

	public List<Comment> findByBdNo(int bdNo) {
		ArrayList<Comment> comments = new ArrayList();
		try {
			String format = "SELECT * FROM %s WHERE bdNo = %d ORDER BY coNo DESC";
			String query = String.format(format, "gromiComment", bdNo); //
			rs = stat.executeQuery(query);
			while (rs.next()) {
				comments.add(new Comment(rs.getInt("bdNo"), rs.getString("userId"), rs.getString("userName"),
						rs.getString("bdComment"), rs.getTimestamp("coDate"), rs.getInt("coNo")));
			}
		} catch (SQLException ex) {
		}
		return comments;
	}

	public Comment findById(Integer id) {
		Comment comment = null;
		try {
			String format = "SELECT * FROM %s WHERE bdNo = %d";
			String query = String.format(format, "gromiComment", id);
			rs = stat.executeQuery(query);
			while (rs.next()) {
				comment = new Comment(rs.getInt("bdNo"), rs.getString("userId"), rs.getString("userName"),
						rs.getString("bdComment"), rs.getTimestamp("bdDate"), rs.getInt("coNo"));
			}
		} catch (SQLException ex) {
		}
		return comment;
	}

	public void update(Integer id, Comment comment) {
		Comment p = findById(id);
		if (p != null) {
			try {
				String format = "UPDATE %s SET userName = '%s', bdComment = '%s' WHERE coNo = %d";
				String query = String.format(format, "gromiComment", comment.getUserName(), comment.getBdComment(), id);
				stat.executeUpdate(query);
			} catch (SQLException ex) {
			}
		}
	}

	public void deleteById(Integer id) {
		try {
			String format = "DELETE FROM %s WHERE coNo = %d";
			String query = String.format(format, "gromiComment", id);
			stat.executeUpdate(query);
		} catch (SQLException ex) {
		}
	}
}
