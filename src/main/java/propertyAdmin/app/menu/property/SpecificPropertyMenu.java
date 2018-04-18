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
            System.out.println("\n\n-----------");
            System.out.println("\nOperaciones: \n 1 - Detalles propiedad \n 2 - Ver UF \n 3 - Ir a UF \n 4 - Agregar UF \n 5 - Quitar UF \n " +
                    "6 - Agregar Escritura \n 7 - Agregar Planos \n 8 - Detalles Expensas \n 9 - Agregar gasto expensa \n 10 - Volver a menu principal \n ");
            int choice = Scanner.getInt("\nOperacion: ");

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
                    goToFunctionalUnit(account, aProperty);
                case 4:
                    addFunctionalUnit(account, aProperty);
                    break;
                case 5:
                    removeFunctionalUnit(account, aProperty);
                    break;
                case 6:
                    addDeed(account, aProperty);
                    break;
                case 7:
                    addBlueprint(account, aProperty);
                    break;
                case 8:
                    listExpensesDetails(account, aProperty);
                    break;
                case 9:
                    addExpense(account, aProperty);
                    break;
                case 10:
                    break mainloop;
                    default:
                        System.out.println("ERROR");
                        break;
            }
        }
    }

    private void listFunctionalUnits(Account account, Property aProperty) {
//        for (Property property : account.getProperties()) {
//            if (property.getName().equals(aProperty.getName())) {
                for (FunctionalUnit functionalUnit : aProperty.getFunctionalUnits()) {
                    System.out.println(functionalUnit.toString());
                }
//            }
//        }
    }

    private void goToFunctionalUnit(Account account, Property aProperty) {
        listFunctionalUnits(account, aProperty);
        String choice = Scanner.getString("(NOMBRE EXACTO) --> Ir a propiedad: ");
        FunctionalUnit functionalUnit = getDatabaseOps().getFunctionalUnit(choice, account, aProperty);
        new SpecificFunctionalUnitMenu().operate(account, aProperty, functionalUnit);
    }

    private void addFunctionalUnit(Account account, Property aProperty) {
        String name = Scanner.getString("\nNombre: ");
        String type = Scanner.getString("Tipo: ");
        String address = Scanner.getString("Direccion: ");
        getDatabaseOps().addFunctionalUnitToDatabase(account.getEmail(), aProperty, name, type, address);
    }

    private void removeFunctionalUnit(Account account, Property aProperty) {
        String name = Scanner.getString("\nNombre: ");
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
