
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insert
 */
@WebServlet("/insert1")
public class insert1 extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public insert1() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html, charset=utf-8");
      Connection conn = null;
      PreparedStatement pstmt = null;

      String url = "jdbc:oracle:thin:@localhost:1521:orcl";
      String userid = "ora_user";
      String passcode = "human123";
      String sql = "insert into cafe_sales values(seq_cafe_sales.nextval,?,?,?,?,sysdate)"; // 주소창에 값을 넣어서 insert하도록 해주는 코드.
      String result_flag = "";
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection(url, userid, passcode); // null if connection failed.
         pstmt = conn.prepareStatement(sql);
         System.out.println(request.getParameter("mobile") + ","+ request.getParameter("cty")+","+request.getParameter("menu_code")+","+
        		 request.getParameter("total"));
         pstmt.setString(1, request.getParameter("mobile"));
         pstmt.setInt(2, Integer.parseInt(request.getParameter("menu_code")));
         pstmt.setInt(3, Integer.parseInt(request.getParameter("cty")));
         pstmt.setInt(4, Integer.parseInt(request.getParameter("total")));
         
         pstmt.executeUpdate();
         result_flag = "ok";
      } catch (Exception e) {
         result_flag = "fail";
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }

      }

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}