package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.menu.form.LogInMenu;
import propertyAdmin.property.structure.FunctionalUnit;
import propertyAdmin.property.structure.Property;

public class SpecificPropertyMenu extends LogInMenu {

    public void operate(Property aProperty) {
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
                    for (FunctionalUnit functionalUnit: aProperty.getFunctionalUnits() ) {
                        System.out.println(functionalUnit.getName() + "////" + functionalUnit.getType());
                    }
                    break;
                case 3:
                    addFunctionalUnit();
                    break;
                case 4:
                    removeFunctionalUnit();
                    break;
                case 5:
                    addDeed();
                    break;
                case 6:
                    addBlueprint();
                    break;
                case 7:
                    listExpensesDetails();
                    break;
                case 8:
                    addExpense();
                    break;
                case 9:
                    break mainloop;
                    default:
                        System.out.println("ERROR");
            }
        }
    }

    private void addFunctionalUnit() {

    }

    private void removeFunctionalUnit() {

    }

    private void addDeed() {

    }

    private void addBlueprint() {
    }

    private void listExpensesDetails() {

    }

    private void addExpense() {

    }
}
