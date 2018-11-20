package com.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ShortUrl {

	public String getShortUrl(String orginUrl) {
		 String clientId = "fYJNLawtjCdw4jRuyhWp";//애플리케이션 클라이언트 아이디값";
	     String clientSecret = "AeehX8V0Zx";//애플리케이션 클라이언트 시크릿값";
	     String result = null;
	        
	     try {
	         	String apiURL = "https://openapi.naver.com/v1/util/shorturl?url=" + orginUrl;
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer apiResponse = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	            	apiResponse.append(inputLine);
	            }
	            br.close();
	            System.out.println("short url : " + apiResponse.toString());
	            result = apiResponse.toString().split("\"")[13];
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	     
	     System.out.println("result : " + result);
		
		return result;
		
	}
}
