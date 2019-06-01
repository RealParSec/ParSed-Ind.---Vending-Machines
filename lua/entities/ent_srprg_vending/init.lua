AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
 
include("shared.lua")

function ENT:SpawnFunction( ply, tr, ClassName )

	if ( !tr.Hit ) then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * 16 + Vector( 0, 0, 25 )

	local ent = ents.Create( ClassName )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()

	return ent

end
 
function ENT:Initialize()
 
 	self:SetModel( "models/rgngs_vend1/snack.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	self.DelayTimer = 0
 
	local phys = self:GetPhysicsObject()

	if phys:IsValid() then

		phys:Wake()

	end

end

local discountReverse = 1 - ( ragistable.config.PrivilegedDiscount / 100 )

function ENT:Use( a, c )

	if CurTime() <= self.DelayTimer then return end

	self.CurPos = ( ( util.IntersectRayWithPlane( c:EyePos(), c:GetAimVector(), self:LocalToWorld( Vector( 12, -17, 33 ) ), self:LocalToWorldAngles( Angle( 0, 90, 90 ) ):Up() ) ) ) or Vector( 0, 0, 0 )
	self.CurPosLocal = self:WorldToLocal( self.CurPos ) * 100 - Vector( 1200, -1700, 3300 )
	self.CurPosLocal.z = -self.CurPosLocal.z

	for k=0, 4 do

		if ragistable.config.PrivilegedSwitch then

			if table.HasValue( ragistable.config.PrivilegedJobs, c:Team() ) then
				
				c.previlageDiscount = discountReverse

			else

				c.previlageDiscount = 1

			end
		
		end
		
		if self.CurPosLocal.y >= 0 and self.CurPosLocal.y <= 600 and self.CurPosLocal.z >= ( 900 * k ) and self.CurPosLocal.z <= ( 600 + ( 900 * k) ) then

			if c:canAfford( ragistable.config.vendingtable[ 1 + ( 4 * k ) ][ 2 ] * c.previlageDiscount ) then

				c:addMoney( -ragistable.config.vendingtable[ 1 + ( 4 * k ) ][ 2 ] * c.previlageDiscount )

				local result = ents.Create( ragistable.config.vendingtable[ 1 + ( 4 * k ) ][5] )
				result:SetAngles( self:LocalToWorldAngles( Angle( 0, 0, 0 ) ) )
				result:SetPos( self:LocalToWorld( Vector( 30, 0, 0 ) ) )
				result:Spawn()

			end

		end

		if self.CurPosLocal.y >= 700 and self.CurPosLocal.y <= 1300 and self.CurPosLocal.z >= ( 900 * k ) and self.CurPosLocal.z <= ( 600 + ( 900 * k) ) then
			
			if c:canAfford( ragistable.config.vendingtable[ 2 + ( 4 * k ) ][ 2 ] * c.previlageDiscount ) then

				c:addMoney( -ragistable.config.vendingtable[ 2 + ( 4 * k ) ][ 2 ] * c.previlageDiscount )

				local result = ents.Create( ragistable.config.vendingtable[ 2 + ( 4 * k ) ][5] )
				result:SetAngles( self:LocalToWorldAngles( Angle( 0, 0, 0 ) ) )
				result:SetPos( self:LocalToWorld( Vector( 30, 0, 0 ) ) )
				result:Spawn()

			end

		end

		if self.CurPosLocal.y >= 1400 and self.CurPosLocal.y <= 2000 and self.CurPosLocal.z >= ( 900 * k ) and self.CurPosLocal.z <= ( 600 + ( 900 * k) ) then

			if c:canAfford( ragistable.config.vendingtable[ 3 + ( 4 * k ) ][ 2 ] * c.previlageDiscount ) then

				c:addMoney( -ragistable.config.vendingtable[ 3 + ( 4 * k ) ][ 2 ] * c.previlageDiscount )

				local result = ents.Create( ragistable.config.vendingtable[ 3 + ( 4 * k ) ][5] )
				result:SetAngles( self:LocalToWorldAngles( Angle( 0, 0, 0 ) ) )
				result:SetPos( self:LocalToWorld( Vector( 30, 0, 0 ) ) )
				result:Spawn()

			end

		end

		if self.CurPosLocal.y >= 2100 and self.CurPosLocal.y <= 2700 and self.CurPosLocal.z >= ( 900 * k ) and self.CurPosLocal.z <= ( 600 + ( 900 * k) ) then

			if c:canAfford( ragistable.config.vendingtable[ 4 + ( 4 * k ) ][ 2 ] * c.previlageDiscount ) then

				c:addMoney( -ragistable.config.vendingtable[ 4 + ( 4 * k ) ][ 2 ] * c.previlageDiscount )

				local result = ents.Create( ragistable.config.vendingtable[ 4 + ( 4 * k ) ][5] )
				result:SetAngles( self:LocalToWorldAngles( Angle( 0, 0, 0 ) ) )
				result:SetPos( self:LocalToWorld( Vector( 30, 0, 0 ) ) )
				result:Spawn()

			end

		end

	end

	self.DelayTimer = CurTime() + ragistable.config.TimeDelay

end