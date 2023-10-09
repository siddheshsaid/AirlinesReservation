
package org.example.controller;

import java.io.IOException;

import java.net.http.HttpClient;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.example.dao.FlightOperationsImp;
import org.example.model.Flight;
import org.example.model.FlightReservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@Controller
public class HomeController {
	@Autowired
	FlightOperationsImp flightOperationsImp;

	@RequestMapping(value = {"/"})
	public String home() {
		return "home-content";
		// This maps to home.jsp
	}


	@RequestMapping(value = {"/manage-flight-content"})
	public ModelAndView manageFlight() {


		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("FlightReservation", new FlightReservation());
//		modelAndView.addObject("flightList", flightList);
		modelAndView.setViewName("manage");
		return modelAndView;

	}

	@RequestMapping("/createUserDetails")
	public String yourPage(@ModelAttribute("FlightReservation") FlightReservation flightReservation, Model model) {
		boolean b = flightOperationsImp.persistUserDetails(flightReservation);
		System.out.println(b);

		// Handle form submissions and other logic here
		return "manage"; // Return the name of the view to render
	}

//	@RequestMapping(value = "/createflight")
//	public ModelAndView createFlight(@ModelAttribute("Flight") Flight flight) throws IOException {
//
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("home-content");
//		return mv;
//
//
//	}


	@RequestMapping(value = {"/admin-login-content"})
	public ModelAndView adminLogin() {


		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin-login");
		return modelAndView;

	}

	@RequestMapping(value = "/createAdminLogin")
	public String createAdminLogin(@RequestParam("lemail") String loginEmail, @RequestParam("lpassword") String loginPassword, Model mv) throws IOException {
		System.out.print(loginEmail + " " + loginPassword);


		if (loginEmail.equals("Airaibiadmin@2023") && loginPassword.equals("123")) {

			List<Flight> flightList = flightOperationsImp.readall();
			mv.addAttribute("Flight", new Flight());
			mv.addAttribute("flightList", flightList);
			return "admin-page";
		}
//	else {
//               <% if (request.getAttribute("Errormessage") != null) { %>
//                                             <div class="Error-message">
//                                                 <%= request.getAttribute("Errormessage") %>
//                                             </div>
//                                         <% } %>
//
//mv.addAttribute("Errormessage", "Email id or Username is incorrect");
//			return "admin-login";
//
//
//}
		else {
			return "home-content";
		}

	}

	@RequestMapping(value = "/admin-page")
	public ModelAndView adminLoginDeatails(Model model) throws IOException {
		ModelAndView modelAndView = new ModelAndView();

		List<Flight> flightList = flightOperationsImp.readall();

		modelAndView.addObject("Flight", new Flight());
		modelAndView.addObject("flightList", flightList);
		modelAndView.setViewName("admin-page");

		return modelAndView;
	}

	@RequestMapping(value = "/createflight")
	public ModelAndView createFlight(@ModelAttribute("Flight") Flight flight) throws IOException {
		flightOperationsImp.persist(flight);
		List<Flight> flightList = flightOperationsImp.readall();
		ModelAndView mv = new ModelAndView();
		//mv.addObject("Flight", new Flight());

		mv.addObject("flightList", flightList);
		mv.setViewName("admin-page");
		return mv;


	}

	@RequestMapping(value = "/deleteflight")
	public String deleteFlight(@RequestParam("flightCode") String flightCode, @RequestParam("flightNumber") String flightNumber, Model model) throws IOException {
		flightOperationsImp.delete(flightCode, flightNumber);

		return "redirect:/admin-page";
	}

	@RequestMapping(value = "/modifyflight/{flightCode}/{flightNumber}")
	public String modifyFlight(@PathVariable("flightCode") String flightCode, @PathVariable("flightNumber") String flightNumber, Model model) throws IOException {
		Flight flight = flightOperationsImp.read(flightCode, flightNumber);
		model.addAttribute("Flight", flight);
		return "modifyoperation";
	}

	@RequestMapping(value = "/updateFlight/{flightCode}/{flightNumber}")
	public String updateFlight(@PathVariable("flightCode") String flightCode, @PathVariable("flightNumber") String flightNumber, @ModelAttribute("Flight") Flight flight, HttpServletRequest request) throws IOException {
		flightOperationsImp.update(flight, flightCode, flightNumber);
		return "redirect:/admin-page";
	}

	@RequestMapping(value = "/filterflights")
	public String showFilterFlightsPage(Model model) {

		return "search-flight"; // This is the name of your JSP file (filter-flights.jsp)
	}

	@RequestMapping(value = "/filter-flightssearch")
	public String filterFlights(@RequestParam("departurestartDateTime") LocalDateTime departurestartDateTime,
								@RequestParam("departureendDateTime") LocalDateTime departureendDateTime, Model model) {
//	/	model.addAttribute("flights", filteredFlights);

		List<Flight> filteredFlights = processCriteria(departurestartDateTime, departureendDateTime);
		for (Flight flight : filteredFlights) {
			System.out.println("Flight Code: " + flight.getFlightCode());
			System.out.println("Flight Number: " + flight.getFlightNumber());

			System.out.println("Departure Date and Time: " + flight.getDepartureDateTime());
			System.out.println("Arrival Date and Time: " + flight.getArrivalDateTime());
			System.out.println("--------------------");
		}


		model.addAttribute("flights", filteredFlights);
		//	Flight flight=new Flight();


		//return "search-flight"; // Replace with your view name
		return "search-flight";

	}

