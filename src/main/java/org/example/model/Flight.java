package org.example.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "flight")
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name="row_id")
    int rowId;

    @Column(name="destination_name")
    String destinationName;
    @Column(name="fight_code")
     String flightCode;
    @Column(name="fight_number")
    String flightNumber;



@Column(name = "departureDateTime",columnDefinition = "TIMESTAMP")
    LocalDateTime departureDateTime;

@Column(name="arrival_airport_date",columnDefinition="TIMESTAMP")
LocalDateTime arrivalDateTime;


@Column(name="airlines_name")
String airlinesName;

@Column(name="terminal_no")
Integer terminalNo;


    @Column(name="Cost")
    int Cost;


    public String getDestinationName() {
        return destinationName;
    }

    public void setDestinationName(String destinationName) {
        this.destinationName = destinationName;
    }



    public String getAirlinesName() {
        return airlinesName;
    }

    public void setAirlinesName(String airlinesName) {
        this.airlinesName = airlinesName;
    }

    public Integer getTerminalNo() {
        return terminalNo;
    }

    public void setTerminalNo(Integer terminalNo) {
        this.terminalNo = terminalNo;
    }

    public LocalDateTime getArrivalDateTime() {
        return arrivalDateTime;
    }

    public void setArrivalDateTime(LocalDateTime arrivalDateTime) {
        this.arrivalDateTime = arrivalDateTime;
    }

    public LocalDateTime getDepartureDateTime() {
        return departureDateTime;
    }

    public void setDepartureDateTime(LocalDateTime departureDateTime) {
        this.departureDateTime = departureDateTime;
    }

    public int getRowId() {
        return rowId;
    }

    public void setRowId(int rowId) {
        this.rowId = rowId;
    }

    public String getFlightCode() {
        return flightCode;
    }

    public void setFlightCode(String flightCode) {
        this.flightCode = flightCode;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

}
