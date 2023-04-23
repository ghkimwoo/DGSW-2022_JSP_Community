package member.encryption;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/* 암호화가 포함된 모든 파일은 테스트 중인 환경입니다. 실제 적용여부는 불명입니다. */
/* CVE-2020-15250 취약점 경고가 있습니다. 이용에 주의 바랍니다.*/
public class MemberDB {

    public Connection getConnection() throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");  // mysql.jar 라이브러리 확인
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/encryptmember",
                "LoginManage","password");
        return con;
    }
    public List<Member> doselect(){
        List<Member> list = new ArrayList();
        Connection con = null;  // DB연결
        PreparedStatement pstmt = null; // SQL문 작성..
        ResultSet rs = null;  // DB Table 저장..
        try{
            con = getConnection();
            pstmt = con.prepareStatement("select * from member");
            rs = pstmt.executeQuery();
            while (rs.next()){
                Member member = new Member();
                member.setId(rs.getInt("id"));
                member.setUsername(rs.getString("email"));
                member.setPassword(rs.getString("password"));
                member.setGender(rs.getString("gender"));

                list.add(member);
            }
            System.out.println("DB 연결 성공");
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public void dodelete(String []ids){
        Connection con = null;
        PreparedStatement pstmt = null;
        // ids [ 2 3 4 ] -> 2,3,4
        String values = "";
        for ( int i =0; i<ids.length; i++){
            if( i == (ids.length-1) )
                values = values + ids[i];
            else
                values = values + ids[i]+",";
        }
        // 2,3,4,
        System.out.println("values = "+values);
        try{
            // jar 로딩..
            con = getConnection();
            pstmt = con.prepareStatement("delete from member where id in ("+values+")");
            pstmt.executeUpdate();// sql 구문 실행...
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void douserdelete(String username){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = getConnection();
            pstmt = con.prepareStatement("delete from member where username = ?");
            pstmt.setString(1, username);
            pstmt.executeUpdate();// sql 구문 실행...
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void doinsert(String username,String password,String gender){
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement("insert into member" + "(email, password, gender)" + "value  (?,?,?)");
            String Epassword = hashPassword(password);
            pstmt.setString(1, username);
            pstmt.setString(2, Epassword);
            pstmt.setString(3, gender);
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    private String hashPassword(String plainTextPassword) {
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }

    public void doupdate(String username,String password,String gender,String id){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = getConnection();
            pstmt = con.prepareStatement("update member set email=?, " +
                    "password=?, " +
                    "gender = ? " +
                    " where id = ?");
            pstmt.setString(1,username);
            pstmt.setString(2,hashPassword(password));
            pstmt.setString(3,gender);
            pstmt.setInt(4,Integer.parseInt(id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public boolean dologinchk(String u, String p){
        Connection con = null;
        PreparedStatement pspmt = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            pspmt = con.prepareStatement("select password from member where email = ?");
            pspmt.setString(1,u);
            rs = pspmt.executeQuery();
            if(rs.next()){
                String Ep = rs.getString("password");
                if(checkPass(p, Ep)) {
                    return true;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    private boolean checkPass(String plainPassword, String hasedPassword) {
        if (BCrypt.checkpw(plainPassword, hasedPassword)) {
            return true;
        }else{
            return false;
        }
    }

    public int doIdCheck(String username) throws SQLException {
        int result = -1;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //1. DB연결
            con = getConnection();
            //2. sql 구문 & pstmt생성
            pstmt = con.prepareStatement("select email from member where email=?");
            pstmt.setString(1, username);

            //3. 실행 -> select -> rs저장
            rs = pstmt.executeQuery();

            //4. 데이터처리

            if (rs.next()) {
                result = 0;
            } else {
                result = 1;
            }

            System.out.println("아이디 중복체크결과 : " + result);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            con.close();
        }
        return result;
    }


    public void doinfoupdate(String username,String password,String gender){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = getConnection();
            pstmt = con.prepareStatement("update member set password=?, " +
                    "gender = ? " +
                    " where email = ?");
            pstmt.setString(1,password);
            pstmt.setString(2,gender);
            pstmt.setString(3,hashPassword(password));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
