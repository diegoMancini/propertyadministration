package rents;

import persons.Account;
import persons.Tenant;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

//Base de contrato Bello-Ngom-Depto1

@Entity
@Table(name = "CONTRACT")
public class Contract {

    @Column(name = "COUNTRY")
    private String country; //Argentina
    @Column(name = "PROVINCE")
    private String province; //Buenos Aires
    @Column(name = "CITY")
    private String city; //Malvinas Argentinas
    @Column(name = "TOWN")
    private String town; //Grand Bourg
    @Column(name = "DATE_ISSUED")
    private Date dateIssued; //29/09/2017
    @Column(name = "DATE_END")
    private Date dateEnd;
    @Column(name = "LANDLORD")
    private Account owner; //Gabriela Fernanda Bello
    @Column(name = "LANDLORD")
    private Tenant tenant; //Mame Gor NGOM

}
