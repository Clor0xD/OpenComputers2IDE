---@type Slice 
local slice = {
    stackList = {       
        {
            damage = 1.0,
            maxSize = 64.0,
            hasTag = false,
            maxDamage = 0.0,
            label = 'Quite Clear Glass',
            size = 64.0,
            name = 'EnderIO:blockFusedQuartz'
        }, {
            damage = 4.0,
            maxSize = 64.0,
            hasTag = false,
            maxDamage = 0.0,
            label = 'Concrete',
            size = 64.0,
            name = 'chisel:concrete'            
        }, {
            damage = 6.0,
            maxSize = 64.0,
            hasTag = false,
            maxDamage = 0.0,
            label = 'Factory Block',
            size = 64.0,
            name = 'chisel:factoryblock'
        }, {
            damage = 10.0,
            maxSize = 64.0,
            hasTag = false,
            maxDamage = 0.0,
            label = 'Concrete',
            size = 64.0,
            name = 'chisel:concrete'          
        }, {
            damage = 0.0,
            maxSize = 64.0,
            hasTag = false,
            maxDamage = 0.0,
            label = 'Concrete',
            size = 64.0,
            name = 'chisel:concrete'          
        }
    },
    isNotUniqueStack = true,
    centerRow = 5,
    centerColumn = 7,
    isVertical = true,

    blockMap = {
        {0,0,0,0,0,1,1,1,1,0,0,0,0,0},
        {0,0,0,1,1,0,0,0,0,1,1,0,0,0},
        {0,0,1,0,0,0,0,0,0,0,0,1,0,0},
        {0,1,0,0,0,0,0,0,0,0,0,0,1,0},
        {0,1,0,0,0,0,0,0,0,0,0,0,1,0},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {0,2,3,3,4,5,5,5,5,4,3,3,2,0}
    }  
}

return slice