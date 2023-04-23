package com.dg.board;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class BoardManager {

    public Connection connect() throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/b-21",
                "root",
                "root");
        return con;
    }

    // alt + enter class 가져오기..
    public List<Board> doselect(int pagenum){
        List<Board> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = connect();
            pstmt = con.prepareStatement("select * from board where idx < ? order by idx desc limit 10");
            pstmt.setInt(1,next() - (pagenum-1) * 10);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Board board = new Board();
                board.setIdx(rs.getInt("idx"));
                board.setContent(rs.getString("content"));
                board.setCount(rs.getInt("count"));
                board.setEmail(rs.getString("email"));
                board.setName(rs.getString("name"));
                board.setTitle(rs.getString("title"));
                board.setWdate(rs.getString("wdate"));
                board.setPhone(rs.getString("phone"));
                list.add(board);
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public int next(){
        String sql = "select idx from board order by idx desc";
        try {
            PreparedStatement pstmt = connect().prepareStatement(sql);
            ResultSet rs = null;
            rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt(1) +1;
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean doinsert(Board board){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = connect();
            pstmt = con.prepareStatement("insert into board " +
                    "(name,title,content,wdate)" +
                    " values " +
                    "(?,?,?,?)");
            pstmt.setString(1, board.getName());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, LocalDateTime.now().toString());
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return true;
    }

    public Board doselectrow(int idx){
        Board board = new Board();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = connect();
            pstmt = con.prepareStatement("select * from board where idx = ?");
            pstmt.setInt(1,idx);
            rs = pstmt.executeQuery();
            while(rs.next()){
                board.setIdx(rs.getInt("idx"));
                board.setContent(rs.getString("content"));
                board.setCount(rs.getInt("count"));
                board.setEmail(rs.getString("email"));
                board.setName(rs.getString("name"));
                board.setTitle(rs.getString("title"));
                board.setWdate(rs.getString("wdate"));
                board.setPhone(rs.getString("phone"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
        }
        return board;
    }

    public boolean dodelete(int idx){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = connect();
            pstmt = con.prepareStatement("delete from board where idx=?");
            pstmt.setInt(1, idx);
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean doupdate(int idx, String title, String content, String name){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = connect();
            pstmt = con.prepareStatement("update board set title=?, " +
                    "content=?, " +
                    "name = ? " +
                    " where idx = ?");
            pstmt.setString(1,title);
            pstmt.setString(2,content);
            pstmt.setString(3,name);
            pstmt.setInt(4,idx);
            pstmt.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public void click(int count, int idx){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = connect();
            pstmt = con.prepareStatement("update board set count=? " +
                    "where idx = ?");
            pstmt.setInt(1,++count);
            pstmt.setInt(2,idx);
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}