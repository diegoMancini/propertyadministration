package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.persons.Account;
import propertyAdmin.property.details.Blueprint;
import propertyAdmin.property.details.Deed;
import propertyAdmin.property.structure.FunctionalUnit;
import propertyAdmin.property.structure.Property;
import propertyAdmin.property.structure.specifics.BusinessPremise;
import propertyAdmin.property.structure.specifics.Garage;
import propertyAdmin.property.structure.specifics.LivingPlace;
import propertyAdmin.property.structure.specifics.Office;

public class SpecificPropertyMenu extends PropertyMenu {

    public void operate(Account account, Property aProperty) {
        mainloop:
        while (true) {
            System.out.println("\n\n-----------");
            System.out.println("\nOperaciones: \n 1 - Detalles propiedad \n 2 - Listar UF \n 3 - Ir a UF \n 4 - Agregar UF \n 5 - Quitar UF \n " +
                    "6 - Agregar Escritura \n 7 - Agregar Planos \n 8 - Agregar gasto expensa \n 9 - Detallar expensas\n 10 - Volver a menu principal \n ");
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
                    addExpense(account, aProperty);
                    break;
                case 9:
                    listExpensesDetails(account, aProperty);
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
        for (Property property : getDatabaseOps().getAccountProperties(account.getEmail())) {
            if (property.getId().equals(aProperty.getId())) {
                System.out.println("\nUnidades funcionales pertenecientes a esta propiedad: \n");
                for (FunctionalUnit functionalUnit : aProperty.getFunctionalUnits()) {
                    System.out.println(functionalUnit.toString());
                }
            }
        }
    }

    private void goToFunctionalUnit(Account account, Property aProperty) {
        listFunctionalUnits(account, aProperty);
        int choice = Scanner.getInt("\nIr a propiedad: ");
        FunctionalUnit functionalUnit = getDatabaseOps().getFunctionalUnit(choice, account, aProperty);
        new SpecificFunctionalUnitMenu().operate(account, aProperty, functionalUnit);
    }

    private void addFunctionalUnit(Account account, Property aProperty) {
        System.out.println("\nDATOS UNIDAD FUNCIONAL");
        String name = Scanner.getString("\nNombre: ");
        String type = Scanner.getString("Tipo: ");
        type = type.toLowerCase();
        String address = Scanner.getString("Direccion: ");
        FunctionalUnit functionalUnit = null;
        switch (type) {
            case "vivienda":
                functionalUnit = new LivingPlace(name, address);
                break;
            case "oficina":
                functionalUnit = new Office(name, address);
                break;
            case "local comercial":
                functionalUnit = new BusinessPremise(name, address);
                break;
            case "garage":
                functionalUnit = new Garage(name, address);
                break;
            default:
                System.out.println("AZA");
                break;
        }
        getDatabaseOps().addFunctionalUnitToDatabase(account.getEmail(), aProperty, functionalUnit);
    }

//    public void addCompleteFunctionalUnit(Account account, Property property) {
//
//    }

    private void removeFunctionalUnit(Account account, Property aProperty) {
        listFunctionalUnits(account, aProperty);
        int choice = Scanner.getInt("\nEliminar unidad funcional: ");
        FunctionalUnit functionalUnit = aProperty.getFunctionalUnits().get(choice);
        getDatabaseOps().removeFunctionalUnitFromDatabase(account.getEmail(), aProperty, functionalUnit);
    }

    private void addDeed(Account account, Property aProperty) {
        String name = Scanner.getString("\nNombre: ");
        String legalAddress = Scanner.getString("Direccion legal: ");
        Deed deed = new Deed(name, legalAddress);
        getDatabaseOps().addDeedToProperty(account.getEmail(), aProperty, deed);
    }

    private void addBlueprint(Account account, Property aProperty) {
        String name = Scanner.getString("\nNombre: ");
        Blueprint blueprint = new Blueprint(name);
        getDatabaseOps().addBlueprintToProperty(account.getEmail(), aProperty, blueprint);
    }

    private void addExpense(Account account, Property aProperty) {

    }

    private void listExpensesDetails(Account account, Property aProperty) {

    }
}
