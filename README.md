# Some fun points of interest

##  This is based on the default Master-Default App template when creating a new project
* Separated UISplitViewController work into a basic SplitViewController class to do delegate work
* Simplified TableView in MasterViewController and AppDelegate to simply this as an example

## Attached are some gifs in "Captures" folder
* demonstration of app, shows how differently this pattern is handled on different device types
* may be similar between iPad and newer/bigger iPhones(?)

## Some implementation notes
* remark that the delegate method in SplitViewController.swift handles showing/hiding
* programmatically, we designate a self.displayModeButtonItem for work
* just like UINavigationControllers, a UIViewController has a splitViewController property. You can directly interact with the splitViewController from a contained UIViewController, with properties inside like isCollapsed
