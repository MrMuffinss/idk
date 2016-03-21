if GetObjectName(myHero) ~= "Katarina" then return end

 require "Inspired"

 -- Menu
 Katarina = Menu("Katarina", "Katarina")
 -- Katarina Combo Menu
 Katarina:SubMenu("Combo", "Combo")
 Katarina.Combo:Boolean("Q", "Use Q", true)
 Katarina.Combo:Boolean("E", "Use E", true)
 Katarina.Combo:Boolean("R", "Use R", true)

 local rChan = false

OnTick(function(myHero)
if rChan == true then return end
	if IOW:Mode() == 'Combo' then
	Combo()
end
end)

 OnUpdateBuff (function(unit, buff)
 if not unit or not buff then
  return
 end
 if buff.Name == "grievouswound" then
  print("R Casting spells and movements blocked!")
  IOW.movementEnabled = false
  IOW.attacksEnabled = false
  BlockF7OrbWalk(true)
  BlockF7Dodge(true)
       rChan = true
    end
end)

OnRemoveBuff (function(unit, buff)
 if not unit or not buff then
  return
 end
 if buff.Name == "grievouswound" then
  print("R Casting spells and movements unblocked!")
  IOW.movementEnabled = true
  IOW.attacksEnabled = true
  BlockF7OrbWalk(false)
  BlockF7Dodge(false)
       rChan = false
    end
end)

function Combo()
	local unit = GetCurrentTarget()
	if Katarina.Combo.Q:Value() then
		if Ready(_Q) and ValidTarget(unit, 675) then
			CastTargetSpell(unit, _Q)
		end
	end

	if Katarina.Combo.E:Value() then
		if Ready(_E) and ValidTarget(unit, 700) and  CanUseSpell(myHero, _Q) ~= READY then
			CastTargetSpell(unit, _E)
		end
	end

	if Katarina.Combo.R:Value() then
		if Ready(_R) and ValidTarget(unit, 550) then
			CastTargetSpell(myHero, _R)
		end
	end

end

OnDraw(function()
if Ready(_E) then
  DrawCircle(myHeroPos().x,myHeroPos().y,myHeroPos().z,GetCastRange(myHero,_E),3,100,0xFFFFFFFF)
end
end)
