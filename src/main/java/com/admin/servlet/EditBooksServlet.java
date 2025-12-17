package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			BookDetails b=new BookDetails();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Book Updated Successfully..");
				resp.sendRedirect("admin/all_books.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong..");
				resp.sendRedirect("admin/all_books.jsp");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}