-----------------------------------------
--  Spell: Poisonga
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local effect = EFFECT_POISON;

	local duration = 60;

	local pINT = caster:getStat(MOD_INT);
	local mINT = target:getStat(MOD_INT);

	local dINT = (pINT - mINT);
	local power = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 20 + 1;
	if power > 6 then
		power = 6;
	end

    --local bonus = AffinityBonus(caster, spell:getElement()); Removed: affinity bonus is added in applyResistance
    local resist = applyResistanceEffect(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,0,effect);
    if(resist == 1 or resist == 0.5) then -- effect taken
        duration = duration * resist;

        if(target:addStatusEffect(effect,power,3,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end

    else -- resist entirely.
        spell:setMsg(85);
    end

    return effect;
end;