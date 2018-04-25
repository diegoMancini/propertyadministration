package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.menu.form.LogInMenu;
import propertyAdmin.web.persons.Account;
import propertyAdmin.web.property.details.Blueprint;
import propertyAdmin.web.property.details.Deed;
import propertyAdmin.web.property.structure.Property;

public class PropertyMenu extends LogInMenu {

    public void operate(Account account) {
        mainloop:
        while (true) {
            System.out.println("-----------");
            System.out.println("Operaciones: \n 1 - Listar propiedades \n 2 - Ir a propiedad \n 3 - Agregar propiedad (basico) \n 4 - Agregar propiedad (completo) \n 5 - Quitar propiedad \n 6 - Volver a menu principal \n ");
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
                    addCompleteProperty(account);
                    break;
                case 5:
                    removeProperty(account);
                    break;
                case 6:
                    break mainloop;
                    default:
                        System.out.println("ERROR");
                        break;
            }
        }
    }

    private void listAllProperties(Account account) {
        try {
            System.out.println("\nSus propiedades: \n");
            for (int i = 0; i < account.getProperties().size(); i++) {
                System.out.println(i + ") " + account.getProperties().get(i).getName());
            }
        } catch (NullPointerException e) {
            System.out.println("NO HAY");
        }
    }

    private void goToProperty(Account account) {
        listAllProperties(account);
        int choice = Scanner.getInt("Ir a propiedad numero: ");
        Property property = getDatabaseOps().getProperty(choice, account.getEmail());
        new SpecificPropertyMenu().operate(account, property);
    }

    private void addProperty(Account account) {
        System.out.println("\nDATOS PROPIEDAD");
        String name = Scanner.getString("Nombre: ");
        String description = Scanner.getString("Descripcion: ");
        String address = Scanner.getString("Direccion: ");
        Property property = new Property(name, description, address);
        getDatabaseOps().addPropertyToDatabase(account.getEmail(), property);
    }

    private void addCompleteProperty(Account account) {
        System.out.println("\nDATOS PROPIEDAD");
        String name = Scanner.getString("Nombre: ");
        String description = Scanner.getString("Descripcion: ");
        String address = Scanner.getString("Direccion: ");
        Property property = new Property(name, description, address);
        System.out.println("\nDATOS PLANOS");
        String blueprintName = Scanner.getString("Nombre planos: ");
        Blueprint blueprint = new Blueprint(blueprintName);
        System.out.println("\nDATOS ESCRITURA");
        String deedName = Scanner.getString("Nombre escritura: ");
        String legalAddressDeed = Scanner.getString("Direccion legal escritura: ");
        Deed deed = new Deed(deedName, legalAddressDeed);
        getDatabaseOps().addCompletePropertyToDatabase(account.getEmail(), property, blueprint, deed);
    }

    private void removeProperty(Account account) {
        listAllProperties(account);
        int choice = Scanner.getInt("Eliminar propiedad: ");
        getDatabaseOps().removePropertyFromDatabase(choice, account.getEmail());

    }
}
