local component = {}

component.inventory_controller = require("inventory_controller")
component.tractor_beam = require("tractor_beam")
component.tank_controller = require("tank_controller")
component.redstone = require("redstone")
component.data = require("data")
component.modem = require("modem")
component.gpu = require("gpu")
component.gt_machine = require("gt_machine")
component.transposer = require("transposer")
component.me_interface = require("me_interface")
component.database = require("database")
component.gt_batterybuffer = require("gt_batterybuffer")
component.computer = require("computer")

function component.isAvailable(componentType)

end

return component