package persons;

import javax.persistence.*;

@Entity
@Table (name = "USER")
public class User {
    //TODO mejorar los nombres y @
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer userId;

    @Column(name = "NAME")
    private String name;

    @Column(name = "SURNAME")
    private String surname;

    @Column(name = "MAIL", unique = true)
    private String mail;

    @Column(name = "IDENTITY_NUMBER") //dni
    private String identityNumber;

    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;

    @Column(name = "ROLE")
    private String role;

    @Column(name = "PASSWORD")
    private String password;

    public User(String name, String surname, String mail, String identityNumber, String phoneNumber, String role, String password) {
        this.name = name;
        this.surname = surname;
        this.mail = mail;
        this.identityNumber = identityNumber;
        this.phoneNumber = phoneNumber;
        this.role = role;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getIdentityNumber() {
        return identityNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getMail() {
        return mail;
    }

    public String getRole() {
        return role;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getPassword() {
        return password;
    }
}
