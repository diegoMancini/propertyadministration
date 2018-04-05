package persons;

import property.Property;
import java.util.ArrayList;
import java.util.List;

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
