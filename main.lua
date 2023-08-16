local package = ...

-- called when mod is initializing
function package:init()
    -- Find all resource node land features.
    for k, feature in pairs(data.land_features) do
        if feature.frame
            and string.find(feature.frame, "resourcenode")
            -- Don't include silica trees so they can be removed.
            and not string.find(feature.frame, "tree")
            and feature.nodes then
            for k2, node in pairs(feature.nodes) do
                if node.resource then
                    for k3, resource in pairs(node.resource) do
                        -- min
                        resource[1] = 2 ^ 31 - 2
                        -- max
                        resource[2] = 2 ^ 31 - 1
                    end
                end
            end
        end
    end
end
