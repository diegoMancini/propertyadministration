package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.menu.form.LogInMenu;
import propertyAdmin.persons.Account;
import propertyAdmin.property.structure.FunctionalUnit;
import propertyAdmin.property.structure.Property;

public class SpecificPropertyMenu extends LogInMenu {

    public void operate(Account account, Property aProperty) {
        mainloop:
        while (true) {
            System.out.println("-----------");
            System.out.println("Operaciones: \n 1 - Detalles propiedad \n 2 - Ver UF  \n 3 - Agregar UF \n 4 - Quitar UF \n 5 - Agregar Escritura \n 6 - Agregar Planos \n 7 - Detalles Expensas \n 8 - Agregar gasto expensa \n 9 - Volver a menu principal \n ");
            int choice = Scanner.getInt("Operacion: ");

            //Hace clear la terminal
            for (int i = 0; i < 50; i++) {
                System.out.println("\n");
            }

            switch (choice) {
                case 1:
                    System.out.println(aProperty.toString());
                    break;
                case 2:
                    listFunctionalUnits(account, aProperty);
                    break;
                case 3:
                    addFunctionalUnit(account, aProperty);
                    break;
                case 4:
                    removeFunctionalUnit(account, aProperty);
                    break;
                case 5:
                    addDeed(account, aProperty);
                    break;
                case 6:
                    addBlueprint(account, aProperty);
                    break;
                case 7:
                    listExpensesDetails(account, aProperty);
                    break;
                case 8:
                    addExpense(account, aProperty);
                    break;
                case 9:
                    break mainloop;
                    default:
                        System.out.println("ERROR");
                        break;
            }
        }
    }

    private void listFunctionalUnits(Account account, Property aProperty) {
        for (Property property : account.getProperties()) {
            if (property.getName().equals(aProperty.getName())) {
                for (FunctionalUnit functionalUnit : property.getFunctionalUnits()) {
                    System.out.println(functionalUnit.toString());
                }
            }
        }
    }

    private void addFunctionalUnit(Account account, Property aProperty) {
        String name = Scanner.getString("Nombre: ");
        String type = Scanner.getString("Tipo: ");
        String address = Scanner.getString("Direccion: ");
        getDatabaseOps().addFunctionalUnitToDatabase(account.getEmail(), aProperty, name, type, address);
    }

    private void removeFunctionalUnit(Account account, Property aProperty) {
        String name = Scanner.getString("Nombre: ");
        getDatabaseOps().removeFunctionalUnitFromDatabase(account.getEmail(), aProperty, name);
    }

    private void addDeed(Account account, Property aProperty) {

    }

    private void addBlueprint(Account account, Property aProperty) {
    }

    private void listExpensesDetails(Account account, Property aProperty) {

    }

    private void addExpense(Account account, Property aProperty) {

    }
}
