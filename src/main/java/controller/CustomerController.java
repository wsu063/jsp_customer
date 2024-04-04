package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.CustomerDAO;
import DTO.Customer;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/")
@MultipartConfig(maxFileSize=1024*1024*50, location="c:/Temp/img")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO dao;
	private ServletContext ctx;
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		dao = new CustomerDAO();
		ctx = getServletContext();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		String site = null;
		
		System.out.println("command: " + command);
		
		switch(command) {
			case "/index": site = getList(request); break;
			case "/detail": site = getDetail(request); break;
			case "/register": site = "register.jsp"; break;
			case "/insert": site = registCustomer(request);  break;
			case "/edit": site = getDetailForEdit(request); break;
			case "/update": site = updateCustomer(request); break;
			case "/delete": site = deleteCustomer(request); break;
		}
		
		if(site.startsWith("redirect:/")) { // redirect 처리
			String rview = site.substring("redirect:/".length()); // 10
			response.sendRedirect(rview); // rview: /index
		} else {
			ctx.getRequestDispatcher("/" + site).forward(request, response);
		}
	}


	public String getList(HttpServletRequest request) {
		List<Customer> list;
		
		try {
			list = dao.getList();
			request.setAttribute("customerList", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error",  "고객 정보를 정상적으로 가져오지 못했습니다.");
		}
		return "index.jsp";
	}
    
	public String getDetail(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Customer c;
		try {
			c = dao.getDetail(id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "detail.jsp";
	}

	public String getDetailForEdit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			Customer c = dao.getDetail(id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "edit.jsp";
	}
	
	public String registCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		
		try {
			BeanUtils.populate(c, request.getParameterMap());
			
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			
			if(fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
				c.setImg("/img/" + fileName);
			} else {
				c.setImg(null);
			}
			dao.registCustomer(c);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				//쿼리스트링의 한글깨짐을 방지하기 위해 UTF-8로 인코딩
				String encodeName = URLEncoder.encode("게시물이 정상적으로 등록되지 않았습니다!", "UTF-8");
				return "redirect:/index?error_no=" + encodeName;//여기도 리턴문 추가?
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} 
		return "redirect:/index";
	}





	private String getFilename(Part part) {
		String fileName = null;
		//파일 이름이 들어있는 헤더 영역을 가져온다.
		String header = part.getHeader("content-disposition");
		//form-data; name="img"; filename="사진5.jpg"
		System.out.println("Header => " + header);
		
		//파일 이름이 들어있는 속성부분의 시작위치를 가지고옴
		int start = header.indexOf("filename=");
		// start + 10: f i l e n a m e = " 
		// 쌍따옴표 사이의 이미지명 부분만 가지고 옴
		fileName = header.substring(start + 10, header.length() - 1);
		
		return fileName;
	}

	public String updateCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		String origin_file = request.getParameter("origin_file");
		
		try {
			BeanUtils.populate(c, request.getParameterMap());
			
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if(fileName != null && !fileName.isEmpty()){
				part.write(fileName);
				c.setImg("/img/" + fileName);
			} else {
				if(origin_file == null || origin_file.equals("")) {
					c.setImg(null);
				} else {
					c.setImg(origin_file);
				}
			}
		
		
			dao.editCustomer(c);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/detail?id=" + c.getId();
	}
	
	public String deleteCustomer(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			dao.deleteCustomer(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			try {
				String encodeName = URLEncoder.encode("게시물이 정상적으로 삭제되지 않았습니다.", "UTF-8");
				return "redirect:/index?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
		return "redirect:/index";
	}
	
}