	// Implement the logic to parse and process the criteria
	private List<Flight> processCriteria(LocalDateTime departurestartDateTime, LocalDateTime departureendDateTime) {
		// Implement parsing and filtering logic here
		// Example: Use HibernateTemplate to filter flights based on criteria
		// Return a list of filtered flights
		return flightOperationsImp.filterFlightsBasedOnCriteria(departurestartDateTime, departureendDateTime);
	}

	@RequestMapping(value = "/searchCities")

	public String getFlightCodes(Model model, String flightCode) {
		List<Flight> flights = flightOperationsImp.readall();
		List<String> cityNames = flights.stream().map(Flight::getDestinationName).toList();
		model.addAttribute("cityNames", cityNames);
		System.out.println(cityNames);
		return "costingModule";

	}

	@RequestMapping(value = "/getCost", method = RequestMethod.POST)
	public String getFlightNumber(Model model, @RequestParam("city2") String cityName) {


//		System.out.print(currentDateTime);
		List<Flight> flights = flightOperationsImp.readall();
		List<String> cityNames = flights.stream().map(Flight::getDestinationName).toList();
		System.out.println(cityNames);
		model.addAttribute("cityNames", cityNames);
		//Cityname from form
		model.addAttribute("cityName", cityName);
		List totalCost = flightOperationsImp.getCostingbyCityName(cityName);

		model.addAttribute("totalCost", totalCost);
		System.out.print(totalCost);

		return "costingModule"; //


	}
	@RequestMapping(value = "/searchFlightStatus")

	public String getFlightCodes(Model model) {



//		1.flights.stream(): This starts a stream of Flight objects. A stream is a sequence of elements that you can process sequentially or in parallel.
//
//        2..map(Flight::getFlightCode): This is an intermediate operation in the stream pipeline. It applies the Flight::getFlightCode method reference to each Flight object in the stream, which means it calls the getFlightCode method for each Flight object. This transforms the stream of Flight objects into a stream of flight codes (strings).
//		3..toList(): This is a terminal operation that collects the elements of the stream into a List. In this case, it collects the flight codes into a List<String>.







		return "flightStatus"; // Assuming "flightCodes.jsp" is your JSP page name
	}
	@RequestMapping(value="/getFlightStatus", method = RequestMethod.POST)
	public String getFlightStatus(Model model,@RequestParam("flightCode")String flightCode) {
		String status=null;
		List<Flight> selectedFlightForStatus = processStatusCriteria(flightCode);
		System.out.print(selectedFlightForStatus);
		//LocalDateTime selectedDate=selectedFlightForStatus.stream().map(Flight::getDepartureDateTime);
		List<LocalDateTime> selectedDate = selectedFlightForStatus
				.stream()
				.map(Flight::getDepartureDateTime)
				.collect(Collectors.toList());
		LocalDateTime singleLocalDateTime = null;
		if (!selectedDate.isEmpty()) {
			singleLocalDateTime = selectedDate.get(0);
			// Now, singleLocalDateTime contains the single LocalDateTime object
			System.out.println("SingleDateTime" + singleLocalDateTime);
		} else {
			// Handle the case where the list is empty
			System.out.println("The list is empty.");
		}

		List<LocalDateTime> arrivalDate = selectedFlightForStatus
				.stream()
				.map(Flight::getArrivalDateTime)
				.collect(Collectors.toList());
		LocalDateTime singleArrivalDateTime=null;
		if (!arrivalDate.isEmpty()) {
			singleArrivalDateTime = arrivalDate.get(0);
			// Now, singleLocalDateTime contains the single LocalDateTime object
			System.out.println("SingleArrivalDateTime" + singleArrivalDateTime);
		} else {
			// Handle the case where the list is empty
			System.out.println("The list is empty.");
		}


      if(flightCode != null && selectedFlightForStatus!= null ) {
		  status = flightOperationsImp.getFlightStatus(singleLocalDateTime, singleArrivalDateTime);
		  System.out.println("Status Of the flight :" + status);
	  }
	  else{
		  System.out.println("Write FLight Code First");
	  }


		model.addAttribute("selectedFlightForStatus",selectedFlightForStatus);
		model.addAttribute("flightStatus",status);



		return "flightStatus";


	}
	//USED TO GET SELECTED FLIGHT SELECTED BY USER TO CHECK FLIGHT STATUS
	private List<Flight> processStatusCriteria(String flightCode) {
		// Implement parsing and filtering logic here
		// Example: Use HibernateTemplate to filter flights based on criteria
		// Return a list of filtered flights
		return flightOperationsImp.getCurrentFlightForStatus(flightCode);

	}




}






