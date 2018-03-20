package com.adminmodule.filters;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commons.ClientRemoteHost;
import com.spring.beans.Beans;

public class SessionFilter implements Filter {

	public void init( FilterConfig config ) throws ServletException {
	}

	@SuppressWarnings("unchecked")
	public void doFilter( ServletRequest servletrequest, ServletResponse servletresponse, FilterChain filterChain ) throws IOException,
	ServletException {

		final HttpServletRequest request = (HttpServletRequest) servletrequest;
		//final HttpServletResponse response = (HttpServletResponse) servletresponse;
		String path =request.getRequestURI();
		ArrayList service = null;
		int p= path.lastIndexOf("/");
		String link = path.substring(p+1,path.length()-4);
		
				
		if( link!=null && (link.equalsIgnoreCase("login"))|| (link.contains("login_Authenticate")) || 
				(Beans.contextData.getIgnoreServices() != null && !Beans.contextData.getIgnoreServices().isEmpty() 
						&& Beans.contextData.getIgnoreServices().contains(link)) ) {			
			filterChain.doFilter(servletrequest, servletresponse);
			//Allow Ignore Services
		}else{

			HttpSession session=((HttpServletRequest)servletrequest).getSession(true);
			service= (ArrayList) session.getAttribute("services");
			String totalService= (ArrayList) session.getAttribute("Totalservices") +"";
			String services=service+"";
			Object ip=session.getAttribute("IpChecking");

			try {
				
				if (session.getAttribute("user_Name") == null|| session.getAttribute("services") == null  ) {
					
					RequestDispatcher rd = ((HttpServletRequest) servletrequest).getRequestDispatcher("login.htm");
					rd.forward(((HttpServletRequest) servletrequest),((HttpServletResponse) servletresponse));
					//This Checking User Authenticated or not.

				} else if ( !(session.getAttribute("user_Name") == "Developer") ) {
					
					if(totalService.contains(link) && (!services.contains(link))){
						RequestDispatcher rd = ((HttpServletRequest) servletrequest).getRequestDispatcher("invalidAccess.htm");
						rd.forward(((HttpServletRequest) servletrequest),((HttpServletResponse) servletresponse));
						//This checks user access permission
					}else {
						filterChain.doFilter(servletrequest, servletresponse);
					}
					  					
				}else if (!( ClientRemoteHost.getClientIpAddress(request).equalsIgnoreCase(ip+"")) ) {
					  
					RequestDispatcher rd = ((HttpServletRequest) servletrequest).getRequestDispatcher("login.htm");
					rd.forward(((HttpServletRequest) servletrequest),((HttpServletResponse) servletresponse));
					//This checking  session Hijacking

				}
				else {
					filterChain.doFilter(servletrequest, servletresponse);
				}
				
			} catch (Exception e) {
				RequestDispatcher rd = ((HttpServletRequest) servletrequest).getRequestDispatcher("login.htm");
				rd.forward(((HttpServletRequest) servletrequest),((HttpServletResponse) servletresponse));
			}

		}
		//filterChain.doFilter(servletrequest, servletresponse);

	}

	public void destroy() {
	}
}