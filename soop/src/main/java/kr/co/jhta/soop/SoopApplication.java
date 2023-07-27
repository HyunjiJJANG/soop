package kr.co.jhta.soop;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SoopApplication {

	public static void main(String[] args) {
		SpringApplication.run(SoopApplication.class, args);
	}

	/*
	 * @Bean PasswordEncoder passwordEncoder() { return new BCryptPasswordEncoder();
	 * }
	 */
}
