package persons;

import property.Property;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table (name = "ACCOUNTS")
public class Account {

    private Owner owner;
    private String email;
    private String password;
    private List<Property> properties;
    private boolean logged;

    public Account(Owner owner, String email, String password) {
        this.owner = owner;
        this.email = email;
        this.password = password;
        logged = false;
        properties = new ArrayList<>();
    }
}
