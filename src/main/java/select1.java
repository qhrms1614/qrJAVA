
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class select
 */
@WebServlet("/select1")
public class select1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public select1() {
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
		response.setContentType("text/html; charset=utf-8");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String strReturn = "";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl"; // DB접속정보
		String userid = "ora_user";
		String passcode = "human123";
		String sql ="select a.name,sum(b.cty*a.price) as result, a.sysdate as time" +
					" from cafe_sales b, menu a" +
					" where a.code=b.menu_code group by a.name order by a.name";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, userid, passcode); // null if connection failed.
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int n=0;
			while (rs.next()) {
				if (!strReturn.equals(""))
					strReturn += ";";
				strReturn += rs.getString("name") + "," + rs.getInt("result") + "," +
					rs.getDate("time");
							
				}
			System.out.println(strReturn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
//		System.out.println(strReturn);
		response.getWriter().print(strReturn);
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