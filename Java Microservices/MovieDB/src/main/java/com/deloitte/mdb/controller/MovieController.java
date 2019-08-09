package com.deloitte.mdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.deloitte.mdb.model.Movie;
import com.deloitte.mdb.services.MovieService;

@Controller
public class MovieController {

	@Autowired
	MovieService mdbService;
	
	@RequestMapping("/home")
	public String addMovieForm(Model model) {
		model.addAttribute("movie", new Movie());
		model.addAttribute("allMovies", this.mdbService.getAllMovies());
		return "movie";
	}
	
	@RequestMapping(value = "/api/saveMovie", method = RequestMethod.POST)
	public String saveMovie(@ModelAttribute("movie") Movie movie) {
		System.out.println("Adding movie "+movie);
		this.mdbService.addMovie(movie);
		return "redirect:/home";
	}
	
	@RequestMapping("/api/getById/{mid}")
	public Movie getMovieById(@PathVariable("mid") Integer movieId) {
		Movie movie = mdbService.getMovieById(movieId);
		return movie;
	}
	
	@RequestMapping("/api/deleteById/{mid}")
	public String deleteMovie(@PathVariable("mid") Integer movieId) {
		System.out.println("deleting "+movieId);
		this.mdbService.deleteMovie(movieId);
		return "redirect:/home";
	}
	
	@RequestMapping(value="/api/updateMovie", method = RequestMethod.POST)
	public String updateMovie(@ModelAttribute("movie") Movie movie) {
		System.out.println("Updating "+movie);
		this.mdbService.updateMovie(movie);
		return "redirect:/home";
	}
	
	@RequestMapping(value="/update/{id}")
	public String editMovie(@PathVariable("id") Integer movieId, Model model) {
		model.addAttribute("movie", this.mdbService.getMovieById(movieId));
		model.addAttribute("allMovies", this.mdbService.getAllMovies());
		return "movie";
	}
	
	@RequestMapping("/api/allMovies")
	public List<Movie> allMovies() {
		List<Movie> allMovies = mdbService.getAllMovies();
		
		return allMovies;
	}
	
	@RequestMapping("/api/searchMovie/{keyword}")
	public List<Movie> searchMovie(@PathVariable("keyword") String movieName){
		List<Movie> result = mdbService.searchMovieByName(movieName);
		
		return result;
	}
	
	@RequestMapping("/api/filter/budget/{min}/{max}")
	public List<Movie> filterByBudget(@PathVariable("min") Integer min, @PathVariable("max") Integer max){
		return (List<Movie>) mdbService.filterByBudget(min, max);
	}
	
	@RequestMapping("/api/filter/{by}/budget/{minmax}")
	public List<Movie> filterByBudget(@PathVariable("by") String sortType, @PathVariable("minmax") Integer minmax){
		if(sortType.equals("min")) {
			return (List<Movie>) mdbService.filterByMinBudget(minmax);
		} else if(sortType.equals("max")) {
			return (List<Movie>) mdbService.filterByMaxBudget(minmax);
		} else {
			return null;
		}
	}
	
}
