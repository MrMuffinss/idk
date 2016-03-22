if GetObjectName(myHero) ~= "Katarina" then return end

 require ("Inspired")

 -- Menu
 Katarina = Menu("Katarina", "Katarina")
 -- Katarina Combo Menu
 Katarina:SubMenu("Combo", "Combo")
 Katarina.Combo:Boolean("Q", "Use Q", true)
 Katarina.Combo:Boolean("W", "Use W", true)
 Katarina.Combo:Boolean("E", "Use E", true)
 Katarina.Combo:Boolean("R", "Use R", true)

 local rChan = false

OnTick(function(myHero)
if rChan == true then return end
 if IOW:Mode() == "Combo" then
  Combo()
 end
end)

 OnUpdateBuff (function(myHero, buff)
 if not myHero or not buff then
  return
 end
 if buff.Name == "katarinarsound" then
  print("R Casting spells and movements blocked!")
  IOW.movementEnabled = false
  IOW.attacksEnabled = false
  BlockF7OrbWalk(true)
  BlockF7Dodge(true)
       rChan = true
    end
end)

OnRemoveBuff (function(myHero, buff)
 if not myHero or not buff then
  return
 end
 if buff.Name == "katarinarsound" then
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
  if Ready(_E) and ValidTarget(unit, 700) and CanUseSpell(myHero, _Q) ~= READY then
   CastTargetSpell(unit, _E)
  end
 end

 if Katarina.Combo.W:Value() then
  if Ready(_W) and ValidTarget(unit, 375) then
   CastTargetSpell(myHero, _W)
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


if Ready(_Q) then
  DrawCircle(myHeroPos().x,myHeroPos().y,myHeroPos().z,GetCastRange(myHero,_Q),3,100,GoS.Blue)
end


if Ready(_W) then
  DrawCircle(myHeroPos().x,myHeroPos().y,myHeroPos().z,GetCastRange(myHero,_W),3,100,GoS.Green)
end

if Ready(_R) then
  DrawCircle(myHeroPos().x,myHeroPos().y,myHeroPos().z,GetCastRange(myHero,_R),3,100,GoS.Red)
end
end)
