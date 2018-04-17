package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Menu;
import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.menu.form.LogInMenu;
import propertyAdmin.persons.Account;
import propertyAdmin.property.structure.Property;

public class PropertyMenu extends LogInMenu {

    public void operate() {
        mainloop:
        while (true) {
            System.out.println("-----------");
            System.out.println("Operaciones: \n 1 - Listar propiedades \n 2 - Ir a propiedad \n 3 - Agregar propiedad \n 4 - Quitar propiedad \n 5 - Volver a menu principal \n ");
            int choice = Scanner.getInt("Operacion: ");

            //Hace clear la terminal
            for (int i = 0; i < 50; i++) {
                System.out.println("\n");
            }

            switch (choice) {
                case 1:
                    listAllProperties();
                    break;
                case 2:
                    goToProperty();
                    break;
                case 3:
                    addProperty();
                    break;
                case 4:
                    removeProperty();
                    break;
                case 5:
                    break mainloop;
                    default:
                        System.out.println("ERROR");
                        break;
            }
        }
    }

    private void listAllProperties() {
        Account account = getDatabaseOps().getSessionFactory().getCurrentSession().get(Account.class, getMail());
        for(Property property: account.getProperties()) {
            System.out.println(property.getName());
        }
    }

    private void goToProperty() {
        listAllProperties();
        String choice = Scanner.getString("(NOMBRE EXACTO) --> Ir a propiedad: ");
        Property property = getDatabaseOps().getProperty(choice, getMail());
        new SpecificPropertyMenu().operate(property);
    }

    private void addProperty() {
        String name = Scanner.getString("Nombre: ");
        String description = Scanner.getString("Descripcion: ");
        String address = Scanner.getString("Direccion: ");
        getDatabaseOps().addPropertyToDatabase(name, description, address, getMail());
    }

    private void removeProperty() {
        String name = Scanner.getString("Nombre: ");
        getDatabaseOps().removePropertyFromDatabase(name, getMail());

    }
}
