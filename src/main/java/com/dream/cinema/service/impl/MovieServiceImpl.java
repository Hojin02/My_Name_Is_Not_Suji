package com.dream.cinema.service.impl;

import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dream.cinema.service.MovieService;
import com.dream.cinema.service.dao.MovieDAO;
import com.dream.cinema.vo.MovieVO;

@Service("movieService")
public class MovieServiceImpl implements MovieService {

	@Autowired // 생성자
	private MovieDAO movieDAO;

	@Override
	public List<MovieVO> weekmovie() { // 주간 박스오피스 조회
		MovieVO weekmovie = new MovieVO();

		Document doc;
		String baseUrl = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?";
		String kobisapi = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?weekGb=0&key=";
		LocalDate yesterday = LocalDate.now().minusDays(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formattedDate = yesterday.format(formatter);

		String kobiskey = "24f6e89e11e8762f14429254ad9edeac";
		String koburl = kobisapi + kobiskey + "&targetDt=" + formattedDate;
		String myKey = "I57PW5I358JE59IJ1O1L";

		List<MovieVO> molist = new ArrayList<>(); // 영화 정보를 저장할 리스트
		List<Integer> movieCodes = new ArrayList<>(); // 영화코드만 따로 저장할 리스트

		 try {
	         doc = Jsoup.connect(koburl).get();
	         Elements movieElements = doc.select("weeklyBoxOffice");
	         for (Element movieElement : movieElements) {
	            String audiAcc = movieElement.select("audiAcc").first().text();
	            String rank = movieElement.select("rank").first().text();
	            movieElement.select("audiAcc").first().text();
	            String code = movieElement.select("movieCd").first().text();
	            String d = movieElement.select("openDt").first().text();
	            String open = d.replace("-", "");
	            String title = movieElement.select("movieNm").first().text();

	            String urlString = baseUrl + "collection=kmdb_new2&detail=Y&title=" + URLEncoder.encode(title, "UTF-8") + "&releaseDts=" + open
	                    + "&ServiceKey=" + myKey;
	            int timeoutMillis = 10000; // 대기 시간을 밀리초(ms) 단위로 설정 (예: 10초)
	            doc = Jsoup.connect(urlString).timeout(timeoutMillis).get();
	            //doc = Jsoup.connect(urlString).get();
	            Element mo_infoTxtE = doc.select("plot").first();
	            Element mo_postTxtE = doc.select("posters").first();
	            Element mo_runTxtE = doc.select("runtime").first();
	            Element mo_typeTxtE = doc.select("genre").first();
	            Element mo_ageTxtE = doc.select("ratingGrade").first();
	            Element mo_dirnameTxtE = doc.select("directorNm").first();
	            Elements mo_atrname = doc.select("actorNm");


	            int mo_code = Integer.parseInt(code);
	            String mo_name = title;
	            String mo_open = open;
	            String actorsString = "";
	            String mo_info = (mo_infoTxtE != null) ? mo_infoTxtE.text() : "영화정보없음";
	            String mo_post = (mo_postTxtE != null) ? mo_postTxtE.text() : "영화정보없음";
	            String mo_run = (mo_runTxtE != null) ? mo_runTxtE.text() : "영화정보없음";
	            String mo_type = (mo_typeTxtE != null) ? mo_typeTxtE.text() : "영화정보없음";
	            String mo_age = (mo_ageTxtE != null) ? mo_ageTxtE.text() : "영화정보없음";
	            String mo_dirname = (mo_dirnameTxtE != null) ? mo_dirnameTxtE.text() : "영화정보없음";
	            
	            String[] urlArray = mo_post.split("\\|");
	            if (urlArray.length > 0)
	               mo_post = urlArray[0];

	            // 각 배우 요소에서 텍스트를 추출하여 리스트에 추가
	            for (int i = 0; i < mo_atrname.size(); i++) {
	               if (i < 10) {
	                  Element actorElement = mo_atrname.get(i);
	                  String actorName = (actorElement != null) ? actorElement.text() : "영화정보없음";
	                  // 배우 이름을 actorsString에 추가
	                  if (i > 0) {
	                     actorsString += ", "; // 쉼표로 구분하여 추가
	                  }
	                  actorsString += actorName;
	               } else {
	                  break; // 최대 인원 초과 시 반복문 종료
	               }
	            }
	             
	            weekmovie= new MovieVO(mo_code,mo_name,mo_info,mo_post,mo_run,mo_type,
	            		mo_open,mo_age,mo_dirname,actorsString,rank,audiAcc);
//	            weekmovie.setMo_code(mo_code);
//	            weekmovie.setMo_name(mo_name);
//	            weekmovie.setMo_info(mo_info);
//	            weekmovie.setMo_post(mo_post);
//	            weekmovie.setMo_run(mo_run);
//	            weekmovie.setMo_type(mo_type);
//	            weekmovie.setMo_open(mo_open);
//	            weekmovie.setMo_age(mo_age);
//	            weekmovie.setMo_dirname(mo_dirname);
//	            weekmovie.setMo_actname(actorsString);
//	            weekmovie.setMo_rank(rank);
//	            weekmovie.setMo_audiAcc(audiAcc);
	            molist.add(weekmovie); // 영화 정보를 리스트에 추가
	            movieCodes.add(mo_code);

	         }
				 
	        return molist;

	      }catch(Exception e) {
	    	  
	      }
		
		return molist;
	}
@Override
	public ArrayList<MovieVO> searchmovie() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
