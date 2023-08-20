package com.dream.cinema;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dream.cinema.service.MovieService;
import com.dream.cinema.vo.MovieVO;

@Controller
public class MovieController {

	@Resource(name = "movieService")
	private MovieService movieService;
	
	// 주간 박스오피스 조회
    @RequestMapping("/WeeklyBoxOffice.do")
    public String WeeklyBoxOffice(HttpSession session,Model model) {
        List<MovieVO> weekmovie = movieService.weekmovie();
        model.addAttribute("weekmovie", weekmovie);
    	return "main"; 
    }
    
    // 영화 검색
    @RequestMapping("/searchMovie.do")
    public String searchMovie(HttpSession session,Model model) {
    	List<MovieVO> weekmovie = movieService.weekmovie();
    	model.addAttribute("weekmovie", weekmovie);
    	return "main"; 
    }
    
    
    
}
