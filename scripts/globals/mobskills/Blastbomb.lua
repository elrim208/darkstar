---------------------------------------------------
-- Blastbomb
-- Deals Fire damage in an area of effect and bind.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BIND;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
