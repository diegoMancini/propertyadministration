package propertyAdmin.rents;

import propertyAdmin.persons.Account;
import propertyAdmin.persons.Guarantor;
import propertyAdmin.persons.Tenant;

import javax.persistence.*;

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
//    @Column(name = "DATE_ISSUED")
//    private Date dateIssued; //29/09/2017
//    @Column(name = "CONTRACT_DATE_START")
//    private Date contractDateStart;
//    @Column(name = "CONTRACT_DATE_END")
//    private Date contractDateEnd;
    @Column(name = "DATE_ISSUED")
    private String dateIssued; //29/09/2017
    @Column(name = "CONTRACT_DATE_START")
    private String contractDateStart;
    @Column(name = "CONTRACT_DATE_END")
    private String contractDateEnd;
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
    private Float dailyInterestForDelayedPayment;

    public Contract() {
    }

    public Contract(String name, String country, String province, String city, String town,
                    String dateIssued, String contractDateStart, String contractDateEnd, Account owner,
                    Tenant tenant, Guarantor guarantor, Integer price, Integer deposit, Float dailyInterestForDelayedPayment) {
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
//
//    public Date getDateIssued() {
//        return dateIssued;
//    }
//
//    public Date getContractDateStart() {
//        return contractDateStart;
//    }
//
//    public Date getContractDateEnd() {
//        return contractDateEnd;
//    }

    public String getDateIssued() {
        return dateIssued;
    }

    public String getContractDateStart() {
        return contractDateStart;
    }

    public String getContractDateEnd() {
        return contractDateEnd;
    }

    public Account getOwner() {
        return owner;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public Guarantor getGuarantor() {
        return guarantor;
    }

    public Integer getPrice() {
        return price;
    }

    public Integer getDeposit() {
        return deposit;
    }

    public Float getDailyInterestForDelayedPayment() {
        return dailyInterestForDelayedPayment;
    }
}
