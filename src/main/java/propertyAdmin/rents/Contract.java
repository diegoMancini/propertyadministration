package propertyAdmin.rents;

import propertyAdmin.persons.Account;
import propertyAdmin.persons.Guarantor;
import propertyAdmin.persons.Tenant;

import javax.persistence.*;
import java.util.Date;

//Base de contrato Bello-Ngom-Depto1

@Entity
@Table(name = "CONTRACT")
public class Contract {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
    private Integer id;

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
    @Column(name = "CONTRACT_DATE_START")
    private Date contractDateStart;
    @Column(name = "CONTRACT_DATE_END")
    private Date contractDateEnd;
    @OneToOne(cascade = {CascadeType.ALL})
    private Account owner; //Gabriela Fernanda Bello
    @OneToOne(cascade = {CascadeType.ALL})
    private Tenant tenant; //Mame Gor NGOM
    @OneToOne(cascade = {CascadeType.ALL})
    private Guarantor guarantor;
    @Column(name = "PRICE")
    private Integer price;
    @Column(name = "DEPOSIT")
    private Integer deposit;
    @Column(name = "DAILY_INTEREST_FOR_DELAYED_PAYMENT")
    private Integer dailyInterestForDelayedPayment;

    public Contract() {
    }
}
