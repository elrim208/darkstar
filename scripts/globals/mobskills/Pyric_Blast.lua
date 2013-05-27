---------------------------------------------
--  Pyric Blast
--
--  Description: Deals Fire damage to enemies within a fan-shaped area. Additional effect: Plague 
--  Type: Breath
--  Ignores Shadows
--  Range: Unknown Cone
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
   -- TODO: Used only when third/right head is alive (animationsub 0)
   return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

   local dmgmod = MobBreathMove(mob, target, 0.01, 0.1, ELE_FIRE, 200);
	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);

   MobStatusEffectMove(mob, target, EFFECT_PLAGUE, 5, 3, 60);

	target:delHP(dmg);
	return dmg;
end;