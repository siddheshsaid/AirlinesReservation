package org.example.dao;

import org.example.model.Flight;
import org.example.model.FlightReservation;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;




@Repository
public class FlightOperations implements FlightOperationsImp {



    @Autowired
    HibernateTemplate hibernateTemplate;

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }


    @Override
    @Transactional
    public boolean persist(Flight flight) {
        try {
            hibernateTemplate.save(flight);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override

    @Transactional(readOnly = true)
    public Flight read(String flightCode,String flightNumber) {
        DetachedCriteria criteria=DetachedCriteria.forClass(Flight.class);

        if(flightCode != null){
            criteria.add(Restrictions.eq("flightCode",flightCode));
        }
        if(flightNumber!= null){
            criteria.add(Restrictions.eq("flightNumber",flightNumber));

        }

        List<Flight>flights=(List<Flight>) hibernateTemplate.findByCriteria(criteria);
        return flights.isEmpty() ? null : flights.get(0);//USED TO GET ONLY ONE RECORD FROM DATABASE
        //1ST METHOD TO GET DATA USING FLIGHTCODE AND FLIGHTNUMBER



        //2ND METHOD TO GET DATA USING ONLY FLIGHTCODE
//        List<Flight> flights = (List<Flight>)hibernateTemplate.findByCriteria(
//                DetachedCriteria.forClass(Flight.class)
//                        .add(Restrictions.eq("flightCode", flightCode))
//
//        );
//        return flights.isEmpty() ? null : flights.get(0);//USED TO GET ONLY ONE RECORD FROM DATABASE

        //  return hibernateTemplate.get(Flight.class, flightCode);
    }





    @Override
    @Transactional
    public boolean update(Flight flight,String flightCode,String flightNumber) {
        try {
            Flight existingFlight = read(flightCode,flightNumber);
            if (existingFlight != null) {
                existingFlight.setDestinationName(flight.getDestinationName());
                existingFlight.setFlightCode(flight.getFlightCode());
                existingFlight.setFlightNumber(flight.getFlightNumber());
                if(flight.getDepartureDateTime()==null) {
                    flight.setDepartureDateTime(existingFlight.getDepartureDateTime());
                }
                else {
                    existingFlight.setDepartureDateTime(flight.getDepartureDateTime());
                }
                if(flight.getArrivalDateTime()==null){
                    flight.setArrivalDateTime(existingFlight.getArrivalDateTime());
                }
                existingFlight.setArrivalDateTime(flight.getArrivalDateTime());
                existingFlight.setTerminalNo(flight.getTerminalNo());
                hibernateTemplate.update(existingFlight);
                return true;
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean delete(String flightCode,String flightNumber) {
        Flight flight = read(flightCode,flightNumber);
        if (flight != null) {
            hibernateTemplate.delete(flight);
            return true;
        }
        return false;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Flight> readall() {
        return hibernateTemplate.loadAll(Flight.class);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Flight> filterFlightsBasedOnCriteria(LocalDateTime departurestartDateTime, LocalDateTime departureendDateTime) {
        try {
            // Assuming criteria is in the format ">20" for hours or "<30" for minutes
//            char operator = criteria.charAt(0); // Get the first character as the operator
//            int value = Integer.parseInt(criteria.substring(1)); // Get the numeric value

            // Construct the HQL query based on the operator and value
//            String hql = "SELECT f FROM Flight f WHERE ";
//            if (operator == '>') {
//                hql += "EXTRACT(HOUR FROM f.startDateTime) > :value";
//            } else if (operator == '<') {
//                hql += "EXTRACT(MINUTE FROM f.startDateTime) < :value";
//            }

//            String hql="SELECT f FROM Flight f WHERE ";
//            if(startTime!= null && endTime!= null){
//                hql+= "EXTRACT(HOUR FROM f.startDateTime)>= :startTime " +
//                     "AND EXTRACT(HOUR FROM f.startDateTime)<= :endTime";
//            }


            String hql = "SELECT f FROM Flight f WHERE ";
            if (departurestartDateTime != null && departureendDateTime != null) {
                hql += "f.departureDateTime >= :departurestartDateTime AND f.departureDateTime <= :departureendDateTime";

            }


// Create a Hibernate Query object for Flight entities
            Query<Flight> query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql, Flight.class);

            // Set the "startTime" parameter with the value of the startTime variable
            query.setParameter("departurestartDateTime", departurestartDateTime);
            query.setParameter("departureendDateTime", departureendDateTime);

            // Execute the query and return the results
            return query.list();
        } catch (HibernateException | NumberFormatException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
    @Override
    @Transactional
    public boolean persistUserDetails(FlightReservation flightReservation) {
        try {
            hibernateTemplate.save(flightReservation);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
    @Override
    @Transactional(readOnly = true)
    public List getCostingbyCityName(String destinationName) {
//        try (Session session = hibernateTemplate.getSessionFactory().getCurrentSession()) {
           // session.beginTransaction();

            // Use HQL to create a query
            String hql = "SELECT f.Cost FROM Flight f WHERE f.destinationName = :city";
          //  Query<String> query = session.createQuery(hql, String.class);
        Query<Integer> query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql, Integer.class);
            query.setParameter("city",destinationName );

            // Execute the query and get the result
            List Cost = query.list();

           // session.getTransaction().commit();
            return Cost;
//        } catch (Exception e) {
            // Handle exceptions appropriately
           // e.printStackTrace();
//            return null;
      //  }
    }
    @Override
    @Transactional(readOnly = true)
    public String getFlightStatus(LocalDateTime selectedDateTime,LocalDateTime arrivalDateTime){

        //USED TO GET SYSTEM TIME AND DATE
        LocalDateTime  currentdateTime = LocalDateTime.now();
        LocalDateTime currentDate = currentdateTime.toLocalDate().atStartOfDay();
        int currentHour = currentdateTime.getHour();
        int currentMinute = currentdateTime.getMinute();
        int currentSecond = currentdateTime.getSecond();


        System.out.println("Hour: " + currentHour);
        System.out.println("Minute: " + currentMinute);
        System.out.println("Second: " + currentSecond);
        System.out.println("CurrentDate: " + currentDate);


        //USED TO GET DEPARTURE TIME DETAILS

        int selectedHour = selectedDateTime.getHour();


        LocalDateTime departureDate=selectedDateTime.toLocalDate().atStartOfDay();
        int selectedMinute = selectedDateTime.getMinute();
        //  int selectedSecond = selectedDateTime.getSecond();

        System.out.println("Selected Hour"+selectedHour);

        //USED TO GET ARRIVAL TIME
        int arrivalHour = arrivalDateTime.getHour();
        int arrivalMinute = arrivalDateTime.getMinute();
        LocalDateTime arrivalDate=arrivalDateTime.toLocalDate().atStartOfDay();
        //   int arrivalSecond = arrivalDateTime.getSecond();
        System.out.print("Arrival hour"+arrivalHour);
        System.out.println("Arrival date"+arrivalDate);


//GIVING CONDITION FOR FLIGHT STATUS
        //  boolean isInAir = (selectedHour<currentHour && currentHour<=arrivalHour);
        boolean isInAir = ((selectedHour < currentHour) || (currentHour<arrivalHour) ||
                ((currentHour == arrivalHour) && (currentMinute < arrivalMinute)));

        boolean isJustTakeOff = (currentHour==selectedHour)&&(currentMinute==selectedMinute);
        boolean isJustArrived= (currentHour==arrivalHour)&&(currentMinute==arrivalMinute);
        if (isInAir) {
            String Msg="Flight is in air";
            return Msg;
        }
        else if(isJustTakeOff){
            String Msg="Flights is just taking off";
            return Msg;
        }
        else if(isJustArrived){
            String Msg="Flights is just arrived";
            return Msg;
        }
        else{
            String Msg="No flights are scheduled Today";
            return Msg;
        }
    }



    @Override
    @Transactional(readOnly = true)
    public List<Flight> getCurrentFlightForStatus(String currentFlightCode ){



        String hql = "SELECT f FROM Flight f WHERE ";
        hql += " f.flightCode = :flightCode";




        //Create a Hibernate Query object and set the parameters
        Query<Flight> query =hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql, Flight.class);
        //   query.setParameter("departureDateTime", selectedDateTime);
        query.setParameter("flightCode", currentFlightCode);
        return query.list();




    }






}
