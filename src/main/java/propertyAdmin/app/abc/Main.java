package propertyAdmin.app.abc;

import propertyAdmin.app.logistic.Logistics;
import propertyAdmin.app.menu.form.LogInMenu;
import propertyAdmin.app.menu.form.SignUpMenu;
import propertyAdmin.app.menu.form.StartMenu;

public class Main {

    public static void main(String[] args) {
        System.out.println("\n\n\n                    ————House Admin———\n" + "\n" + "Bienvenido a House-Admin, un sistema de gestión de propiedades.\n");

        new StartMenu().operate();
    }

}
