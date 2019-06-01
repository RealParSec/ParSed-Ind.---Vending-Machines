include( "shared.lua" )

local discountReverse = 1 - ( ragistable.config.PrivilegedDiscount / 100 )
local MaterialsTable = {

	Material( ragistable.config.vendingtable[1][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[2][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[3][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[4][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[5][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[6][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[7][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[8][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[9][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[10][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[11][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[12][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[13][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[14][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[15][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[16][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[17][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[18][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[19][4], "noclamp smooth" ),
	Material( ragistable.config.vendingtable[20][4], "noclamp smooth" ),

}

surface.CreateFont( "RagisFont", {
	font = "Prime",
	extended = false,
	size = 90,
	weight = 900,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function drawTexturedRectangle( x, y, w, h, m, alpha )

	surface.SetDrawColor( 255, 255, 255, alpha )
	surface.SetMaterial( m )
	surface.DrawTexturedRect( x, y, w, h )

end

local function drawOutlinedRect( x, y, w, h, c, t)

	surface.SetDrawColor( c )

	for I = 0, t - 1 do

		surface.DrawOutlinedRect( x + I, y + I, w - I * 2, h - I * 2 )

	end

end

function ENT:Initialize()

	self.CurPos = Vector( 0, 0, 0 )
	self.CurPosLocal = Vector( 0, 0, 0 )
	self.alphafade = 0
	self.alphafade = 0
	self.DelayTimer = CurTime()
	self.Discount = 1

end

function ENT:Draw()

	self:DrawModel()

	if ragistable.config.PrivilegedSwitch then

			if table.HasValue( ragistable.config.PrivilegedJobs, LocalPlayer():Team() ) then
				
				LocalPlayer().previlageDiscount = discountReverse

			else

				LocalPlayer().previlageDiscount = 1

			end
		
		end

	self.alphafade = ragistable.config.FadeDistance - self:GetPos():Distance( LocalPlayer():GetPos() ) + 255

	self.alphafade2 = math.Clamp( self.alphafade * (180/255), 0, 180)

	if self:GetPos():Distance( LocalPlayer():GetPos() ) <= ragistable.config.FadeDistance + 255 then

		cam.Start3D2D( self:LocalToWorld( Vector( 12, -17, 33 ) ), self:LocalToWorldAngles( Angle( 0, 90, 90 ) ), 0.01 )

			self.CurPos = ( ( util.IntersectRayWithPlane( LocalPlayer():EyePos(), LocalPlayer():GetAimVector(), self:LocalToWorld( Vector( 12, -17, 33 ) ), self:LocalToWorldAngles( Angle( 0, 90, 90 ) ):Up() ) ) ) or Vector( 0, 0, 0 )
			self.CurPosLocal = self:WorldToLocal( self.CurPos ) * 100 - Vector( 1200, -1700, 3300 )
			self.CurPosLocal.z = -self.CurPosLocal.z

			for k = 0, 4 do

				draw.RoundedBox( 0, 0, -100 + 900 * k, 600, 90, Color( 0, 0, 0, self.alphafade2 ))
				draw.SimpleText( ragistable.config.vendingtable[1 + k * 4][3], "RagisFont", 300, -55 + 900 * k, Color( ragistable.config.TextColor[1], ragistable.config.TextColor[2], ragistable.config.TextColor[3], self.alphafade ), 1, 1 )
				draw.RoundedBox( 0, 0, 900 * k, 600, 600, Color( 0, 0, 0, self.alphafade2 ) )
				drawTexturedRectangle( 0, 900 * k, 600, 600, MaterialsTable[1 + k * 4], self.alphafade )
				draw.RoundedBox( 0, 0, 900 * k + 610, 600, 90, Color( 0, 0, 0, self.alphafade2 ) )
				draw.SimpleText( ragistable.config.vendingtable[1 + k * 4][1].."   "..ragistable.config.vendingtable[1 + k * 4][2]*LocalPlayer().previlageDiscount..ragistable.config.CurrencySymbol, "RagisFont", 300, 900 * k + 655, Color( ragistable.config.TextColor[1], ragistable.config.TextColor[2], ragistable.config.TextColor[3], self.alphafade ), 1, 1 )

				draw.RoundedBox(0, 700, -100 + 900 * k, 600, 90, Color( 0, 0, 0, self.alphafade2 ))
				draw.SimpleText( ragistable.config.vendingtable[2 + k * 4][3], "RagisFont", 1000, -55 + 900 * k, Color( ragistable.config.TextColor[1], ragistable.config.TextColor[2], ragistable.config.TextColor[3], self.alphafade ), 1, 1 )
				draw.RoundedBox( 0, 700, 900 * k, 600, 600, Color( 0, 0, 0, self.alphafade2 ) )
				drawTexturedRectangle( 700, 900 * k, 600, 600, MaterialsTable[2 + k * 4], self.alphafade )
				draw.RoundedBox( 0, 700, 900 * k + 610, 600, 90, Color( 0, 0, 0, self.alphafade2 ) )
				draw.SimpleText( ragistable.config.vendingtable[2 + k * 4][1].."   "..ragistable.config.vendingtable[2 + k * 4][2]*LocalPlayer().previlageDiscount..ragistable.config.CurrencySymbol, "RagisFont", 1000, 900 * k + 655, Color( ragistable.config.TextColor[1], ragistable.config.TextColor[2], ragistable.config.TextColor[3], self.alphafade ), 1, 1 )

				draw.RoundedBox(0, 1400, -100 + 900 * k, 600, 90, Color( 0, 0, 0, self.alphafade2 ))
				draw.SimpleText( ragistable.config.vendingtable[3 + k * 4][3], "RagisFont", 1700, -55 + 900 * k, Color( ragistable.config.TextColor[1], ragistable.config.TextColor[2], ragistable.config.TextColor[3], self.alphafade ), 1, 1 )
				draw.RoundedBox( 0, 1400, 900 * k, 600, 600, Color( 0, 0, 0, self.alphafade2 ) )
				drawTexturedRectangle( 1400, 900 * k, 600, 600, MaterialsTable[3 + k * 4], self.alphafade )
				draw.RoundedBox( 0, 1400, 900 * k + 610, 600, 90, Color( 0, 0, 0, self.alphafade2 ) )
				draw.SimpleText( ragistable.config.vendingtable[3 + k * 4][1].."   "..ragistable.config.vendingtable[3 + k * 4][2]*LocalPlayer().previlageDiscount..ragistable.config.CurrencySymbol, "RagisFont", 1700, 900 * k + 655, Color( ragistable.config.TextColor[1], ragistable.config.TextColor[2], ragistable.config.TextColor[3], self.alphafade ), 1, 1 )

				draw.RoundedBox(0, 2100, -100 + 900 * k, 600, 90, Color( 0, 0, 0, self.alphafade2 ))
				draw.SimpleText( ragistable.config.vendingtable[4 + k * 4][3], "RagisFont", 2400, -55 + 900 * k, Color( ragistable.config.TextColor[1], ragistable.config.TextColor[2], ragistable.config.TextColor[3], self.alphafade ), 1, 1 )
				draw.RoundedBox( 0, 2100, 900 * k, 600, 600, Color( 0, 0, 0, self.alphafade2 ) )
				drawTexturedRectangle( 2100, 900 * k, 600, 600, MaterialsTable[4 + k * 4], self.alphafade )
				draw.RoundedBox( 0, 2100, 900 * k + 610, 600, 90, Color( 0, 0, 0, self.alphafade2 ) )
				draw.SimpleText( ragistable.config.vendingtable[4 + k * 4][1].."   "..ragistable.config.vendingtable[4 + k * 4][2]*LocalPlayer().previlageDiscount..ragistable.config.CurrencySymbol, "RagisFont", 2400, 900 * k + 655, Color( ragistable.config.TextColor[1], ragistable.config.TextColor[2], ragistable.config.TextColor[3], self.alphafade ), 1, 1 )

				if LocalPlayer():GetEyeTrace().Entity == self and self:GetPos():Distance( LocalPlayer():GetPos() ) <= ragistable.config.FadeDistance then

					if self.CurPosLocal.y >= 0 and self.CurPosLocal.y <= 600 and self.CurPosLocal.z >= ( 900 * k ) and self.CurPosLocal.z <= ( 600 + ( 900 * k) ) then
						
						drawOutlinedRect( 0, 900 * k, 600, 600, Color( 200, 200, 200 ), 25)

					end

					if self.CurPosLocal.y >= 700 and self.CurPosLocal.y <= 1300 and self.CurPosLocal.z >= ( 900 * k ) and self.CurPosLocal.z <= ( 600 + ( 900 * k) ) then
						
						drawOutlinedRect( 700, 900 * k, 600, 600, Color( 200, 200, 200 ), 25)

					end

					if self.CurPosLocal.y >= 1400 and self.CurPosLocal.y <= 2000 and self.CurPosLocal.z >= ( 900 * k ) and self.CurPosLocal.z <= ( 600 + ( 900 * k) ) then
						
						drawOutlinedRect( 1400, 900 * k, 600, 600, Color( 200, 200, 200 ), 25)

					end

					if self.CurPosLocal.y >= 2100 and self.CurPosLocal.y <= 2700 and self.CurPosLocal.z >= ( 900 * k ) and self.CurPosLocal.z <= ( 600 + ( 900 * k) ) then
						
						drawOutlinedRect( 2100, 900 * k, 600, 600, Color( 200, 200, 200 ), 25)

					end

				end

			end

		cam.End3D2D()

	end

end