package org.example.dao;

import org.example.model.Flight;
import org.example.model.FlightReservation;

import java.time.LocalDateTime;
import java.util.List;

public interface FlightOperationsImp {
    public boolean persist(Flight flight);

    public Flight read(String flightCode,String flightNumber);

    public boolean update(Flight flight,String flightCode,String flightNumber);

    public boolean delete(String flightCode,String flightNumber);

    public List<Flight> readall();

    public List<Flight> filterFlightsBasedOnCriteria(LocalDateTime departurestartDateTime, LocalDateTime departureendDateTime);

    public boolean persistUserDetails(FlightReservation flightReservation);

    public List getCostingbyCityName(String destinationName);

    public List getCurrentFlightForStatus(String currentFlightCode);

    public String getFlightStatus(LocalDateTime selectedDateTime,LocalDateTime  arrivalDateTime);





}
