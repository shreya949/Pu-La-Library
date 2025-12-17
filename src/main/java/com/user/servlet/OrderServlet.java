package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.DAO.BookOrderimpl;
import com.DAO.CartDAOimpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			//System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);
			
			CartDAOimpl dao=new CartDAOimpl(DBConnect.getConn());
			List<Cart> blist=dao.getBookByUser(id);
			
			if(blist.isEmpty()) {
				session.setAttribute("failedMsg","Please add items");
				resp.sendRedirect("checkout.jsp");
			}else {
				BookOrderimpl dao2=new BookOrderimpl(DBConnect.getConn());
				int i=dao2.getOrderNo();
				Book_Order o=null;
				
				ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
				for(Cart c:blist) {
					
					o=new Book_Order();
					o.setOrderId("BOOK-ORD-00"+i);
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;
				}
				if("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg","Choose your payment method");
					resp.sendRedirect("checkout.jsp");
				}else {
					boolean f=dao2.saveOrder(orderList);
					if(f) {
						resp.sendRedirect("order_success.jsp");
						
					}
					else {
						session.setAttribute("failedMsg","Choose your payment method");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
