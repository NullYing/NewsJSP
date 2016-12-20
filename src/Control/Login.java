package Control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Account;
import org.json.JSONObject;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/login.html").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("application/json;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		JSONObject jsonObj=new JSONObject();
		String jsonKey = "errmsg";
		
		Account db = new Account();
		int ret = db.checkUserExist(username);
		if(ret == 1){
			ret = db.checkPassword(username, password);
			if(ret == 1){
				jsonObj.put(jsonKey, "ok");
				HttpSession session = request.getSession();
				//不管存不存在，创建session
				session.setAttribute("username", username);
			}else{
				jsonObj.put(jsonKey, "error");
			}
		}
		else
			jsonObj.put(jsonKey, "error");
		PrintWriter out=response.getWriter();
		out.println(jsonObj.toString());
		out.flush();
		out.close();
	}

}
