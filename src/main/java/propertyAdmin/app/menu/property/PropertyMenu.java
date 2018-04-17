package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.menu.form.LogInMenu;
import propertyAdmin.persons.Account;
import propertyAdmin.property.structure.Property;

public class PropertyMenu extends LogInMenu {

    public void operate(Account account) {
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
                    listAllProperties(account);
                    break;
                case 2:
                    goToProperty(account);
                    break;
                case 3:
                    addProperty(account);
                    break;
                case 4:
                    removeProperty(account);
                    break;
                case 5:
                    break mainloop;
                    default:
                        System.out.println("ERROR");
                        break;
            }
        }
    }

    private void listAllProperties(Account account) {
        try {
            for (int i = 0; i < account.getProperties().size(); i++) {
                System.out.println("\n" + i+1 + ") Name: " + account.getProperties().get(i).getName());
            }
        } catch (NullPointerException e) {
            System.out.println("NO HAY");
        }
    }

    private void goToProperty(Account account) {
        listAllProperties(account);
        String choice = Scanner.getString("(NOMBRE EXACTO) --> Ir a propiedad: ");
        Property property = getDatabaseOps().getProperty(choice, account.getEmail());
        new SpecificPropertyMenu().operate(account, property);
    }

    private void addProperty(Account account) {
        String name = Scanner.getString("Nombre: ");
        String description = Scanner.getString("Descripcion: ");
        String address = Scanner.getString("Direccion: ");
        getDatabaseOps().addPropertyToDatabase(name, description, address, account.getEmail());
    }

    private void removeProperty(Account account) {
        String name = Scanner.getString("Nombre: ");
        getDatabaseOps().removePropertyFromDatabase(name, account.getEmail());

    }
}
