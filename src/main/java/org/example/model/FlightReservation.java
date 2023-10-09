package org.example.model;

import javax.persistence.*;
import java.time.LocalDateTime;
@Entity
@Table(name = "flight_reservation")
public class FlightReservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="row_id")
    int rowId;
    @Column(name="journey_type_oneway")
    private String journeytypeOneWay;
    @Column(name="journey_type_twoway")

    private String journeytypeTwoWay;

    @Column(name="source")
    private String source;
    @Column(name="destination")
    private String destination;

    @Column(name = "departureDateTime",columnDefinition = "TIMESTAMP")
    private LocalDateTime departureDateTime;

    @Column(name = "returnDateTime",columnDefinition = "TIMESTAMP")
    private LocalDateTime returnDateTime;

    @Column(name="adults")
    private int adults;
    @Column(name="children")
    private int children;
    @Column(name="infants")
    private int infants;

    public String getJourneytypeOneWay() {
        return journeytypeOneWay;
    }

    public void setJourneytypeOneWay(String journeytypeOneWay) {
        this.journeytypeOneWay = journeytypeOneWay;
    }

    public String getJourneytypeTwoWay() {
        return journeytypeTwoWay;
    }

    public void setJourneytypeTwoWay(String journeytypeTwoWay) {
        this.journeytypeTwoWay = journeytypeTwoWay;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }


    public int getRowId() {
        return rowId;
    }

    public void setRowId(int rowId) {
        this.rowId = rowId;
    }

    public LocalDateTime getDepartureDateTime() {
        return departureDateTime;
    }

    public void setDepartureDateTime(LocalDateTime departureDateTime) {
        this.departureDateTime = departureDateTime;
    }

    public LocalDateTime getReturnDateTime() {
        return returnDateTime;
    }

    public void setReturnDateTime(LocalDateTime returnDateTime) {
        this.returnDateTime = returnDateTime;
    }

    public int getAdults() {
        return adults;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public int getInfants() {
        return infants;
    }

    public void setInfants(int infants) {
        this.infants = infants;
    }
}
