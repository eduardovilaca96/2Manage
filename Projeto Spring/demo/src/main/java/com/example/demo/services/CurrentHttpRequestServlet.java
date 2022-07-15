//package com.example.demo.services;
//
//import java.util.Optional;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.stereotype.Service;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//
//@Service
//public class CurrentHttpRequestServlet {
//
//	public static Optional<HttpServletRequest> getCurrentHttpRequest() {
//		return Optional.ofNullable(RequestContextHolder.getRequestAttributes()).filter(
//				requestAttributes -> ServletRequestAttributes.class.isAssignableFrom(requestAttributes.getClass()))
//				.map(requestAttributes -> ((ServletRequestAttributes) requestAttributes))
//				.map(ServletRequestAttributes::getRequest);
//	}
//
//}
