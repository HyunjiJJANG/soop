package kr.co.jhta.soop.service;



public interface EmailUtil {
	
	void sendEmail(String toAddress, String subject, String body);

}
