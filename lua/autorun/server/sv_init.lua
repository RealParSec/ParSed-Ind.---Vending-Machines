local tableofmaterials = tableofmaterials or {}
local materialused = false

resource.AddWorkshop( "1115073625" )
resource.AddFile( "resource/fonts/prime.ttf" )
resource.AddFile( "models/rgngs_vend1/snack.mdl" )
resource.AddFile( "materials/rgngs_vend1/Material__53.vmt" )
resource.AddFile( "materials/rgngs_vend1/Material__55.vmt" )
resource.AddFile( "materials/rgngs_vend1/Material__67.vmt" )
resource.AddFile( "materials/rgngs_vend1/Material__80.vmt" )
resource.AddFile( "materials/rgngs_vend1/snack.vtf" )
resource.AddFile( "materials/rgngs_vend1/snack_dec.vtf" )
resource.AddFile( "materials/rgngs_vend1/snack_glass.vtf" )

for k, v in pairs( ragistable.config.vendingtable ) do

	for key, value in pairs( tableofmaterials ) do

		materialused = false

		if value == v[4] then

			materialused = true
			break

		end

	end

	if materialused == true then

		table.insert( tableofmaterials, v[4])
		materialused = false

	end

end

for k, v in pairs( tableofmaterials ) do

	resource.AddSingleFile( v )

end