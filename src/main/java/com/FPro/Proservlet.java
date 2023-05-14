package com.FPro;
import java.io.IOException;
import java.io.InputStream;
import java.io.*;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class Proservlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		process(req,res);
	}
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		process(req,res);
	}
	
	public void process(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		//getting all the incoming details from the request
		String name = req.getParameter("username");
		String email = req.getParameter("user_email");
		String password = req.getParameter("password");
		Part part = req.getPart("image");
		String filename = part.getSubmittedFileName();
//		out.println(filename);
		
		try {
			Thread.sleep(3000);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String dburl = "jdbc:mysql://localhost:3306/youtube";
			String username = "root";
			String pass = "Mume@143";
			
			Connection conn = DriverManager.getConnection(dburl,username,pass);
			
			//queries..
			String query = "insert into demo(name,email,password,ImgName) values(?,?,?,?)";
			
			PreparedStatement pstm = conn.prepareStatement(query);
			
			pstm.setString(1, name);
			pstm.setString(2,email);
			pstm.setString(3, password);
			pstm.setString(4,filename);
			
			pstm.executeUpdate();
			
			InputStream is = part.getInputStream();
			byte[] data = new byte[is.available()];
			
			is.read(data);
			String path=req.getRealPath("/")+"img"+File.separator+filename;
			
			FileOutputStream os = new FileOutputStream(path);
			
			os.write(data);
			
			out.println("Success");
			
			conn.close();
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			out.println("Unsuccessful");
		}
	}
}
