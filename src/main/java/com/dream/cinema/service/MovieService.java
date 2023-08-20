package com.dream.cinema.service;

import java.util.List;

import com.dream.cinema.vo.MovieVO;

public interface MovieService {
	List<MovieVO> weekmovie (); 
	
	List<MovieVO> searchmovie ();
	
	
}
