package propertyAdmin.structure.property.specifics;

import propertyAdmin.structure.property.FunctionalUnit;

import javax.persistence.*;

@Entity
public class LivingPlace extends FunctionalUnit {

    public LivingPlace() {
    }

    public LivingPlace(String name, String address) {
        super(name,address);
    }

    @Override
    public String getType() {
        return "Vivienda";
    }
}
