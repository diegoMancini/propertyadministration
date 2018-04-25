package propertyAdmin.web.rents;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import propertyAdmin.web.persons.Guarantor;
import propertyAdmin.web.persons.Landlord;
import propertyAdmin.web.persons.Tenant;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;

//Base de contrato Bello-Ngom-Depto1

@Entity
@Table(name = "CONTRACT")
public class Contract {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
    private Integer id;
    @Column(name = "NAME")
    private String name;
    @Column(name = "COUNTRY")
    private String country; //Argentina
    @Column(name = "PROVINCE")
    private String province; //Buenos Aires
    @Column(name = "CITY")
    private String city; //Malvinas Argentinas
    @Column(name = "TOWN")
    private String town; //Grand Bourg
    @Temporal(TemporalType.TIME)
    private Date dateIssued; //29/09/2017
    @Temporal(TemporalType.TIME)
    private Date contractDateStart;
    @Temporal(TemporalType.TIME)
    private Date contractDateEnd;
    @ManyToOne(cascade = {CascadeType.ALL})
    private Landlord owner; //Gabriela Fernanda Bello
    @ManyToOne(cascade = {CascadeType.ALL})
    private Tenant tenant; //Mame Gor NGOM
    @ManyToOne(cascade = {CascadeType.ALL})
    private Guarantor guarantor;
    @Column(name = "PRICE")
    private Double price;
    @Column(name = "DEPOSIT")
    private Double deposit;
    @Column(name = "DAILY_INTEREST_FOR_DELAYED_PAYMENT")
    private Double dailyInterestForDelayedPayment;

    public Contract() {
    }

    public Contract(String name, String country, String province, String city, String town,
                    Date dateIssued, Date contractDateStart, Date contractDateEnd, Landlord owner,
                    Tenant tenant, Guarantor guarantor, Double price, Double deposit, Double dailyInterestForDelayedPayment) {
        this.name = name;
        this.country = country;
        this.province = province;
        this.city = city;
        this.town = town;
        this.dateIssued = dateIssued;
        this.contractDateStart = contractDateStart;
        this.contractDateEnd = contractDateEnd;
        this.owner = owner;
        this.tenant = tenant;
        this.guarantor = guarantor;
        this.price = price;
        this.deposit = deposit;
        this.dailyInterestForDelayedPayment = dailyInterestForDelayedPayment;
    }

    public String getName() {
        return name;
    }

    public Integer getId() {
        return id;
    }

    public String getCountry() {
        return country;
    }

    public String getProvince() {
        return province;
    }

    public String getCity() {
        return city;
    }

    public String getTown() {
        return town;
    }

    public Date getDateIssued() {
        return dateIssued;
    }

    public Date getContractDateStart() {
        return contractDateStart;
    }

    public Date getContractDateEnd() {
        return contractDateEnd;
    }

    public Landlord getOwner() {
        return owner;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public Guarantor getGuarantor() {
        return guarantor;
    }

    public Double getPrice() {
        return price;
    }

    public Double getDeposit() {
        return deposit;
    }

    public Double getDailyInterestForDelayedPayment() {
        return dailyInterestForDelayedPayment;
    }

    public Landlord getLandlord() {
        return owner;
    }
}
