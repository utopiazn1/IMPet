package IMPet.util;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;




public class ProjectUtil{
	
	
	// 현재 날짜 : jsp에서 쓰기워한 로직 클래스 객체 생성후 currentDate변수를 그냥 가져다 쓰자.
	public String currentDate = null; 
	public ProjectUtil(){
		currentDate = getDate();
	}
	public String getCurrentDate() { return currentDate;	}
	public void setCurrentDate(String currentDate){ this.currentDate = currentDate; }
	
	
	// 현재 날짜 : java에서는 이 함수 호출
	public String getDate(){
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd" );
		String cDate = dateFormat.format(currentDate);
		//System.out.println("현재날짜 : "+cDate);
		
		return cDate;
	}
	
	
	// 프로젝트 위치 경로
	public String getPath(){
		String s = this.getClass().getResource("/").getPath();
		String sc = s.substring(0, s.indexOf(".metadata"))+ "/remedium2/src/main/webapp/resources/image";
		
		System.out.println("프로젝트 전까지의 경로: "+sc);
		
		return sc;
	}
	
	/*
	//이미지업로드 설정
	public static void imageUplode(ImageBean paramClass, int no, String uploadFileName, String fileUploadPath, File upload, String sql) throws IOException, SQLException{
		
		try{	
			//파일을 서버에 저장
			File destFile = new File(fileUploadPath + uploadFileName);
		    System.out.println(destFile.getPath());
		    FileUtils.copyFile(upload, destFile);
		    System.out.println("서버에 이미지 저장.");
		    
		    //파일 정보 설정.
		    paramClass.setNo(no);  //번호
		    paramClass.setImage(uploadFileName);    //이미지 이름
		    System.out.println("이미지 정보 파라미터 설정.");
		    
		    //파일 정보 업데이트.
		    sqlMapper.update(sql, paramClass);
		    System.out.println("이미지 정보 업데이트.");
		}catch(Exception e){}
	}
	*/
	
	
	//파일업로드 설정
	public static void UplodeFile(String uploadPath, MultipartFile multipartFile) throws IOException{
		if(!multipartFile.isEmpty()){
			File file = new File(uploadPath, multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
		}
	}
	
	//String - sql.Date 변환  (day=yyyy-MM-dd 형식이어야함)
	public static java.sql.Date changeSqlDate(String day){
		java.sql.Date date = java.sql.Date.valueOf(day);
		return date;
	}
	
	//String - sql.Timestamp 변환 (day=yyyy-MM-dd hh:mm:ss.s 형식이어야함)
	public static java.sql.Timestamp changeSqlTimestamp(String day){
		java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(day);
		return timestamp;
	}
	
	//String - util.Date 변환  (day=yyyy-MM-dd 형식이어야함)
	public static java.util.Date changeUtilDate(String day) throws Exception{
		java.util.Date date = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(day);
		return date;
	}
	
	//util.Date - sql.Date 변환
	public static java.sql.Date changeUtilSqlDate(java.util.Date day){
		
		java.sql.Date date = new java.sql.Date(day.getTime()); 
		
		return date;
	}
	
	
	
}