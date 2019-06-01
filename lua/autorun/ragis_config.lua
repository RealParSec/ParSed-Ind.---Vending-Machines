/*

Coded by C4NC3R - © Copyright 2017 C4NC3R All rights reserved.

*/
ragistable = ragistable or {}
ragistable.config = ragistable.config or {}
/*
 ██████╗  ██████╗  ███╗   ██╗ ███████╗ ██╗  ██████╗ 
██╔════╝ ██╔═══██╗ ████╗  ██║ ██╔════╝ ██║ ██╔════╝ 
██║      ██║   ██║ ██╔██╗ ██║ █████╗   ██║ ██║  ███╗
██║      ██║   ██║ ██║╚██╗██║ ██╔══╝   ██║ ██║  ╚██║
╚██████╗ ╚██████╔╝ ██║ ╚████║ ██║      ██║  ██████╔╝
 ╚═════╝  ╚═════╝  ╚═╝  ╚═══╝ ╚═╝      ╚═╝  ╚═════╝ 
*/

// Maximum distance from vending machine that player has to be in the radius to actually use the entity.
ragistable.config.MaxDistance = 100 // Default: 100

// Distance at which 3D2D screens starts to fade.
ragistable.config.FadeDistance = 600 // Default: 600

// Time between purchases (in seconds).
ragistable.config.TimeDelay = 1 // Default: 1

// Color of text (RGB: { R, G, B })
ragistable.config.TextColor = { 0, 150, 0 } // Default: { 0, 150, 0 }

// Currency symbol displayed next to the price
ragistable.config.CurrencySymbol = "$" // Default: "$"

// Privileged discount switch
ragistable.config.PrivilegedSwitch = true // Default: true

// List of privileged jobs
// This will work only if you enable the privileged discount
timer.Create( "ragis_config_table_register_delay", 1, 1, function()

	ragistable.config.PrivilegedJobs = {
		TEAM_POLICE,
		TEAM_CHIEF,
		AM_MAYOR,
	}

end) 

// Discount for privileged jobs
// This value is expressed in %
// Can go from 0 - 100
// This will work only if you enable the privileged discount
ragistable.config.PrivilegedDiscount = 20 // Default: 20

// List of products in the vending machine.
// Every line should look like this { Product Place, Price, Name, image path, product entity } eg. { "A1", 100, "Printer", "resource/ragis/printer.png", "ent_printer" }
// Item image should be 600x600 png image. I recommend putting images in "materials/ragis/*here*"
// Don't go above 20 products, it wont work.

// Default icons included by us:
// ammo icon - materials/ragis/ammo.png
// food icon - materials/ragis/food.png
// printer icon - materials/ragis/printer.png
// shipment icon - materials/ragis/shipment.png
// weapon icon - materials/ragis/wep.png
ragistable.config.vendingtable = {

	{ "A1", 100, "Ammo", "materials/ragis/ammo.png", "item_ammo_357" },
	{ "A2", 100, "Ammo", "materials/ragis/ammo.png", "item_ammo_357" },
	{ "A3", 100, "Ammo", "materials/ragis/ammo.png", "item_ammo_357" },
	{ "A4", 100, "Ammo", "materials/ragis/ammo.png", "item_ammo_357" },

	{ "B1", 100, "Food", "materials/ragis/food.png", "item_ammo_357" },
	{ "B2", 100, "Food", "materials/ragis/food.png", "item_ammo_357" },
	{ "B3", 100, "Food", "materials/ragis/food.png", "item_ammo_357" },
	{ "B4", 100, "Food", "materials/ragis/food.png", "item_ammo_357" },

	{ "C1", 100, "Printer", "materials/ragis/printer.png", "item_ammo_357" },
	{ "C2", 100, "Printer", "materials/ragis/printer.png", "item_ammo_357" },
	{ "C3", 100, "Printer", "materials/ragis/printer.png", "item_ammo_357" },
	{ "C4", 100, "Printer", "materials/ragis/printer.png", "item_ammo_357" },

	{ "D1", 100, "Shipment", "materials/ragis/shipment.png", "item_ammo_357" },
	{ "D2", 100, "Shipment", "materials/ragis/shipment.png", "item_ammo_357" },
	{ "D3", 100, "Shipment", "materials/ragis/shipment.png", "item_ammo_357" },
	{ "D4", 100, "Shipment", "materials/ragis/shipment.png", "item_ammo_357" },

	{ "E1", 100, "Weapon", "materials/ragis/wep.png", "item_ammo_357" },
	{ "E2", 100, "Weapon", "materials/ragis/wep.png", "item_ammo_357" },
	{ "E3", 100, "Weapon", "materials/ragis/wep.png", "item_ammo_357" },
	{ "E4", 100, "Weapon", "materials/ragis/wep.png", "item_ammo_357" }
	
}



// ANTI BUG CODE!!! DO NOT EDIT BELOW THIS LINE!!!
--[[===========================================================================================================]]
ragistable.config.PrivilegedDiscount = math.Clamp( ragistable.config.PrivilegedDiscount, 0, 100 )