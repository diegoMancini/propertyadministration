package propertyAdmin.app.abc;

import propertyAdmin.operations.DatabaseOps;

public abstract class Menu {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    abstract public void operate();

    public DatabaseOps getDatabaseOps() {
        return databaseOps;
    }
}
